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
File Name: data_collect_egm_control.py
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
# OS (Operating system interfaces)
import os
# Lib.ABB_EGM (Library for Externally Guided Motion of abb robots)
import Lib.ABB_EGM as ABB_EGM

# Input Data:
#   Robot Name: IRB1200 / CRB15000
ROBOT_NAME = 'IRB1200'
#   Save or don't save streamed values from the Robot 
#       'Cartesian' / 'Joint' or 'None'
SAVE_DATA = [True, 'Cartesian']

def EGM_Control_Thread_Fce(EGM_Ctrl):
    sequence = 0
    while sequence < 100:
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
        EGM_Ctrl.Set_Cartesian_Data([500.0, 50.0, 400.0], [180.0,0.0,180.0,0.0], SAVE_DATA[0])
        #EGM_Ctrl.Set_Absolute_Joint_Data([10.0,0.0,40.0,0.0,50.0,0.0], SAVE_DATA[0])

        sequence = sequence + 1
        print(sequence)
    
    print('End!')

def main():
    try:
        # Initialization of the Class (ABB EGM Control)
        ABB_EGM_Ctrl = ABB_EGM.Control('192.168.125.22', 6511)

        # Start Control {EGM}: Thread
        egm_thread = threading.Thread(target=EGM_Control_Thread_Fce, args=(ABB_EGM_Ctrl, ), daemon=True)
        egm_thread.start()

        while egm_thread.is_alive():
            egm_thread.join(0.0001)

    except KeyboardInterrupt:
        sys.exit(1)

if __name__ == "__main__":
    sys.exit(main())
