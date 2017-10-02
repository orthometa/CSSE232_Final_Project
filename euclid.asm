#---------------------------------------------------------------
# @author: Ishan Saraf, Rahul Yarlagadda, John McClure, David Li
# @date: October 2nd, 2017
#
# This file contains Euclid's algorithm to find relative primes
# as outlined on the CSSE232 final project page, written in our
# team's custom assembly language.
#---------------------------------------------------------------

relPrime:
  li 2		
  swap

  while:
    dup2
    dup2
    jal gcd
    li 1
    beq end
    swap
    li 1
    add
    swap
    j while

  end:
    drop
    jr

gcd:
  dup
  li 0
  beq exit
  drop
  jr

  next:
    swap
    dup
    li 0
    beq exit
    dup2
    dup2
    swap
    bgt cond2
	swap
	dup2
	swap
	sub
	j next
	
  cond2:
    dup2
    swap
    sub
    swap
    j next

  exit:
    drop
    jr
