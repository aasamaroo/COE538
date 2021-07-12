;*****************************************************************
;* This program multiplies two 8-bit unsigned numbers            *
;*                                                               *
;*****************************************************************

; export symbols
            XDEF Entry, _Startup            ; export 'Entry' symbol
            ABSENTRY Entry        ; for absolute assembly: mark this as application entry point



; Include derivative-specific definitions 
		INCLUDE 'derivative.inc' 

; code section


;data/variable section


            ORG   $3000
            
MULTIPLICAND  FCB $A            ; First Number
MULTIPLIER    FCB 02            ;Second Number
PRODUCT       RMB 2             ; Result of Multiplication

*************************************************************
*The actual Program Starts Here                             *
*************************************************************

          

Entry:
_Startup:

          LDAA  MULTIPLICAND  ;Load first number into register A
          LDAB  MULTIPLIER    ;Load second number into register B
          MUL                 ;Multiply 8-bit numbers in registers A and B
          STD   PRODUCT       ;Store the product
          SWI                 ;Break to monitor


;**************************************************************
;*                 Interrupt Vectors                          *
;**************************************************************
            ORG   $FFFE
            DC.W  Entry           ; Reset Vector
