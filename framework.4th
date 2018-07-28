\ Testing framework compatible with codewars.com
\
\ Copyright 2018 nomennescio
\

\ This program is free software: you can redistribute it and/or modify
\ it under the terms of the GNU Lesser Public License as published by
\ the Free Software Foundation, either version 3 of the License, or
\ (at your option) any later version.
\
\ This program is distributed in the hope that it will be useful,
\ but WITHOUT ANY WARRANTY; without even the implied warranty of
\ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
\ GNU Lesser Public License for more details.
\
\ You should have received a copy of the GNU Lesser Public License
\ along with this program.  If not, see <https://www.gnu.org/licenses/>.

decimal
s" test/ttester.fs" included

: #ms ( dmicroseconds -- len c-addr ) <# # # # [char] . hold #s #> ;

: describe#{ ( len c-addr -- ) cr ." <DESCRIBE::>" type cr utime ;
: it#{ ( len c-addr -- ) cr ." <IT::>" type cr utime ;
: }# ( -- ) utime cr ." <COMPLETEDIN::>" 2swap d- #ms type ."  ms" cr ;

: failed# ( -- ) cr ." <FAILED::>" ;
: passed# ( -- ) cr ." <PASSED::>" ;

create EXPECTED-RESULTS 32 cells allot
variable RESULTS
variable DIFFERENCES

: <{ T{ ;
: }>
  depth ACTUAL-DEPTH @ = if
    depth START-DEPTH @ > if
      depth START-DEPTH @ - dup RESULTS ! 0 do
        dup EXPECTED-RESULTS i cells + !
        ACTUAL-RESULTS i cells + @ <> DIFFERENCES +!
      loop
      DIFFERENCES @ if
        failed# ." Expected "
        RESULTS @ 0 do EXPECTED-RESULTS i cells + @ . loop
        ." , got "
        RESULTS @ 0 do ACTUAL-RESULTS i cells + @ . loop
        cr
      else
        passed# ." Test Passed" cr
      then
    then
  else
    failed# ." Wrong number of results, expected " ACTUAL-DEPTH @ . ." , got " depth . cr
  then
  F} ;
