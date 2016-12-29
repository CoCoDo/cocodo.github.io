exprparser :: Parser Expr
exprparser = buildExpressionParser table term <?> "expression"
table = [ [Prefix (m_reservedOp "~" >> return (Uno Not))]
        , [Infix (m_reservedOp "&" >> return (Duo And)) AssocLeft]
        , [Infix (m_reservedOp "=" >> return (Duo Iff)) AssocLeft]
        ]
term = m_parens exprparser
       <|> fmap Var m_identifier
       <|> (m_reserved "true" >> return (Con True))
       <|> (m_reserved "false" >> return (Con False))