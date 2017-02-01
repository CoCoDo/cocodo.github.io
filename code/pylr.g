_class SimpleMathParser
_lex mathlex.mathlex()
_code from PyLR.Lexers import mathlex
"""
expression: expression PLUS term (addfunc)
     |      term;

term: term TIMES factor (timesfunc)
  |   factor;

factor: LPAREN expression RPAREN (parenfunc)
   |    INT;
"""