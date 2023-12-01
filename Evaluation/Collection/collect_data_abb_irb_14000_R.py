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
#   ...
import Lib.EGM.Core
#   ../Lib/Transsformation/Utilities/Mathematics
import Lib.Transformation.Utilities.Mathematics as Mathematics
#   ../Lib/Trajectory/Utilities
import Lib.Trajectory.Utilities

"""
Description:
    Initialization of constants.
"""
# Simulation stop(t_0), start(t_1) time in seconds.
CONST_T_0 = 0.0
CONST_T_1 = 2.0

def main():
    """
    Description:
        ...
    """
    
    # ...
    ABB_IRB_14000_L_EGM_Cls = Lib.EGM.Core.EGM_Control_Cls('127.0.0.1', 6511)

    # Initialization of the class to generate trajectory.
    Polynomial_Cls = Lib.Trajectory.Utilities.Polynomial_Profile_Cls(delta_time=0.004)
    
    # ....
    theta_0 = Mathematics.Degree_To_Radian(np.array([0.0, -130.0, 30.0, 0.0, 40.0, 0.0, -135.0], dtype=np.float64))
    theta_1 = Mathematics.Degree_To_Radian(np.array([75.0556,-142.5,59.1416,-171.923,103.913,13.9756,-67.7383], dtype=np.float64))

    # Generation of multi-axis position trajectories from input parameters.
    theta_arr = []
    for _, (th_actual, th_desired) in enumerate(zip(theta_0, theta_1)):
        (theta_arr_i, _, _) = Polynomial_Cls.Generate(th_actual, th_desired, 0.0, 0.0, 0.0, 0.0,
                                                      CONST_T_0, CONST_T_1)
        theta_arr.append(theta_arr_i)

    # ...
    for _, theta_arr_i in enumerate(np.array(theta_arr, dtype=np.float64).T):
        ABB_IRB_14000_L_EGM_Cls.Set_Absolute_Joint_Position(theta_arr_i, True)

    # ...
    time.sleep(1.0)

    """
    # ...
    for _, theta_arr_i in enumerate(np.array(theta_arr, dtype=np.float64).T[::-1]):
        ABB_IRB_14000_L_EGM_Cls.Set_Absolute_Joint_Position(theta_arr_i, True)
    """
    
    # ...
    ABB_IRB_14000_L_EGM_Cls.Close()
    
if __name__ == '__main__':
    sys.exit(main())