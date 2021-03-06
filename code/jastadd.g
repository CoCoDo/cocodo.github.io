Program ::= Block /PredefinedType:TypeDecl*/;
Block ::= BlockStmt*;
abstract BlockStmt;
abstract Stmt: BlockStmt;
abstract Decl: BlockStmt ::= <Name:String>;
abstract TypeDecl:Decl;
ClassDecl: TypeDecl ::= [Superclass:IdUse] Body:Block;
VarDecl: Decl ::= Type:Access;
AssignStmt: Stmt ::= Variable:Access Value:Exp;
WhileStmt: Stmt ::= Condition:Exp Body:Stmt;
abstract Exp;
abstract Access:Exp;
abstract IdUse: Access ::= <Name:String>;
Use: IdUse;
Dot:Access ::= ObjectReference:Access IdUse;
BooleanLiteral : Exp ::= <Value:String>;
