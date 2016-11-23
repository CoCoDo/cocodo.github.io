import ro.infoiasi.donald.compiler.parser0.runtime.*;
   
terminal SEMI, PLUS, MINUS, TIMES, DIVIDE, LPAREN, RPAREN;
terminal Integer NUMBER, ID;
   
non terminal Object expr_list, expr_part;
non terminal Integer expr, factor, term;
    
expr_list ::= expr_list expr_part
            | expr_part;
      
expr_part ::= expr:e {: System.out.println(" = " + e); :} SEMI;
   
expr      ::= factor:f PLUS expr:e {: RESULT = new Integer(f.intValue() + e.intValue()); :}
            | factor:f MINUS expr:e {: RESULT = new Integer(f.intValue() - e.intValue()); :}
            | factor:f {: RESULT = new Integer(f.intValue()); :};
   
factor    ::= factor:f TIMES term:t {: RESULT = new Integer(f.intValue() * t.intValue()); :}
            | factor:f DIVIDE term:t {: RESULT = new Integer(f.intValue() / t.intValue()); :}
            | term:t {: RESULT = new Integer(t.intValue()); :};
   
   
term      ::= LPAREN expr:e RPAREN {: RESULT = e; :}
            | NUMBER:n {: RESULT = n; :}
            | ID:i {: RESULT = i; :};
