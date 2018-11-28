Grammar    <- Spacing Definition+ EndOfFile
Definition <- Identifier LEFTARROW Expression
Expression <- Sequence (SLASH Sequence)*
Sequence   <- Prefix*
Prefix     <- (AND / NOT)? Suffix
Suffix     <- Primary (QUESTION / STAR / PLUS)?
Primary    <- Identifier !LEFTARROW
            / OPEN Expression CLOSE
            / Literal / DOT

Identifier <- '[a-zA-Z_][a-zA-Z_0-9]*' Spacing
Literal    <- "'" (!"'" Char)* "'" Spacing
            / '"' (!'"' Char)* '"' Spacing
Char       <- '\\[nrt\'"\+\-\*\.\?\^\$\{\}\(\)\[\]\\]'
            / '\\[0-2][0-7][0-7]'
            / '\\[0-7][0-7]?'
            / !'\\' .
