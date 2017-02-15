Module        <- Spacing Intro Production* EOF
Intro         <- ModuleDecl Dependency* Header? Body? Footer? Option?
ModuleDecl    <- "module" FSpacing ModuleRef SEMICOLON
Dependency    <- Modification / Instantiation / Import
Modification  <- "modify" FSpacing ModuleRef ModuleTarget? SEMICOLON
Instantiation <- "instantiate" FSpacing ModuleRef ModuleTarget? SEMICOLON
Import        <- "import" FSpacing ModuleRef ModuleTarget? SEMICOLON
ModuleRef     <- QName ModuleParams?
ModuleParams  <- OPEN ( QName (COMMA QName)* )? CLOSE
ModuleTarget  <- "as" FSpacing QName
Header        <- "header" Spacing Action
Body          <- "body" Spacing Action
Footer        <- "footer" Spacing Action
Option        <- "option" FSpacing Attribute (COMMA Attribute)* SEMICOLON
Production    <- Full / Addition / Removal / Override
Full          <- PAttributes QName Identifier EQUAL Choice SEMICOLON
Addition      <- QName Identifier PLUSEQUAL
                 ( SName ELLIPSIS SLASH Choice SEMICOLON
                 / Choice SLASH SName ELLIPSIS SEMICOLON )
Removal       <- QName Identifier MINUSEQUAL
                 SName ( COMMA SName )* SEMICOLON
Override      <- QName Identifier COLONEQUAL Choice SEMICOLON
                 / QName Identifier COLONEQUAL ELLIPSIS SLASH Choice SEMICOLON
                 / QName Identifier COLONEQUAL Choice SLASH ELLIPSIS SEMICOLON
                 / PAttributes QName Identifier COLONEQUAL ELLIPSIS SEMICOLON