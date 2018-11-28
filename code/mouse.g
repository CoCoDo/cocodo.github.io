MethodDeclaration
    = MethodModifier* MethodHeader MethodBody ;

MethodHeader
    = Result MethodDeclarator Throws?
    / TypeParameters Annotation* Result MethodDeclarator Throws?
    ;

MethodDeclarator
    = Identifier LPAR FormalParameterList? RPAR Dim* ;

FormalParameterList
    = (ReceiverParameter / FormalParameter)(COMMA FormalParameter)* ;

FormalParameter
    = VariableModifier* UnannType VariableDeclaratorId
    / VariableModifier* UnannType Annotation* ELLIPSIS VariableDeclaratorId !COMMA
    ;

VariableModifier
    = Annotation
    / FINAL
    ;

ReceiverParameter
    = VariableModifier* UnannType (Identifier DOT)? THIS ;

Result
    = UnannType
    / VOID
    ;

MethodModifier
    = Annotation
    / PUBLIC
    / PROTECTED
    / PRIVATE
    / ABSTRACT
    / STATIC
    / FINAL
    / SYNCHRONIZED
    / NATIVE
    / STRICTFP
    ;

Throws
    = THROWS ExceptionTypeList ;

ExceptionTypeList
    = ExceptionType (COMMA ExceptionType)* ;

ExceptionType
    = ClassType
    / TypeVariable
    ;

MethodBody
    = Block
    / SEMI
    ;