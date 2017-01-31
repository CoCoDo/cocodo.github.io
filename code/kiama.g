class SyntaxAnalyser(positions : Positions) extends Parsers(positions)
{
    lazy val stmt : Parser[Stmt] =
        ";" ^^ (_ => Null()) | sequence | asgnStmt | whileStmt

    lazy val asgnStmt =
        variable ~ ("=" ~> exp) <~ ";" ^^ Asgn

    lazy val whileStmt =
        ("while" ~> "(" ~> exp <~ ")") ~ stmt ^^ While

    lazy val sequence =
        "{" ~> (stmt*) <~ "}" ^^ Seqn

    lazy val exp : PackratParser[Exp] =
        exp ~ ("+" ~> term) ^^ Add |
            exp ~ ("-" ~> term) ^^ Sub |
            term

    lazy val term : PackratParser[Exp] =
        term ~ ("*" ~> factor) ^^ Mul |
            term ~ ("/" ~> factor) ^^ Div |
            factor

    lazy val factor : Parser[Exp] =
        double | integer | variable | "-" ~> exp ^^ Neg | "(" ~> exp <~ ")"

    lazy val double =
        """[0-9]+\.[0-9]+""".r ^^ (s => Num(s.toDouble))

    lazy val integer =
        "[0-9]+".r ^^ (s => Num(s.toInt))

    lazy val variable =
        idn ^^ Var

    lazy val idn =
        not(keyword) ~> "[a-zA-Z][a-zA-Z0-9]*".r

    lazy val keyword =
        keywords("[^a-zA-Z0-9]".r, List("while"))

}