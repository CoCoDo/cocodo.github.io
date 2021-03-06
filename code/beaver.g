%%

%left RPAREN;
%left MULT, DIV;
%left PLUS, MINUS;

%typeof NUMBER = "Number";
%typeof expr = "Expr";

%%

expr = expr.a MULT  expr.b   {: return new Expr(a.value * b.value); :}
     | expr.a DIV   expr.b   {: return new Expr(a.value / b.value); :}
     | expr.a PLUS  expr.b   {: return new Expr(a.value + b.value); :}
     | expr.a MINUS expr.b   {: return new Expr(a.value - b.value); :}
     | NUMBER.n              {: return new Expr(n.doubleValue());   :}
     | LPAREN expr.e RPAREN  {: return e; :}
     ;
