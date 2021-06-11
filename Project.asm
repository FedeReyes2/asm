            .ORIG x3000
CLEAN       AND R1, R1, X0
            AND R2, R2, X0
            AND R3, R3, X0
            AND R4, R4, X0
            AND R5, R5, X0
            AND R6, R6, X0
            AND R7, R7, X0

            
            ADD R3, R3, #-15
            ADD R3, R3, #-15
            ADD R3, R3, #-15
            ADD R3, R3, #-3
            
            LEA R0, TEST1 
            PUTS
            JSR PRIN
            STI R6, T1
            LEA R0, TEST2 
            PUTS
            JSR PRIN
            STI R6, T2
            LEA R0, TEST3 
            PUTS
            JSR PRIN
            STI R6, T3
            LEA R0, TEST4 
            PUTS
            JSR PRIN
            STI R6, T4
            LEA R0, TEST5 
            PUTS
            JSR PRIN
            STI R6, T5
MAXIM       LEA R0, LMAZ ; WE DISPLAY THE MAX
            PUTS
            JSR MAXIMUM

            BASE .FILL X4000
            MINS .FILL X3305
            MAXS .FILL X3306
 STACK      AND R6, R6, X0
            LD R6, BASE
            JSR AVERAGE
            STI R2, MINS
            STI R5, MAXS

            HALT

TEST1 .STRINGZ	"Can you input the score of test 1?\n"
TEST2 .STRINGZ  "Can you input the score of test 2?\n"
TEST3 .STRINGZ  "Can you input the score of test 3?\n"
TEST4 .STRINGZ  "Can you input the score of test 4?\n"
TEST5 .STRINGZ  "Can you input the score of test 5?\n"
ENT .STRINGZ	"\n"
            T1 .FILL X3300
            T2 .FILL X3301
            T3 .FILL X3302
            T4 .FILL X3303
            T5 .FILL X3304      
LAV .STRINGZ "The average is: "
LMAX .STRINGZ "The maximum is: "
LMIN .STRINGZ "The minimum is: "
LL .STRINGZ "The letter grade is: "


AVERS .FILL X3307
LETG .FILL X3308
SAVEREG7 .FILL X0
SAVEREG6 .FILL X0
EMPTY .FILL XC000
MAX .FILL XC005 

ASCII_INVERSE_OFFSET .fill #-48 


PRIN        ST R7, SAVEREG7
            
            GETC
            ADD R4,R0,R3
            GETC
            ADD R5,R0,R3           
            GETC
            ADD R6,R0,R3 
            ADD R4,R4,#0
            BRp CIEN
            ADD R5,R5,#0
            BRp SUMPROMT
            BRn DONE
            LD R7,SAVEREG7
            RET
            
SUMPROMT    ADD R6,R6,#10
            ADD R5, R5, #-1
            BRp SUMPROMT
            BRn DONE
            LD R7,SAVEREG7
            RET
CIEN        AND R6,R6,X0
            ADD R6,R6,#15
            ADD R6,R6,#15
            ADD R6,R6,#15
            ADD R6,R6,#15
            ADD R6,R6,#15
            ADD R6,R6,#15
            ADD R6,R6,#10
            LD R7,SAVEREG7
            RET

PUSH        LD R1, MAX
            ADD R2, R6, R1
            BRz FAIL
            ADD R6,R6, #-1
            STR R0, R6, #0
            AND R5, R5, #0
            RET
FAIL        AND R5,R5, #0
            ADD R5,R5,#1
            RET
POP         LD R1, EMPTY
            ADD R2, R6, R1
            BRz FAIL
            LDR R0, R6, #0
            ADD R6,R6,#1
            AND R5,R5,#0
            RET

; AVERAGE     ST R7, SAVEREG7
;             LDI R0, T1
;             LDI R1, T2
;             LDI R2, T3
;             LDI R3, T4
;             LDI R4, T5
;             ADD R4,R3,R2
;             ADD R4,R1,R0
;             AND R5,R5, X0
;             ADD R1, R1, X5
;             AND R2,R2,X0
;             AND R3,R3,X0
; DIV         NOT R2, R5  
;             ADD R2,R2, #1
; LOOPD       ADD R3, R3, #1
;             ADD R1,R1,R2
;             BRn 
;             JSR DIV
;             LD R7, SAVEREG7
;             RET

MAXIMUM     LDI R0, T1
            LDI R1, T2
            LDI R2, T3
            LDI R3, T4
            LDI R4, T5
            AND R5, R5, X0
            AND R6, R6, X0
            ADD R5,R0,X0
            ADD R6,R1,X0
            NOT R1,R1
            ADD R1, R1, #1
            ADD R0, R0, R1
            BRp MAXIMPOS1
            STI R6,MAXS


CONT1   STI R5,MAXS
            ADD R5,R1,X0
            ADD R6,R2,X0
            NOT R2,R2
            ADD R2, R2, #1
            ADD R1, R1, R2
            BRp OPTION2
OPTION1     STI R6,MAXS
CONT2       ADD R5,R1,X0
            ADD R6,R2,X0
            ADD R5,R2,X0
            ADD R6,R3,X0
            NOT R3,R3
            ADD R3, R3, #1
            ADD R2, R2, R3
            BRp OPTION3
            STI R6,MAXS
CONT3       


OPTION2     STI R5,MAXS
            BR CONT2
OPTION3     STI R5,MAXS
            BR CONT3
OPTION4     STI R5,MAXS
            BR CONT4
OPTION5     STI R5,MAXS
            BR CONT5      

MAXIMPOS3   STI R5,MAXS
            ADD R5,R3,X0
            ADD R6,R4,X0
            NOT R4,R4
            ADD R4, R4, #1
            ADD R3, R3, R4
            BRp MAXIMPOS4
            STI R6,MAXS
MAXIMPOS4   STI R5,MAXS
            ADD R5,R4,X0
            ADD R6,R5,X0
            NOT R4,R4
            ADD R4, R4, #1
            ADD R3, R3, R4
            BRp MAXIMPOS4
            STI R6,MAXS
        
DONE        HALT

             
.END