%cf{
    non terminal stmt;
    non terminal Double stmts,expr;

    start with stmts;

    precedence left PLUS, BINARY_MINUS;
    precedence left TIMES, DIVIDE;
    precedence left UNARY_MINUS;

    stmts ::=
      stmts:hd stmt:tl   {: RESULT = (env.containsKey("RESULT") ? env.get("RESULT") : 0.0/0.0); :}
    | stmt:s             {: RESULT = (env.containsKey("RESULT") ? env.get("RESULT") : 0.0/0.0);  :}
    ;

    stmt ::=
      UNASSIGNED_ID:i ASSIGN expr:e SEMI      {: env.put(i,e); :}
    | expr:e SEMI                             {: env.put("_e" + (nextUnnamed++),e); :}
    ;

    /* Expressions */
    expr ::=
      expr:l PLUS expr:r           {: RESULT = l + r;    :}
    | expr:l BINARY_MINUS expr:r   {: RESULT = l - r;    :}
    | expr:l TIMES expr:r          {: RESULT = l * r;    :}
    | expr:l DIVIDE expr:r         {: RESULT = l / r;    :}
    | UNARY_MINUS expr:e           {: RESULT = -1.0 * e; :}
        %layout ()
    | LPAREN expr:e RPAREN         {: RESULT = e;        :}
    | NUMBER:n                     {: RESULT = n;        :}
    | ASSIGNED_ID:i                {: RESULT = i;        :}
    | UNASSIGNED_ID:u
      {:
          error(_pos,"Undefined symbol '" + u + "'");
          RESULT = 0.0/0.0;
      :}
    ;

%cf}