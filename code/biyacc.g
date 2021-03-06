Abstract

data Arith = Add Arith Arith
           | Sub Arith Arith
           | Mul Arith Arith
           | Div Arith Arith
           | Num Natural
           | Var String
  deriving (Show, Eq, Read)

Concrete

Expr   -> Expr '+' Term
        | Expr '-' Term
        | Term
        ;

Term   -> Term '*' Factor
        | Term '/' Factor
        | Factor
        ;

Factor -> '-' Factor
        | Int
        | Name
        | '(' Expr ')'
        ;

Actions

Arith +> Expr
Add x y +> (x +> Expr) '+' (y +> Term);
Sub x y +> (x +> Expr) '-' (y +> Term);
exp     +> (exp +> Term);

Arith +> Term
Mul x y +>  (x +> Term) '*' (y +> Factor);
Div x y +>  (x +> Term) '/' (y +> Factor);
exp     +>  (exp +> Factor);

Arith +> Factor
Sub (Num 0) y +> '-' (y +> Factor);
Num i         +> (i +> Int);
Var n         +> (n +> Name);
exp           +> '(' (exp +> Expr) ')';
