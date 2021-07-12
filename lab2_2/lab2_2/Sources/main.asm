;*****************************************************************
;* This stationery serves as the framework for a                 *
;* user application (single file, absolute assembly application) *
;* For a more comprehensive program that                         *
;* demonstrates the more advanced functionality of this          *
;* processor, please see the demonstration applications          *
;* located in the examples subdirectory of the                   *
;* Freescale CodeWarrior for the HC12 Program directory          *
;*****************************************************************

; export symbols
            XDEF Entry, _Startup            ; export 'Entry' symbol
            ABSENTRY Entry        ; for absolute assembly: mark this as application entry point



; Include derivative-specific definitions 
		INCLUDE 'derivative.inc' 




; code section
            
            ORG   $4000


;Program Start

Entry:
_Startup:

 ;************************************************************
;*          Assignment 7.2                                 *
;************************************************************      
    


                BSET      DDRP, %11111111         ;Config Port P for Output (LED2 Control)
                BSET      DDRE, %00010000         ;Config pin PE4 for Output (Enable Bit)
                BCLR      PORTE, %00010000        ;Enable keypad
                
Loop:           LDAA      PTS                     ;Read a key code into ACCA
                LSRA                              ;Shift right ACCA
                LSRA                              ;Shift right again
                LSRA                              ;Shift right
                LSRA                              ;Shift right
                STAA      PTP                     ;Output ACCA to LED2
                BRA       Loop                    ;Loop






;**************************************************************
;*                 Interrupt Vectors                          *
;**************************************************************
            ORG   $FFFE
            DC.W  Entry           ; Reset Vector
