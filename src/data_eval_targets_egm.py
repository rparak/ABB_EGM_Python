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
File Name: data_eval_targets_egm.py
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
# IO (Core tool for working with streams)
from io import StringIO
# OS (Operating system interfaces)
import os

def main():
    # Robot Name: IRB1200 / CRB15000
    ROBOT_NAME = 'IRB1200'

    # File names in the EGM_Results folder
    RESULT_DESIRED_DATA_PATH_NAME = 'result_desired_cartesian_v100_z100'
    RESULT_ACTUAL_DATA_PATH_NAME  = 'result_actual_cartesian_v100_z100'

    # Path visibility
    visible_target, visible_desired_pos, visible_actual_pos = True, True, True

    # Read Data from the File (EGM_Results Folder)
    current_directory_name = os.getcwd()
    column_headings = ['Time',
                       'X_Position','Y_Position',
                       'Z_Position',
                       'Q1_Orientation','Q2_Orientation',
                       'Q3_Orientation','Q4_Orientation']
    egm_res_data_desired = pd.read_csv(current_directory_name + '\\EGM_Results\\' + ROBOT_NAME + '\\' + RESULT_DESIRED_DATA_PATH_NAME + '.txt', names=column_headings)
    egm_res_data_actual  = pd.read_csv(current_directory_name + '\\EGM_Results\\' + ROBOT_NAME + '\\' + RESULT_ACTUAL_DATA_PATH_NAME + '.txt', names=column_headings)

    # Assign data to variables:
    #   Time [ms]
    desired_time = np.double(egm_res_data_desired['Time'][1:])
    actual_time  = np.double(egm_res_data_actual['Time'][1:])
    #   Position [mm]
    desired_position = [np.double(egm_res_data_desired['X_Position'][1:]), np.double(egm_res_data_desired['Y_Position'][1:]), 
                           np.double(egm_res_data_desired['Z_Position'][1:])]
    actual_position  = [np.double(egm_res_data_actual['X_Position'][1:]), np.double(egm_res_data_actual['Y_Position'][1:]), 
                          np.double(egm_res_data_actual['Z_Position'][1:])]
    #   Orientation [-]
    desired_orientation = [np.double(egm_res_data_desired['Q1_Orientation'][1:]), np.double(egm_res_data_desired['Q2_Orientation'][1:]), 
                           np.double(egm_res_data_desired['Q3_Orientation'][1:]), np.double(egm_res_data_desired['Q3_Orientation'][1:])]
    actual_orientation  = [np.double(egm_res_data_actual['Q1_Orientation'][1:]), np.double(egm_res_data_actual['Q2_Orientation'][1:]), 
                          np.double(egm_res_data_actual['Q3_Orientation'][1:]), np.double(egm_res_data_actual['Q3_Orientation'][1:])]

    # Read Data from the File (Targets Folder)
    with open(current_directory_name + '\\Targets\\Experiment_1.txt') as file:
        target_data = file.read()

    # Remove unnecessary symbols
    for symbol in ['CONST robtarget ',':=[[', '],[', '9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];', ',,']:
        if symbol in target_data:
            target_data = target_data.replace(symbol,',')

    # Sort data
    target_data_sort = pd.read_csv(StringIO(target_data), names=['None1','Target Name', 'X', 'Y', 'Z', 'Q1', 'Q2', 'Q3', 'Q4', 'CF1', 'CF4', 'CF6', 'CFX', 'None2'])
    target_data_sort = target_data_sort.drop(columns=['None1', 'None2'])

    # Assign data to variables
    #   Position [mm]
    target_position = [target_data_sort['X'], target_data_sort['Y'], target_data_sort['Z']]

    # Create figure for 3d projection
    figure = plt.figure()
    axis   = figure.add_subplot(projection='3d')
    figure.suptitle(f'Path Name: Experiment 1 (Position)\n[Speed: v100 mm/s & v100 °/s, Zone: z100]', fontsize = 15)

    # Display of the connected path with landmarks
    if visible_target == True: axis.plot(target_position[0],target_position[1],target_position[2], 'o--', color=[0.0,0.0,0.0,0.25], label=r'Targets')
    # Display Desired position (X, Y, Z)
    if visible_desired_pos == True: axis.plot(desired_position[0], desired_position[1], desired_position[2], color=[0.2,0.4,0.6], label=r'Desired Position')
    # Display Actual position (X, Y, Z)
    if visible_actual_pos == True: axis.plot(actual_position[0], actual_position[1], actual_position[2], color=[0.8,0.4,0], label=r'Actual Position')

    # Axis Parameters:
    #   Limits
    axis.set_xlim(np.minimum.reduce(target_position[0]) - 10, np.maximum.reduce(target_position[0]) + 10)
    axis.set_ylim(np.minimum.reduce(target_position[1]) - 10, np.maximum.reduce(target_position[1]) + 10)
    axis.set_zlim(np.minimum.reduce(target_position[2]) - 10, np.maximum.reduce(target_position[2]) + 10)
    #   Label
    axis.set_xlabel(r'X - Position (mm)')
    axis.set_ylabel(r'Y - Position (mm)')
    axis.set_zlabel(r'Z - Position (mm)')
    # Other
    axis.xaxis._axinfo['grid'].update({'linewidth': 0.75, 'linestyle': '--'})
    axis.w_xaxis.pane.set_color((1.0, 1.0, 1.0, 1.0))
    axis.yaxis._axinfo['grid'].update({'linewidth': 0.75, 'linestyle': '--'})
    axis.w_yaxis.pane.set_color((1.0, 1.0, 1.0, 1.0))
    axis.zaxis._axinfo['grid'].update({'linewidth': 0.75, 'linestyle': '--'})
    axis.w_zaxis.pane.set_color((1.0, 1.0, 1.0, 1.0))
    axis.legend()

    # Display the result
    plt.show()

if __name__ == '__main__':
    sys.exit(main())
