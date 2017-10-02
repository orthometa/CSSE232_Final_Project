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

  cond2:
    dup2
    swap
    sub
    swap
    j next

  exit:
    drop
    jr
