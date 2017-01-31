identifier := (#letter asParser , (#letter asParser / #digit asParser) star) flatten.
number :=  #digit asParser plus token trim ==> [ :token | token value asNumber ].

term := PPUnresolvedParser new.
prod := PPUnresolvedParser new.
prim := PPUnresolvedParser new.
 
term def: (prod , $+ asParser trim , term ==> [ :nodes | nodes first + nodes last ])
   / prod.
prod def: (prim , $* asParser trim , prod ==> [ :nodes | nodes first * nodes last ])
   / prim.
prim def: ($( asParser trim , term , $) asParser trim ==> [ :nodes | nodes second ])
   / number.

start := term end.