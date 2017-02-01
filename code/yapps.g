parser Calculator:
    option:    "context-insensitive-scanner"
    token END: "$"
    token NUM: "[0-9]+"

    rule goal:           expr END                         -> << expr        >>
    rule expr:           factor expr_tail<<factor>>       -> << expr_tail   >>
    rule expr_tail<<v>>:                                  -> << v           >>
                       | "+" factor expr_tail<<v+factor>> -> << expr_tail   >>
                       | "-" factor expr_tail<<v-factor>> -> << expr_tail   >>
    rule factor:         term factor_tail<<term>>         -> << factor_tail >>
    rule factor_tail<<v>>:                                -> << v           >>
                       | "*" term factor_tail<<v*term>>   -> << factor_tail >>
                       | "/" term factor_tail<<v/term>>   -> << factor_tail >>
    rule term:           NUM                              -> << atoi(NUM)   >>
                       | "(" expr ")"                     -> << expr        >>
