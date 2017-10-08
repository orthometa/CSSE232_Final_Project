pop#---------------------------------------------------------------
# @author: Ishan Saraf, Rahul Yarlagadda, John McClure, David Li
# @date: October 2nd, 2017
#
# This file contains a sample program to demonstrate looping in
# our team's custom assembly language.
#
# The following algorithm is being showcased here:
# function loop(int n) {
#   int count = 0;
#   while (n > 0) {
#     count = count + n;
#     n = n - 1;
#   }
#
#   return count;
# }
#---------------------------------------------------------------

loop:   pushi 0   # Loading initial value of count, stack is count -> n

while:  dup2      # Duplicating n, stack is n -> count -> n
        pushi 0   # Comparator value, stack is 0 -> n -> count -> n
        swap      # Correct order
        bgt exit  # Branch if n <= zero, stack is count -> n
        dup2      # Stack is n -> count -> n
        add       # count = count + i, stack is count -> n
        swap      # Stack is n -> count
        pushi 1   # Decrement value, stack is 1 -> n -> count
        swap      # Correct order
        sub       # Decrement, stack is n - 1 -> count
        swap      # Correct order
        j while   # Go back to top of loop

exit:   swap      # Order for discard
        pop       # Remove unecessary element
        jr        # Return with 1 return value in accordance with calling conventions
