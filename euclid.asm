#---------------------------------------------------------------
# @author: Ishan Saraf, Rahul Yarlagadda, John McClure, David Li
# @date: October 2nd, 2017
#
# This file contains Euclid's algorithm to find relative primes
# as outlined on the CSSE232 final project page, written in our
# team's custom assembly language.
#---------------------------------------------------------------

relP:	li 	2		#Push initial value of m
		swap		#Swap, so stack is n->m, setup to call gcd

while:	dup2		#Duplicate n and m, so they're still on the stack when gcd returns 
		dup2
		jal gcd		#Call gcd
		li 	1		#Load 1 onto the top of the stack
		beq end		#Branch if result of gcd equals one
		swap		#Didn't branch (so we're in the while loop)
					#Swap so m is on top of stack and we can add 1 to m
		li 	1	
		add			#Add 1 to m
		swap		#Swap so stack is n->m (and m is incremented)
		j 	while 	#Go back to beginning of while loop

end:	drop		#Drop n, so just m is on the stack 
		jr			#Return m

gcd:	dup			#Duplicate a so we can consume it to branch
		li 	0
		beq next	#If a=0, go to the while loop. 
		drop		#Stack is a->b, so drop a and return b
		jr

next:	swap		#Swap so stack is b->a
		dup			#Duplicate b so it's still on the stack after the branch
		li 	0
		beq exit	#Go to exit if b=0
		dup2		#Duplicate a and b so stack is b->a->b->a
		dup2		
		swap		#Swap for greater than
		bgt cond2	#If a > b, go to the other condition
		swap		#Stack is a->b
		dup2		#Stack is b->a->b
		swap		#Stack is a->b->b
		sub			#a = a-b
		j 	next	#Stack is back to a->b, go to beginning of loop
	
cond2:	dup2		#Stack is now a->b-a
		swap		#stack is now b->a->a
		sub			#Stack is now (b-a)->a
		swap		#Swap so b = b-a and stack is a->b
		j 	next	#Go to beginning of while loop

exit:	drop 		#Stack is currently b->a, drop b and return a
		jr
