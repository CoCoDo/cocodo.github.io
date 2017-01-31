parser = Parse::RecDescent->new(q{
<autoaction: { [@item] } >
 
expression: and_expr '||' expression | and_expr
and_expr:   not_expr '&&' and_expr   | not_expr
not_expr:   '!' brack_expr       | brack_expr
brack_expr: '(' expression ')'       | identifier
identifier: /[a-z]+/i
});