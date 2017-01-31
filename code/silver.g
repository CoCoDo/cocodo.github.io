nonterminal Root_c ;
synthesized attribute pp :: String ;
synthesized attribute ast_Root :: Root;
attribute pp, ast_Root occurs on Root_c ;

concrete production root_c
r::Root_c ::= e::Expr_c
{ r.pp = e.pp;
  r.ast_Root = root(e.ast_Expr);
}

synthesized attribute ast_Expr :: Expr ;
nonterminal Expr_c with pp, ast_Expr;
nonterminal Term_c with pp, ast_Expr;
nonterminal Factor_c with pp, ast_Expr;

concrete production add_c
sum::Expr_c ::= e::Expr_c ’+’ t::Term_c
{ sum.pp = e.pp ++ " + " ++ t.pp ;
  sum.ast_Expr = add(e.ast_Expr, t.ast_Expr );
}

concrete production exprTerm_c
e::Expr_c ::= t::Term_c
{ e.pp = t.pp ;
  e.ast_Expr = t.ast_Expr ;
}

concrete production mul_c
prd::Term_c ::= t::Term_c ’*’ f::Factor_c
{ prd.pp = t.pp ++ " * " ++ f.pp ;
  prd.ast_Expr = mul(t.ast_Expr, f.ast_Expr);
}

concrete production termFactor_c
t::Term_c ::= f::Factor_c
{ t.pp = f.pp ;
  t.ast_Expr = f.ast_Expr ;
}

concrete production integerConstant_c
ic::Factor_c ::= i::IntLit_t
{ ic.pp = i.lexeme ;
  ic.ast_Expr = integerConstant(i);
}