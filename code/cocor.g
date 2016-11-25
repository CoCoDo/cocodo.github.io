COMPILER Sample

CHARACTERS
  digit = '0'..'9'.
TOKENS
  number = digit {digit}.
IGNORE '\r' + '\n'

PRODUCTIONS
  Sample                     (. int n; .)
  = {
      "calc" 
      Expr<out n>            (. Console.WriteLine(n); .)
    }.

  Expr<out int n>            (. int n1; .)
  = Term<out n>
    {
      '+'
      Term<out n1>           (. n = n + n1; .)
    }.

  Term<out int n> 
  = number                   (. n = Convert.Int32(t.val); .)
  .
END Sample.