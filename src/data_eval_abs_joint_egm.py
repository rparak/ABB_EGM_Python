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
File Name: data_eval_abs_joint_egm.py
## =========================================================================== ## 
"""

# System (Default)
import sys
# Pandas (Data analysis and manipulation) [pip3 install pandas]
import pandas as pd
# Numpy (Array computing) [pip3 install numpy]
import numpy as np
# Matplotlib (Visualization) [pip3 install matplotlib]
import matplotlib.pyplot as plt
# OS (Operating system interfaces)
import os

def main():
    # Robot Name: IRB1200 / CRB15000
    ROBOT_NAME = 'IRB1200'

    # File names in the EGM_Results folder
    RESULT_DESIRED_DATA_PATH_NAME = 'result_desired_abs_joint_v100_z100'
    RESULT_ACTUAL_DATA_PATH_NAME  = 'result_actual_abs_joint_v100_z100'

    # Read Data from the File (EGM_Results Folder)
    current_directory_name = os.getcwd()
    column_headings = ['Time',
                       'Joint_1','Joint_2','Joint_3',
                       'Joint_4','Joint_5','Joint_6']
    egm_res_data_desired = pd.read_csv(current_directory_name + '\\EGM_Results\\' + ROBOT_NAME + '\\' + RESULT_DESIRED_DATA_PATH_NAME + '.txt', names=column_headings)
    egm_res_data_actual  = pd.read_csv(current_directory_name + '\\EGM_Results\\' + ROBOT_NAME + '\\' + RESULT_ACTUAL_DATA_PATH_NAME + '.txt', names=column_headings)

    # Assign data to variables:
    #   Time [ms]
    desired_time = np.double(egm_res_data_desired['Time'][1:])
    actual_time  = np.double(egm_res_data_actual['Time'][1:])
    #   Position [mm]
    desired_orientation = [np.double(egm_res_data_desired['Joint_1'][1:]), np.double(egm_res_data_desired['Joint_2'][1:]), 
                           np.double(egm_res_data_desired['Joint_3'][1:]), np.double(egm_res_data_desired['Joint_4'][1:]),
                           np.double(egm_res_data_desired['Joint_5'][1:]), np.double(egm_res_data_desired['Joint_6'][1:])]
    actual_orientation  = [np.double(egm_res_data_actual['Joint_1'][1:]), np.double(egm_res_data_actual['Joint_2'][1:]),
                           np.double(egm_res_data_actual['Joint_3'][1:]), np.double(egm_res_data_actual['Joint_4'][1:]),
                           np.double(egm_res_data_actual['Joint_5'][1:]), np.double(egm_res_data_actual['Joint_6'][1:])]

    ax_vector = [0]*len(desired_orientation)

    # Create figure with multiple subplots
    figure, (ax_vector) = plt.subplots(len(ax_vector), 1)
    figure.suptitle(f'Path Name: Experiment 1 (Absolute Joint Orientation)\n[Speed: v100 mm/s & v100 °/s, Zone: z100]', fontsize = 15)

    AXIS_NAME = ['J1', 'J2', 'J3', 'J4', 'J5', 'J6']
    for i, (ax, desired, actual) in enumerate(zip(ax_vector, desired_orientation, actual_orientation)):
        ax.set_ylim([np.minimum.reduce([np.minimum.reduce(desired), np.minimum.reduce(actual)]) - 10.0, 
                            np.maximum.reduce([np.maximum.reduce(desired), np.maximum.reduce(actual)]) + 10.0])
        ax.plot(actual_time, desired, label=f'Desired Orientation')
        ax.plot(actual_time, actual, label=f'Actual Orientation')
        ax.grid(linewidth = 0.75, linestyle = '--')
        ax.set_xlabel(r'Time [ms]')
        ax.set_ylabel(f'{AXIS_NAME[i]} (deg)')
        ax.legend()

    # Display the result
    plt.show()

if __name__ == '__main__':
    sys.exit(main())
