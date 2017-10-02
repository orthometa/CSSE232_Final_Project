#---------------------------------------------------------------
# @author: Ishan Saraf, Rahul Yarlagadda, John McClure, David Li
# @date: October 2nd, 2017
#
# This file contains Euclid's algorithm to find relative primes
# as outlined on the CSSE232 final project page, written in our
# team's custom assembly language.
#---------------------------------------------------------------

relPrime:
  li 2		#Push initial value of m
  swap		#Swap, so stack is n->m, setup to call gcd

  while:
    dup2	#Duplicate n and m, so they're still on the stack when gcd returns 
    dup2
    jal gcd	#Call gcd
    li 1	#Load 1 onto the top of the stack
    beq end	#Branch if result of gcd equals one
    swap	#Didn't branch (so we're in the while loop)
			#Swap so m is on top of stack and we can add 1 to m
    li 1	
    add		#Add 1 to m
    swap	#Swap so stack is n->m (and m is incremented)
    j while #Go back to beginning of while loop

  end:
    drop	#Drop n, so just m is on the stack 
    jr		#Return m

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
