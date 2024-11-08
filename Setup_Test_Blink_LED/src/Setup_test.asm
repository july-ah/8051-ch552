.module blinktest

.area XSEG (DATA)
.area PSEG (DATA)
.area HOME (ABS,CODE)

.org 0x0000
    clr P1.7; Corrected for SDCC
    sjmp back2
delay:
    MOV r7, #0x64
back2:   
    mov TMOD, #0x01
    mov TH0, #0xdb
    mov TL0, #0xff
    setb TCON.4
L1:
    jnb TCON.5, L1
    clr TCON.4
    clr TCON.5
    djnz R7, back2
    ret



 