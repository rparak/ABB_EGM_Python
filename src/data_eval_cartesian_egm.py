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

    # Plot Data:
    #   'Cartesian_Position'/'Cartesian_Orientation'
    PLOT_DATA = 'Cartesian_Position'

    # File names in the EGM_Results folder
    RESULT_DESIRED_DATA_PATH_NAME = 'result_desired_cartesian_v100_z100'
    RESULT_ACTUAL_DATA_PATH_NAME  = 'result_actual_cartesian_v100_z100'

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

    if PLOT_DATA == 'Cartesian_Position':
        ax_vector = [0]*len(desired_position)

        # Create figure with multiple subplots
        figure, (ax_vector) = plt.subplots(len(ax_vector), 1)
        figure.suptitle(f'Path Name: Experiment 1 (Position)\n[Speed: v100 mm/s & v100 °/s, Zone: z100]', fontsize = 15)

        AXIS_NAME = ['X', 'Y', 'Z']
        for i, (ax, desired, actual) in enumerate(zip(ax_vector, desired_position, actual_position)):
            ax.set_ylim([np.minimum.reduce([np.minimum.reduce(desired), np.minimum.reduce(actual)]) - 10.0, 
                         np.maximum.reduce([np.maximum.reduce(desired), np.maximum.reduce(actual)]) + 10.0])
            ax.plot(actual_time, desired, label=f'Desired {PLOT_DATA}')
            ax.plot(actual_time, actual, label=f'Actual {PLOT_DATA}')
            ax.grid(linewidth = 0.75, linestyle = '--')
            ax.set_xlabel(r'Time (ms)')
            ax.set_ylabel(f'{AXIS_NAME[i]} - Position (mm)')
            ax.legend()

    elif PLOT_DATA == 'Cartesian_Orientation':
        ax_vector = [0]*len(desired_orientation)

        # Create figure with multiple subplots
        figure, (ax_vector) = plt.subplots(len(ax_vector), 1)
        figure.suptitle(f'Path Name: Experiment 1 (Orientation)\n[Speed: v100 mm/s & v100 °/s, Zone: z100]', fontsize = 15)

        AXIS_NAME = ['Q1', 'Q2', 'Q3', 'Q4']

        for i, (ax, desired, actual) in enumerate(zip(ax_vector, desired_orientation, actual_orientation)):
            ax.set_ylim([-1.0 - 0.1, 1.0 + 0.1])
            ax.plot(actual_time, desired, label=f'Desired {PLOT_DATA}')
            ax.plot(actual_time, actual, label=f'Actual {PLOT_DATA}')
            ax.grid(linewidth = 0.75, linestyle = '--')
            ax.set_xlabel(r'Time (ms)')
            ax.set_ylabel(f'{AXIS_NAME[i]} - Orientation (-)')
            ax.legend()

    elif PLOT_DATA == 'Absolute_Joint_Orientation':
        pass

    # Display the result
    plt.show()

if __name__ == '__main__':
    sys.exit(main())
