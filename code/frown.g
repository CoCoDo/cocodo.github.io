import Char

data Expr  =  Ident  Char
           |  Apply  Expr Expr
              deriving (Show)

type Terminal  =  Char

%{

Terminal  =  guard {isAlpha} as "letter"
          |  '('
          |  ')';

Nonterminal  =  expr {Expr};

expr  {Ident x}    :  "letter" {x};
      {Apply t u}  |  expr {t}, '(', expr {u}, ')';
     
}%

frown ts  =  fail "syntax error"