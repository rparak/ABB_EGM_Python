MODULE Module1
    ! ## =========================================================================== ## 
    ! MIT License
    ! Copyright (c) 2023 Roman Parak
    ! Permission is hereby granted, free of charge, to any person obtaining a copy
    ! of this software and associated documentation files (the "Software"), to deal
    ! in the Software without restriction, including without limitation the rights
    ! to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    ! copies of the Software, and to permit persons to whom the Software is
    ! furnished to do so, subject to the following conditions:
    ! The above copyright notice and this permission notice shall be included in all
    ! copies or substantial portions of the Software.
    ! THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    ! IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    ! FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    ! AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    ! LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    ! OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    ! SOFTWARE.
    ! ## =========================================================================== ## 
    ! Author   : Roman Parak
    ! Email    : Roman.Parak@outlook.com
    ! Github   : https://github.com/rparak
    ! File Name: T_ROB1/Module1.mod
    ! ## =========================================================================== ## 
    
    ! Identifier for the EGM correction
    LOCAL VAR egmident egm_id;
    ! The work object. Base Frame
    LOCAL PERS wobjdata egm_wobj := [FALSE, TRUE, "", [[0.0, 0.0, 0.0],[1.0, 0.0, 0.0, 0.0]], [[0.0, 0.0, 0.0],[1.0, 0.0, 0.0, 0.0]]];
    ! Limits for convergence
    ! Orientation: +-0.1 degrees
    LOCAL CONST egm_minmax egm_condition_orient := [-0.1, 0.1];
    
    ! Description:                                         !
    ! Externally Guided motion (EGM): Control - Main Cycle !
    PROC Main()
        ! Move to the starting position
        MoveAbsJ [[0,0,0,0,0,0],[9E9,9E9,9E9,9E9,9E9,9E9]], v100, fine, tool0\WObj:=wobj0;
            
        ! EGM Joint Orientation Control
        EGM_JOINT_CONTROL;
    ENDPROC
    
    PROC EGM_JOINT_CONTROL()
        ! Description:                                   !
        ! Externally Guided motion (EGM) - Joint Control !
          
        ! Release the EGM id.
        EGMReset egm_id;
            
        ! Register an EGM id.
        EGMGetId egm_id;
            
        ! Setup the EGM communication.
        EGMSetupUC ROB_1, egm_id, "default", "ROB_1", \Joint; 

        WHILE TRUE DO
            ! Prepare for an EGM communication session.
            EGMActJoint egm_id,
                        \WObj:=egm_wobj,
                        \J1:=egm_condition_orient
                        \J2:=egm_condition_orient
                        \J3:=egm_condition_orient
                        \J4:=egm_condition_orient
                        \J5:=egm_condition_orient
                        \J6:=egm_condition_orient
                        \LpFilter:=100
                        \SampleRate:=4
                        \MaxPosDeviation:=1000
                        \MaxSpeedDeviation:=1000;
                        
            ! Start the EGM communication session
            EGMRunJoint egm_id, EGM_STOP_HOLD, \J1 \J2 \J3 \J4 \J5 \J6 \CondTime:=1.0 \RampInTime:=0.1 \RampOutTime:=0.1 \PosCorrGain:=1.0;
             
            ! Release the EGM id
            !EGMReset egm_id;
            ! Wait 2 seconds {No data from EGM sensor}
            !WaitTime 2;    
        ENDWHILE
        
        ERROR
        IF ERRNO = ERR_UDPUC_COMM THEN
            TPWrite "Communication timeout: EGM";
            TRYNEXT;
        ENDIF
    ENDPROC
ENDMODULE