Id = {Letter}{AlphaNumeric}*

<Statement> ::= if Id then <Statement>
              | if Id then <Then Stm> else <Statement>
              | Id ':=' Id

<Then Stm>  ::= if Id then <Then Stm> else <Then Stm>
              | Id ':=' Id

