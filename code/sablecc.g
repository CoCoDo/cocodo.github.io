Grammar expression;

Lexer

  num = digit+;
  digit = '0'..'9';
  blanks = (' ' | eol | tab)+;

  eol = cr | lf | cr lf;
  cr = #13;
  lf = #10;
  tab = #9;

Parser

  Ignored
    blanks;

  program =
    exp ';';

  exp =
    {mul:} exp [op:]'*' exp |
    {add:} exp [op:]'+' exp |
    {num:} num;

    Precedence
      Left mul;
      Left add;
