def on_exp(self, target, option, names, values):
    """
    exp : NUMBER
        | exp PLUS exp
        | exp MINUS exp
        | exp TIMES exp
        | exp DIVIDE exp
        | MINUS exp %prec NEG
        | exp POW exp
        | LPAREN exp RPAREN
    """
    if option == 0:
        return float(values[0])
    elif option == 1:
        return values[0] + values[2]
    elif option == 2:
        return values[0] - values[2]
    elif option == 3:
        return values[0] * values[2]
    elif option == 4:
        return values[0] / values[2]
    elif option == 5:
        return - values[1]
    elif option == 6:
        return values[0] ** values[2]
    elif option == 7:
        return values[1]