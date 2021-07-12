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
;*          Assignment 7.1                                  *
;************************************************************      
    
          LDAA  #$FF     ;ACCA = $FF
          STAA  DDRH     ;Configure Port H for output
          STAA  PERT     ;Enable pull-up res. of Port T
          
Loop:     LDAA  PTT      ;Read Port T
          STAA  PTH      ;Display SW1 on LED1 Connected to Port H
          BRA   Loop     ;Loop 


  

;**************************************************************
;*                 Interrupt Vectors                          *
;**************************************************************
            ORG   $FFFE
            DC.W  Entry           ; Reset Vector
