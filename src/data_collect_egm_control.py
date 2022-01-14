# System (Default)
import sys
# Pandas (Data analysis and manipulation) [pip3 install pandas]
import pandas as pd
# Numpy (Array computing) [pip3 install numpy]
import numpy as np
# Threading (Thread-based parallelism)
import threading
# OS (Operating system interfaces)
import os
# Lib.ABB_EGM (Library for Externally Guided Motion of abb robots)
import Lib.ABB_EGM as ABB_EGM

# Input Data:
#   Robot Name: IRB1200 / CRB15000
ROBOT_NAME = 'CRB15000'
#   Save or don't save streamed values from the Robot 
#       'Cartesian' / 'Joint' or 'None'
SAVE_DATA = [True, 'Joint']

def EGM_Control_Thread_Fce(EGM_Ctrl, data):
    sequence = 0
    while sequence < len(data):
        """
        Description:
            Set data to the robot via EGM and write the data to a vector of values.
        Function:
            1\ Set_Cartesian_Data()
            2\ Set_Absolute_Joint_Data()
        """
        """
        EGM_Ctrl.Set_Cartesian_Data([data['X_Position'][sequence], data['Y_Position'][sequence], 
                                     data['Z_Position'][sequence]], 
                                    [data['Q1_Orientation'][sequence], data['Q2_Orientation'][sequence], 
                                     data['Q3_Orientation'][sequence], data['Q4_Orientation'][sequence]], SAVE_DATA[0])
        """
        EGM_Ctrl.Set_Absolute_Joint_Data([data['Joint_1'][sequence], data['Joint_2'][sequence],
                                          data['Joint_3'][sequence], data['Joint_4'][sequence],
                                          data['Joint_5'][sequence], data['Joint_6'][sequence]], SAVE_DATA[0])

        sequence = sequence + 1
    
    if SAVE_DATA[0] == True and SAVE_DATA[1] == 'Cartesian':
        # Transpose Data
        #   Time [ms]
        time_T = np.transpose(EGM_Ctrl.sd_time)
        #   Cartesian [mm]
        cartesian_position_T    = np.transpose(EGM_Ctrl.sd_cartesian_position)
        cartesian_orientation_T = np.transpose(EGM_Ctrl.sd_cartesian_orientation)
        # Heterogeneous tabular data.
        df_cartesian = pd.DataFrame([time_T, 
                                     cartesian_position_T[0], cartesian_position_T[1],
                                     cartesian_position_T[2],
                                     cartesian_orientation_T[0], cartesian_orientation_T[1],
                                     cartesian_orientation_T[2], cartesian_orientation_T[3]])
        # Transpose Data
        df = df_cartesian.T
        # Set header columns
        df_header_cartesian = ['Time', 
                               'X_Position', 'Y_Position', 'Z_Position', 
                               'Q1_Orientation', 'Q2_Orientation', 'Q3_Orientation', 
                               'Q4_Orientation']
        # Write data to a file (.txt)
        #   result_desired_cartesian_v100_z100: speed 100 mm / s, zone 100 mm
        df.to_csv(f'EGM_Results\\{ROBOT_NAME}\\result_actual_cartesian_v100_z100.txt', header=df_header_cartesian, index=None, sep=',', mode='w')
        print('[INFO] File saved successfully!')
    elif SAVE_DATA[0] == True and SAVE_DATA[1] == 'Joint':
        # Transpose Data
        #   Time [ms]
        time_T = np.transpose(EGM_Ctrl.sd_time)
        #   Absolute Joint [°]
        abs_joint_orient_T = np.transpose(EGM_Ctrl.sd_abs_joint_orientation)
        # Heterogeneous tabular data.
        df_abs_joint = pd.DataFrame([time_T, 
                                     abs_joint_orient_T[0], abs_joint_orient_T[1],
                                     abs_joint_orient_T[2], abs_joint_orient_T[3],
                                     abs_joint_orient_T[4], abs_joint_orient_T[5]])
        # Transpose Data
        df = df_abs_joint.T
        # Set header columns
        df_header_abs_joint = ['Time', 
                               'Joint_1', 'Joint_2', 'Joint_3', 
                               'Joint_4', 'Joint_5', 'Joint_6']
        # Write data to a file (.txt)
        #   result_actual_cartesian_v100_z100: speed 100 mm / s, zone 100 mm
        df.to_csv(f'EGM_Results\\{ROBOT_NAME}\\result_actual_abs_joint_v100_z100.txt', header=df_header_abs_joint, index=None, sep=',', mode='w')
        print('[INFO] File saved successfully!')

def main():
    try:
        # Read Data from the File
        current_directory_name = os.getcwd()
        # result_desired_cartesian_v100_z100 / result_desired_abs_joint_v100_z100
        FILE_NAME = f'{ROBOT_NAME}\\result_desired_abs_joint_v100_z100.txt'
        egm_res_data_desired = pd.read_csv(current_directory_name + '\\EGM_Results\\' + FILE_NAME)

        # Initialization of the Class (ABB EGM Control)
        ABB_EGM_Ctrl = ABB_EGM.Control('127.0.0.1', 6511)

        # Start Control {EGM}: Thread
        egm_thread = threading.Thread(target=EGM_Control_Thread_Fce, args=(ABB_EGM_Ctrl, egm_res_data_desired, ), daemon=True)
        egm_thread.start()

        while egm_thread.is_alive():
            egm_thread.join(0.0001)
    except KeyboardInterrupt:
        sys.exit(1)

if __name__ == "__main__":
    sys.exit(main())
