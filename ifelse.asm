#---------------------------------------------------------------
# @author: Ishan Saraf, Rahul Yarlagadda, John McClure, David Li
# @date: October 2nd, 2017
#
# This file contains a sample program to demonstrate conditional
# if-else branching in our team's custom assembly language.
#
# The following algorithm is being showcased here:
# function ifelse(int n) {
#   int m = 5;
#   if(m != n) {
#     return m;
#   }
#   return n;
# }
#
# The branch equal to (beq), and branch greater than (bgt)
# commands also work similarly.
#---------------------------------------------------------------

ifelse:
  li 5    # Push initial value of m
  dup2    # Saving values on stack
  dup2    # Stack is now m -> n -> m -> n
  bne else  # Stack is now m -> n
  swap      # Stack now n -> m
  drop      # Stack is now m
  jr        # Return with 1 return value in accordance with calling conventions

  else:
    drop    # Stack is now n
    jr      # Return with 1 return value in accordance with calling conventions
