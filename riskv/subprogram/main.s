.text
main:
.globl main
la a1, array_length #}
 lw a1, 0(a1) #} a1 = <длина массива>
 la a0, array # a0 = <адрес 0-го элемента массива>
 li a2, 1 # a2 = 1
call gray
li a0, 0
ret

.globl gray
gray:
jal zero, loop_check1 # goto loop_check
loop1:
 #{
 slli a5, a2, 2 # a5 = a2 << 2 = a2 * 4
 add a5, a0, a5 # a5 = a0 + a5 = a0 + a2 * 4 (array[i])
 sw a2, 0(a5) # array[i] = a6
 addi a2, a2, 1 # a2 += 1
 #}
loop_check1:
 bltu a2, a1, loop1 # if( a2 < a3 ) goto loop
loop_exit1:
li a2, 1 # a2 = 1
jal zero, loop_check # goto loop_check
loop:
#{
 slli a5, a2, 2 # a5 = a2 << 2 = a2 * 4
 add a5, a0, a5 # a5 = a4 + a5 = a4 + a2 * 4
 lw t1, 0(a5) # t1 = array[i]
 #получение кода грея
 srli t3, t1, 1 # t3 = t1 >> 1
 xor t1, t1, t3
 sw t1, 0(a5) # array[i] = t1
 #
 addi a2, a2, 1 # a2 += 1
#}
loop_check:
 bltu a2, a1, loop # if( a2 < a3 ) goto loop
loop_exit:
li a0, 10 # x10 = 10
 li a1, 0 # x11 = 0
 ecall # ecall при значении x10 = 10 => останов симулятора

.rodata
array_length:
 .word 8 # разрядность n(2^n)
.data
array:
 .word 0, 0, 0, 0, 0, 0, 0, 0
