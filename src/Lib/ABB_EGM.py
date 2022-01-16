"""
## =========================================================================== ## 
MIT License
Copyright (c) 2021 Roman Parak
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
File Name: ABB_EGM.py
## =========================================================================== ## 
"""

# socket (Low-level networking interface)
import socket
# Egm_pb2 (Library generated by the EGM proto file)
import Lib.egm_pb2 as egm_pb2

"""
ABB EGM Notes: 
    - EGM (Externally Guided Motion) is an interface for ABB robots that allows smoothness control of the robot 
      arm from an external application. 
    - EGM can also be used to stream current positions from the robot in either joint/cartesian 
      space.  
    - The application communicates with the ABB robot via UDP (User Datagram Protocol)

For more detailed information on EGMs, please refer to the application guide on the ABB website.
"""

# Initialization of constants
CONST_BUFSIZE = 2**16
#   Position vector size (X, Y, Z)
CONST_CARTESIAN_POSITION = 3
#   Orientation vector size (Quaternion{Q1 .. Q4})
CONST_CARTESIAN_ORIENTATION = 4
#   Joint vector size (Joint{J1 .. J6})
CONST_NUM_OF_JOINTS = 6

class Control(object):
    """
    Description:
        A class for controlling and streaming a robot via EGM.

    Initialization of the Class:
        Args:
            (1) id_address [string]: IP Address of the UDP server.
            (2) port_number [INT]: Robot Port (Set from the RobotStudio ABB).
        
        Example:
            Initialization:
                Cls = ABB_EGM.Control('127.0.0.1', 6511)

            Control:
                Cls.Set_Absolute_Joint_Data(position = [0.0, 0.0, 0.0], orientation = [0.0, 0.0, 0.0, 0.0], collect_data = True)
                or
                Cls.Set_Absolute_Joint_Data(position = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0], collect_data = True)

            Returns (when the value of the collection data is equal to True):
                # Time [ms]
                Cls.sd_time
                ...
                # {vector_name} [ms, mm, °,..]
                Cls.{vector_name} # The names are found in the public variables of the class.
    """
    def __init__(self, id_address = '127.0.0.1', port_number=6511, collect_data = False):
        # << PUBLIC >> #
        # Stream Data:
        #   Time [ms]
        self.sd_time = []
        #   Cartesian [mm]
        self.sd_cartesian_position    = []
        self.sd_cartesian_orientation = []
        #   Joint [°]
        self.sd_abs_joint_orientation = []

        # << PRIVATE >> #
        try:
            """
            Description:
                Create an udp server and listen on ip address and the port
                {ABB Robot Port is set from the RobotStudio ABB}
            """
            self.__udp_client = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
            self.__udp_client.bind((id_address, port_number))
        except socket.error as e:
            print(f'[ERROR] Error creating socket: {e}')
        
        # Represents a network endpoint as an IP address and a port number
        self.__end_point = None
        # A byte type array that contains the datagram data
        self.__data = None
        
        # Control Data:
        #   Cartesian [mm]
        self.__cd_cartesian_position    = [0.0] * CONST_CARTESIAN_POSITION
        self.__cd_cartesian_orientation = [0.0] * CONST_CARTESIAN_ORIENTATION
        #   Joint [°]
        self.__cd_abs_joint_orientation = [0.0] * CONST_NUM_OF_JOINTS

    def Set_Cartesian_Data(self, position = [0.0, 0.0, 0.0], orientation = [0.0, 0.0, 0.0, 0.0], collect_data = False):
        """
        Description:
            Function to set the Cartesian data of the robot through the EGM and write the data to a vector of values 
            defined in the public class variables.

        Args:
            (1) position [Float Vector]: Position vector size (X, Y, Z).
            (2) orientation [Float Vector]: Orientation vector size (Quaternion{Q1 .. Q4})
            (3) collect_data [Bool]: Data collection during robot control.
        """
        try:
            self.__cd_cartesian_position    = position
            self.__cd_cartesian_orientation = orientation

            # Get the data from the robot
            (self.__data, self.__end_point) = self.__udp_client.recvfrom(CONST_BUFSIZE)

            if self.__data is not None:
                if collect_data == True:
                    # Read Data to the Robot
                    robot_msg = egm_pb2.EgmRobot()
                    robot_msg.ParseFromString(self.__data)

                    # Data Collection:
                    #   Time [ms]
                    self.sd_time.append(robot_msg.header.tm)
                    #   TCP Position [mm]
                    self.sd_cartesian_position.append([robot_msg.feedBack.cartesian.pos.x, robot_msg.feedBack.cartesian.pos.y, 
                                                    robot_msg.feedBack.cartesian.pos.z])
                    #   Quaternion Orientation [-]
                    self.sd_cartesian_orientation.append([robot_msg.feedBack.cartesian.orient.u0, robot_msg.feedBack.cartesian.orient.u1,
                                                        robot_msg.feedBack.cartesian.orient.u2, robot_msg.feedBack.cartesian.orient.u3])

                # Send Data to the Robot
                self.__Sensor_Message_Cartesian()
        except socket.error as e:
            print(f'[ERROR] Error receiving data: {e}')

    def Set_Absolute_Joint_Data(self, orientation = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0], collect_data = False):
        """
        Description:
            Function to set the Joint data of the robot through the EGM and write the data to a vector of values 
            defined in the public class variables.

        Args:
            (1) orientation [Float Vector]: Joint vector size (Joint{J1 .. J6}).
            (2) collect_data [Bool]: Data collection during robot control.
        """

        try:
            self.__cd_abs_joint_orientation = orientation

            # Get the data from the robot
            (self.__data, self.__end_point) = self.__udp_client.recvfrom(CONST_BUFSIZE)

            if self.__data is not None:
                if collect_data == True:
                    # Read Data to the Robot
                    robot_msg = egm_pb2.EgmRobot()
                    robot_msg.ParseFromString(self.__data)

                    # Data Collection:
                    #   Time [ms]
                    self.sd_time.append(robot_msg.header.tm)
                    #   Absolute Position of the Joints [°]
                    self.sd_abs_joint_orientation.append(robot_msg.feedBack.joints.joints)

                # Send Data to the Robot
                self.__Sensor_Message_Absolute_Joint()
        except socket.error as e:
            print(f'[ERROR] Error receiving data: {e}')

    def __Sensor_Message_Cartesian(self):
        """
        Description:
            Function to write defined data (Cartesian Space) to the ABB robot.
        """

        # Create a new EGM sensor message
        egm_s = egm_pb2.EgmSensor()

        # Create a header
        egm_hdr = egm_s.header
        # SetMtype: Sent by sensor, MSGTYPE_DATA if sent from robot controller
        egm_hdr.mtype = egm_pb2.EgmHeader.MessageType.Value('MSGTYPE_CORRECTION')

        # Bind planned to sensor object
        egm_planned = egm_s.planned
        # Set Data {Cartesian}
        egm_planned.cartesian.pos.x = self.__cd_cartesian_position[0]
        egm_planned.cartesian.pos.y = self.__cd_cartesian_position[1]
        egm_planned.cartesian.pos.z = self.__cd_cartesian_position[2]
        egm_planned.cartesian.orient.u0 = self.__cd_cartesian_orientation[0]
        egm_planned.cartesian.orient.u1 = self.__cd_cartesian_orientation[1]
        egm_planned.cartesian.orient.u2 = self.__cd_cartesian_orientation[2]
        egm_planned.cartesian.orient.u3 = self.__cd_cartesian_orientation[3]
        
        # Sensor Message
        memory_stream = egm_s.SerializeToString()

        try:
            # Send message to the ABB ROBOT {UDP}
            self.__udp_client.sendto(memory_stream, self.__end_point)
        except socket.error as e:
            print(f'[ERROR] Error sending data: {e}')

    def __Sensor_Message_Absolute_Joint(self):
        """
        Description:
            Function to write defined data (Joint Space) to the ABB robot.
        """
        # Create a new EGM sensor message
        egm_s = egm_pb2.EgmSensor()

        # Create a header
        egm_hdr = egm_s.header
        # SetMtype: Sent by sensor, MSGTYPE_DATA if sent from robot controller
        egm_hdr.mtype = egm_pb2.EgmHeader.MessageType.Value('MSGTYPE_CORRECTION')

        # Bind planned to sensor object
        egm_planned = egm_s.planned
        # Set Data {Cartesian}
        egm_planned.joints.joints.extend(self.__cd_abs_joint_orientation)

        # Sensor Message
        memory_stream = egm_s.SerializeToString()

        try:
            # Send message to the ABB ROBOT {UDP}
            self.__udp_client.sendto(memory_stream, self.__end_point)
        except socket.error as e:
            print(f'[ERROR] Error sending data: {e}')


class Stream(object):
    """
    Description:
        A class for streaming a robot via EGM.
    
    Initialization of the Class:
        Args:
            (1) id_address [string]: IP Address of the UDP server.
            (2) port_number [INT]: Robot Port (Set from the RobotStudio ABB).
        
        Example:
            Initialization:
                Cls = ABB_EGM.EGM_Stream('127.0.0.1', 6511)

            Stream:
                # The value {is_alive} is true if the communication is OK and the robot can read the data.
                is_alive = Cls.Get_Cartesian_Data()
                or
                is_alive = Cls.Get_Absolute_Joint_Data()

            Returns:
                # Time [ms]
                Cls.sd_time
                ...
                # {vector_name} [ms, mm, °,..]
                Cls.{vector_name} # The names are found in the public variables of the class.
    """
    def __init__(self, id_address = '127.0.0.1', port_number=6511):
        # << PUBLIC >> #
        # Stream Data:
        #   Time [ms]
        self.sd_time = []
        #   Cartesian [mm]
        self.sd_cartesian_position    = []
        self.sd_cartesian_orientation = []
        #   Joint [°]
        self.sd_abs_joint_orientation = []

        # << PRIVATE >> #
        try:
            """
            Description:
                Create an udp server and listen on any address and the port
                {ABB Robot Port is set from the RobotStudio ABB}
            """
            self.__udp_client = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
            self.__udp_client.bind((id_address, port_number))
        except socket.error as e:
            print(f'[ERROR] Error creating socket: {e}')

        # Represents a network endpoint as an IP address and a port number
        self.__end_point = None
        # A byte type array that contains the datagram data
        self.__data = None

    def Get_Cartesian_Data(self):
        """
        Description:
            A function to obtain Cartesian data from the robot via EGM and write the data to a vector of values 
            defined in public class variables.
        
        Returns:
            (1) parameter [BOOL]: Signalling a problem in communication. True if successful, False if errors occurred.
        """
        try:
            # Get the data from the robot
            (self.__data, self.__end_point) = self.__udp_client.recvfrom(CONST_BUFSIZE)
            
            if self.__end_point is not None:
                # Read Data to the Robot
                robot_msg = egm_pb2.EgmRobot()
                robot_msg.ParseFromString(self.__data)
                print(robot_msg.header.tm)
                # Data Collection:
                #   Time [ms]
                self.sd_time.append(robot_msg.header.tm)
                #   TCP Position [mm]
                self.sd_cartesian_position.append([robot_msg.feedBack.cartesian.pos.x, robot_msg.feedBack.cartesian.pos.y, 
                                                   robot_msg.feedBack.cartesian.pos.z])
                #   Quaternion Orientation [-]
                self.sd_cartesian_orientation.append([robot_msg.feedBack.cartesian.orient.u0, robot_msg.feedBack.cartesian.orient.u1,
                                                     robot_msg.feedBack.cartesian.orient.u2, robot_msg.feedBack.cartesian.orient.u3])
                return True
        except socket.error as e:
            print(f'[ERROR] Error receiving data: {e}')
            return False

    def Get_Absolute_Joint_Data(self):
        """
        Description:
            A function to obtain Joint data from the robot via EGM and write the data to a vector of values 
            defined in public class variables.

        Returns:
            (1) parameter [BOOL]: Signalling a problem in communication. True if successful, False if errors occurred.
        """

        try:
            # Get the data from the robot
            (self.__data, self.__end_point) = self.__udp_client.recvfrom(CONST_BUFSIZE)

            if self.__end_point is not None:
                # Read Data to the Robot
                robot_msg = egm_pb2.EgmRobot()
                robot_msg.ParseFromString(self.__data)

                # Data Collection:
                #   Time [ms]
                self.sd_time.append(robot_msg.header.tm)
                #   Absolute Position of the Joints [°]
                self.sd_abs_joint_orientation.append(robot_msg.feedBack.joints.joints)

                return True
        except socket.error as e:
            print(f'[ERROR] Error receiving data: {e}')
            return False
