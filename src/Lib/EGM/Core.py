"""
## =========================================================================== ## 
MIT License
Copyright (c) 2023 Roman Parak
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
## =========================================================================== ## 
Author   : Roman Parak
Email    : Roman.Parak@outlook.com
Github   : https://github.com/rparak
File Name: Core.py
## =========================================================================== ## 
"""

# Socket (Low-level networking interface)
import socket
# Egm_pb2 (Library generated by the EGM proto file)
#   Note:
#       The protobuf library needs to be installed. 
#           pip install protobuf==3.20.3
import Lib.EGM.egm_pb2 as egm_pb2
# Numpy (Array computing) [pip3 install numpy]
import numpy as np
# Typing (Support for type hints)
import typing as tp
# Custom Lib.: 
#   ../Lib/Transformation/Core
from Lib.Transformation.Core import Homogeneous_Transformation_Matrix_Cls as HTM_Cls
#   ../Lib/Transsformation/Utilities/Mathematics
import Lib.Transformation.Utilities.Mathematics as Mathematics

"""
Description: 
    - EGM (Externally Guided Motion) is an interface for ABB robots that allows smoothness control of the robot 
      arm from an external application. 
    - EGM can also be used to stream current positions from the robot in either joint/cartesian 
      space.  
    - The application communicates with the ABB robot via UDP (User Datagram Protocol).

    Note:
        For more detailed information on EGMs, please refer to the application guide on the ABB website.
"""

"""
Description:
    Initialization of constants.
"""
CONST_BUFSIZE = 2**16

class EGM_Control_Cls(object):
    """
    Description:
        A class to control an articulated robotic arm through the use of Externally Guided 
        Motion (EGM) within ABB RobotStudio.

            Note:
                The IP address and port number of the UDP server will be set 
                in the ABB RobotStudio settings.

    Initialization of the Class:
        Args:
            (1) id_address [string]: The IP address of the UDP server.
            (2) port_number [INT]: The port number of the UDP server.

        Example:
            Initialization:
                # Assignment of the variables.
                id_address = '127.0.0.1'
                port_number = 6511

                # Initialization of the class.
                Cls = EGM_Control_Cls(id_address, port_number)

            Features:
                # Properties of the class.
                Cls.Time
                ...
                Cls.Theta, Cls.T_EE

                # Functions of the class.
                Cls.Set_Absolute_Joint_Position()
    """

    def __init__(self, id_address: str = '127.0.0.1', port_number: int = 6511):
        try:
            # Create a UDP client to communicate with the ABB RobotStudio 
            # application.
            self.__udp_client = socket.socket(socket.AF_INET, 
                                              socket.SOCK_DGRAM)
            self.__udp_client.bind((id_address, port_number))
        except socket.error as e:
            print(f'[ERROR] Information: {e}')
            print('[ERROR] An error occurred while creating the socket. The IP address or port was incorrectly entered.')

        # The structure of the sensor message for reading the data.
        self.__sensor_message_r = egm_pb2.EgmRobot()

        # The data to be obtained (streamed) from the robot.
        #   The actual machine time (Timestamp) in milliseconds.
        self.__t = 0.0
        #   Homogeneous transformation matrix of the End-Effector.
        self.__T_EE = HTM_Cls(None, np.float64)
        #   Absolute position of the joint in radians.
        self.__theta = []

    @property
    def Time(self) -> float:
        """
        Description:
            Get the actual machine time (Timestamp) in milliseconds.

            Note:
                The time is set within a software ABB RobotStudio.
                    See function "EGMActJoint".
                        \SampleRate:={value in ms}

        Returns:
            (1) parameter [float]: The actual machine time in milliseconds.
        """
                
        return self.__t

    @property
    def Theta(self) -> tp.List[float]:
        """
        Description:
            Get the absolute positions of the robot's joints.

        Returns:
            (1) parameter [Vector<float> 1xn]: Current absolute joint position in radians.
                                                Note:
                                                    Where n is the number of joints.
        """
                
        return Mathematics.Degree_To_Radian(self.__theta)

    @property
    def T_EE(self) -> tp.List[tp.List[float]]:
        """
        Description:
            Get the homogeneous transformation matrix of the robot end-effector.

        Returns:
            (1) parameter [Matrix<float> 4x4]: Homogeneous transformation matrix of the End-Effector.
        """
                
        return self.__T_EE
    
    def Close(self) -> None:
        """
        Description:
            A function to close UDP communication.
        """

        self.__udp_client.close()

    def __Send_Sensor_Message(self, theta: tp.List[float], enable_external_joint: bool, end_point: tp.Tuple[str, int]) -> None:
        """
        Description:
            Function to send data to the robot.

        Args:
            (1) theta [Vector<float> 1xn]: Desired absolute joint position in radians.
                                            Note:
                                                Where n is the number of joints.
            (2) enable_external_joint [bool]: Information about whether or not the robot has an external joint.
            (3) end_point [Tuple(string, int)]: Represents the network endpoint as an IP address 
                                                and port number.
        """

        try:
            # The structure of the sensor message for reading the data.
            sensor_message = egm_pb2.EgmSensor()

            # Sent by the sensor, MSGTYPE_DATA if sent from the robot controller.
            egm_header = sensor_message.header
            egm_header.mtype = egm_pb2.EgmHeader.MessageType.MSGTYPE_CORRECTION

            # Binding the planned data in the form of absolute robot joints to the sensor object.
            egm_planned = sensor_message.planned
            if enable_external_joint == True:
                egm_planned.joints.joints.extend(theta[0:-1])
                egm_planned.externalJoints.joints.extend([theta[-1]])
            else:
                egm_planned.joints.joints.extend(theta)
 
            # Serialize the data to be sent.
            data = sensor_message.SerializeToString()

            # Sending the created message to the robot, which includes the desired absolute 
            # position of the robot's joints via UDP.
            self.__udp_client.sendto(data, end_point)

        except socket.error as e:
            print(f'[ERROR] Information: {e}')
            print('[ERROR] An error occurred while sending the socket.')

    def Set_Absolute_Joint_Position(self, theta: tp.List[float], enable_external_joint: bool) -> None:
        """
        Description:
            Set the absolute position of the robot joints.

            Note:
                The function also reads data (cartesian, joints, etc.) from the robot.

        Args:
            (1) theta [Vector<float> 1xn]: Desired absolute joint position in radians.
                                            Note:
                                                Where n is the number of joints.
            (2) enable_external_joint [bool]: Information about whether or not the robot has an external joint.
        """
                
        try:
            # Obtain the data from the robot via UDP.
            #   Note:
            #       data: A byte-type array that contains the datagram data.
            #       end_point: Represents the network endpoint as an IP address 
            #                  and port number.
            (data, end_point) = self.__udp_client.recvfrom(CONST_BUFSIZE)

            if data is not None:
                # Parse the information from the collected data.
                self.__sensor_message_r.ParseFromString(data)

                # Express the actual machine time.
                self.__t = self.__sensor_message_r.header.tm

                # Express the actual position and orientation of the tool center point (TCP).
                #   Position: p = x, y, z in millimeters.
                p = np.array([self.__sensor_message_r.feedBack.cartesian.pos.x, 
                              self.__sensor_message_r.feedBack.cartesian.pos.y, 
                              self.__sensor_message_r.feedBack.cartesian.pos.z], dtype=np.float64)
                #   Orientation: q = w, x, y, z in [-] -> [-1.0, 1.0].
                q = np.array([self.__sensor_message_r.feedBack.cartesian.orient.u0, 
                              self.__sensor_message_r.feedBack.cartesian.orient.u1,
                              self.__sensor_message_r.feedBack.cartesian.orient.u2, 
                              self.__sensor_message_r.feedBack.cartesian.orient.u3], dtype=np.float64)
                
                # Express the obtained parameters as a homogeneous transformation matrix.
                self.__T_EE = HTM_Cls(None, np.float64).Rotation(q, 'QUATERNION').Translation(p)

                # Express the absolute positions of the robot's joints.
                if enable_external_joint == True:
                    self.__theta = np.append(np.array(self.__sensor_message_r.feedBack.joints.joints, dtype=np.float64),
                                             np.array(self.__sensor_message_r.feedBack.externalJoints.joints, dtype=np.float64))
                else:
                    self.__theta = np.array(self.__sensor_message_r.feedBack.joints.joints, dtype=np.float64)

                # Send data to the robot.
                self.__Send_Sensor_Message(Mathematics.Radian_To_Degree(theta), enable_external_joint, end_point)

        except socket.error as e:
            print(f'[ERROR] Information: {e}')
            print('[ERROR] An error occurred while receiving the socket.')