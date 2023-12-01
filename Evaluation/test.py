# System (Default)
import sys
#   Add access if it is not in the system path.
if '../' + 'src' not in sys.path:
    sys.path.append('../' + 'src')
# OS (Operating system interfaces)
import os
# Custom Lib.:
#   ...
import Lib.EGM.Core

def main():
    # ...
    ABB_IRB_120_EGM_Cls = Lib.EGM.Core.EGM_Control_Cls('127.0.0.1', 6511)

    sequence = 0
    while sequence < 100:
        ABB_IRB_120_EGM_Cls.Set_Absolute_Joint_Position([0.0], False)
        sequence = sequence + 1
    
    #ABB_IRB_120_EGM_Cls.Close()
    print('End!')
if __name__ == '__main__':
    sys.exit(main())