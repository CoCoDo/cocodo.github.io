(define simple-math-lexer
  (lexer
   ("-" (token--))
   ("+" (token-+))
   ("let" (token-LET))
   ("in" (token-IN))
   ((re-+ number10) (token-NUM (string->number lexeme)))
   (identifier      (token-VAR lexeme))
   ;; recursively calls the lexer which effectively skips whitespace
   (whitespace (simple-math-lexer input-port))
   ((eof) (token-EOF))))

(define simple-math-parser
  (parser
   (start exp)
   (end EOF)
   (error void)
   (tokens a b)
   (precs (left - +))
   (grammar
    (exp ((LET VAR NUM IN exp)
          (make-let-exp $2 (num-exp $3) $5))
         ((NUM) (num-exp $1))
         ((VAR) (var-exp $1))
         ((exp + exp) (make-arith-exp + $1 $3))
         ((exp - exp) (make-arith-exp - $1 $3))))))
