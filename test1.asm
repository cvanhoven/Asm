.ORIG x3000
             LEA R6, STACKBASE
             LEA R0, PROMPT
             TRAP X22
             AND R1,R1,#0
LOOP     TRAP X20

             TRAP X21
             ADD R3, R0, #-10
             BRz        INPUTDONE
             JSR PUSH
             ADD R1,R1, #1
             BRnzp LOOP
INPUTDONE
             ADD R1,R1, #0
             BRz DONE
             LOOP2 JSR POP
             TRAP X21
              ADD R1,R1, #-1
              BRp LOOP2
DONE      TRAP 25

PUSH      ADD R6, R6, #-2
              STR R0, R6, #0
              RET

POP        LDR R0, R6, #0
            ADD R6, R6, #2
            RET
PROMPT .STRINGZ "Please enter a sentence: "
STACKSPAC .BLKW #50
STACKBASE .FILL #0
.END