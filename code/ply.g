names = { }

def p_statement_assign(t):
    names[t[1]] = t[3]

def p_statement_expr(t):
    print(t[1])

def p_expression_binop(t):
    if t[2] == '+'  : t[0] = t[1] + t[3]
    elif t[2] == '-': t[0] = t[1] - t[3]
    elif t[2] == '*': t[0] = t[1] * t[3]
    elif t[2] == '/': t[0] = t[1] / t[3]

def p_expression_uminus(t):
    t[0] = -t[2]

def p_expression_group(t):
    t[0] = t[2]

def p_expression_number(t):
    t[0] = t[1]

def p_expression_name(t):
    try:
        t[0] = names[t[1]]
    except LookupError:
        print("Undefined name '%s'" % t[1])
        t[0] = 0