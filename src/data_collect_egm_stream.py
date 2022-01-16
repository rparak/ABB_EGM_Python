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
File Name: data_collect_egm_stream.py
## =========================================================================== ## 
"""

# System (Default)
import sys
# Pandas (Data analysis and manipulation) [pip3 install pandas]
import pandas as pd
# Numpy (Array computing) [pip3 install numpy]
import numpy as np
# Threading (Thread-based parallelism)
import threading
# Lib.ABB_EGM (Library for Externally Guided Motion of abb robots)
import Lib.ABB_EGM as ABB_EGM

# Input Data:
#   Robot Name: IRB1200 / CRB15000
ROBOT_NAME = 'CRB15000'
#   Save or don't save streamed values from the Robot 
#       'Cartesian' / 'Joint' or 'None'
SAVE_DATA = [False, 'None']

def EGM_Stream_Thread_Fce(EGM_Stream):
    # The value {is_alive} is true if the communication is OK and the
    # robot can read the data.
    is_alive = True
    while is_alive:
        """
        Description:
            Get data from the robot via EGM and write the data to a vector of values.
        Function:
            1\ Get_Cartesian_Data()
            2\ Get_Absolute_Joint_Data()
        """
        is_alive = EGM_Stream.Get_Cartesian_Data()

def main():
    try:
        # Initialization of the Class (ABB EGM Stream)
        ABB_EGM_Stream = ABB_EGM.Stream('127.0.0.1', 6511)

        # Start Stream {EGM}: Thread
        egm_thread = threading.Thread(target=EGM_Stream_Thread_Fce, args=(ABB_EGM_Stream, ), daemon=True)
        egm_thread.start()

        while egm_thread.is_alive():
            egm_thread.join(0.0001)

    except KeyboardInterrupt:
        if SAVE_DATA[0] == True and SAVE_DATA[1] == 'Cartesian':
            # Transpose Data
            #   Time [ms]
            time_T = np.transpose(ABB_EGM_Stream.sd_time)
            #   Cartesian [mm]
            cartesian_position_T    = np.transpose(ABB_EGM_Stream.sd_cartesian_position)
            cartesian_orientation_T = np.transpose(ABB_EGM_Stream.sd_cartesian_orientation)
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
            df.to_csv(f'EGM_Results\\{ROBOT_NAME}\\result_desired_cartesian_v100_z100.txt', header=df_header_cartesian, index=None, sep=',', mode='w')
            print('[INFO] File saved successfully!')
        elif SAVE_DATA[0] == True and SAVE_DATA[1] == 'Joint':
            # Transpose Data
            #   Time [ms]
            time_T = np.transpose(ABB_EGM_Stream.sd_time)
            #   Absolute Joint [°]
            abs_joint_orient_T = np.transpose(ABB_EGM_Stream.sd_abs_joint_orientation)
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
            #   result_desired_abs_joint_v100_z100: speed 100 mm / s, zone 100 mm
            df.to_csv(f'EGM_Results\\{ROBOT_NAME}\\result_desired_abs_joint_v100_z100.txt', header=df_header_abs_joint, index=None, sep=',', mode='w')
            print('[INFO] File saved successfully!')
        sys.exit(1)

if __name__ == "__main__":
    sys.exit(main())
