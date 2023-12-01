# System (Default)
import sys
#   Add access if it is not in the system path.
if '../../' + 'src' not in sys.path:
    sys.path.append('../../' + 'src')
# Numpy (Array computing) [pip3 install numpy]
import numpy as np
# Time (Time access and conversions)
import time
# OS (Operating system interfaces)
import os
# Custom Lib.:
#   ../Lib/EGM/Core
import Lib.EGM.Core
#   ../Lib/Transsformation/Utilities/Mathematics
import Lib.Transformation.Utilities.Mathematics as Mathematics
#   ../Lib/Trajectory/Utilities
import Lib.Trajectory.Utilities
#   ../Lib/Utilities/File_IO
import Lib.Utilities.File_IO as File_IO

"""
Description:
    Initialization of constants.
"""
# EGM time step.
CONST_DT = 0.004
# Simulation stop(t_0), start(t_1) time in seconds.
CONST_T_0 = 0.0
CONST_T_1 = 5.0

def main():
    """
    Description:
        A program to collect data obtained from the robot via EGM.

        Note 1:
            The data will be used for the analysis of the precision between the actual 
            and desired positions of the robot's joints.

        Note 2:
            The selected robot is the ABB IRB 120, a six-axis articulated robot.
    """
    
    theta_desired = []; theta_actual = []
    
    # Locate the path to the project folder.
    project_folder = os.getcwd().split('ABB_EGM_Python')[0] + 'ABB_EGM_Python'

    # Initialization of the class.
    #   Start UDP communication.
    ABB_IRB_120_EGM_Cls = Lib.EGM.Core.EGM_Control_Cls('127.0.0.1', 6511)

    # Set the actual and desired position of the robot's joints.
    theta_0 = Mathematics.Degree_To_Radian(np.array([0.0, 0.0, 0.0, 0.0, 0.0, 0.0], dtype=np.float64))
    theta_1 = Mathematics.Degree_To_Radian(np.array([50.0, -30.0, 30.0, -40.0, 60.0, -80.0], dtype=np.float64))

    # Initialization of the class to generate trajectory.
    Polynomial_Cls = Lib.Trajectory.Utilities.Polynomial_Profile_Cls(delta_time=CONST_DT)
    
    # Generation of multi-axis position trajectories from input parameters.
    theta_arr = []
    for _, (th_actual, th_desired) in enumerate(zip(theta_0, theta_1)):
        (theta_arr_i, _, _) = Polynomial_Cls.Generate(th_actual, th_desired, 0.0, 0.0, 0.0, 0.0,
                                                      CONST_T_0, CONST_T_1)
        theta_arr.append(theta_arr_i)

    # Move from the starting position to the desired position.
    #   theta_0 -> theta_1
    for _, theta_arr_i in enumerate(np.array(theta_arr, dtype=np.float64).T):
        ABB_IRB_120_EGM_Cls.Set_Absolute_Joint_Position(theta_arr_i, False)

        # Store the data.
        theta_desired.append(theta_arr_i); theta_actual.append(ABB_IRB_120_EGM_Cls.Theta)

    # Wait the required time.
    time.sleep(0.5)

    # Move back from the desired position to the starting position.
    #   theta_0 <- theta_1
    for _, theta_arr_i in enumerate(np.array(theta_arr, dtype=np.float64).T[::-1]):
        ABB_IRB_120_EGM_Cls.Set_Absolute_Joint_Position(theta_arr_i, False)
        
        # Store the data.
        theta_desired.append(theta_arr_i); theta_actual.append(ABB_IRB_120_EGM_Cls.Theta)

    # Close UDP communication.
    ABB_IRB_120_EGM_Cls.Close()

    # Save the data to a file.
    for _, (th_desired_i, th_actual_i) in enumerate(zip(theta_desired, theta_actual)):
        File_IO.Save(f'{project_folder}/Data/ABB_IRB_120/theta_desired', th_desired_i.tolist(), 'txt', ',')
        File_IO.Save(f'{project_folder}/Data/ABB_IRB_120/theta_actual', th_actual_i.tolist(), 'txt', ',')
    
if __name__ == '__main__':
    sys.exit(main())