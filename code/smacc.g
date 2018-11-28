<number> : [0-9]+ (\. [0-9]*) ? ;
<whitespace> : \s+;
%left "+" "-";
%left "*" "/";
%right "^";

Expression 
	: Expression 'exp1' "+" Expression 'exp2' {exp1 + exp2}
	| Expression 'exp1' "-" Expression 'exp2' {exp1 - exp2}
	| Expression 'exp1' "*" Expression 'exp2' {exp1 * exp2}
	| Expression 'exp1' "/" Expression 'exp2' {exp1 / exp2}
	| Expression 'exp1' "^" Expression 'exp2' {exp1 raisedTo: exp2}
	| "(" Expression 'expression' ")" {expression}
	| Number 'number' {number}
	;
Number 
	: <number> 'numberToken' {numberToken value asNumber}
	;