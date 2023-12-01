# System (Default)
import sys
#   Add access if it is not in the system path.
if '../../' + 'src' not in sys.path:
    sys.path.append('../../' + 'src')
# Numpy (Array computing) [pip3 install numpy]
import numpy as np
# OS (Operating system interfaces)
import os
# SciencePlots (Matplotlib styles for scientific plotting) [pip3 install SciencePlots]
import scienceplots
# Matplotlib (Visualization) [pip3 install matplotlib]
import matplotlib.pyplot as plt
# Custom Lib.:
#   ../Lib/Utilities/File_IO
import Lib.Utilities.File_IO as File_IO

def main():
    """
    Description:
        A program to analyze the difference between the actual and desired position of the robot's joints.
    """
        
    # Locate the path to the project folder.
    project_folder = os.getcwd().split('ABB_EGM_Python')[0] + 'ABB_EGM_Python'

    # Load data from the file.
    theta_desired = File_IO.Load(f'{project_folder}/Data/ABB_IRB_14000_R/theta_desired', 'txt', ',')
    theta_actual = File_IO.Load(f'{project_folder}/Data/ABB_IRB_14000_R/theta_actual', 'txt', ',')

    # Set the parameters for the scientific style.
    plt.style.use(['science'])

    # Create a figure.
    fig, ax = plt.subplots(nrows=len(theta_desired[0]), ncols=1)
    fig.subplots_adjust(hspace=0.60)
    fig.suptitle("Analysis of the difference between the actual and desired position of the robot's joints\nType: ABB IRB 14000 (R)", y=0.95, fontsize=20)

    n = len(theta_desired[:, 0]); t = np.linspace(0.0, 1.0, n)
    for i, ax_i in enumerate(ax):
        # Visualization of relevant structures.
        ax_i.plot(t, theta_desired[:, i], '-', color='#8ca8c5', linewidth=1.0, markersize = 3.0, 
                  markeredgewidth=1.5, label='Desired Data')
        ax_i.plot(t, theta_actual[:, i], '-', color='#ffbf80', linewidth=1.0, markersize = 3.0, 
                  markeredgewidth=1.5, label='Actual Data')

        # Set parameters of the graph (plot).
        #   Set the x ticks.
        ax_i.set_xticks(np.arange(0.0, 1.05, 0.05))
        #   Label
        ax_i.set_xlabel(r't', fontsize=15, labelpad=10)
        ax_i.set_ylabel(r'$\theta_{%d}(t)$' % int(i + 1), fontsize=15, labelpad=10) 
        #   Set parameters of the visualization.
        ax_i.grid(which='major', linewidth = 0.75, linestyle = ':')
        # Show the labels (legends) of the graph.
        ax_i.legend(fontsize=10.0) 

    # Show the result.
    plt.show()
    
if __name__ == '__main__':
    sys.exit(main())