Expr.Rule = Term | UnExpr | BinExpr | PostFixExpr;
Term.Rule = number | ParExpr | identifier;
ParExpr.Rule = "(" + Expr + ")";
UnExpr.Rule = UnOp + Term;
UnOp.Rule = ToTerm("+") | "-" | "++" | "--";
BinExpr.Rule = Expr + BinOp + Expr;
BinOp.Rule = ToTerm("+") | "-" | "*" | "/" | "**";
PostFixExpr.Rule = Term + PostFixOp;
PostFixOp.Rule = ToTerm("++") | "--";
AssignmentStmt.Rule = identifier + AssignmentOp + Expr;
AssignmentOp.Rule = ToTerm("=") | "+=" | "-=" | "*=" | "/=";
Statement.Rule = AssignmentStmt | Expr | Empty;
ProgramLine.Rule = Statement + NewLine;
Program.Rule = MakeStarRule(Program, ProgramLine);
this.Root = Program;

