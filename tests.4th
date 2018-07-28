\ Copyright 2018 nomennescio
\ Released to the public domain

." Running tests" cr
s" Basic tests" describe#{
s" Zeroes" it#{
<{ 0 1 solution -> 0 }>
<{ 1 0 solution -> 0 }>
}#
s" Non-zeroes" it#{
<{ 1 1 solution -> 1 }>
<{ 3 5 solution -> 15 }>
}# }#
." Finished tests" CR
<{ 0 0 solution -> 1 }>
." Should fail" cr
