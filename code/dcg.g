expr(E) --> lassoc(ops,atom,binary,E).

expr(apply(N,Es)) -->
	name(N),
	+(atom,Es).

expr(ifThenElse(E1,E2,E3)) -->
	reserved("if"),
	expr(E1),
	reserved("then"),
	expr(E2),
	reserved("else"),
	expr(E3).
