start G
G ::= [Grammar] "start" start:</rules[it]> rules:R*
R ::= [Rule] name:sym "::=" arg:A
A ::= [Alt] alts:C + @"|"
C ::= [Create] "[" name:sym "]" arg:S | S
S ::= [Sequence] elements:F*
F ::= [Field] name:sym  ":" arg:P | P
P ::= [Lit] value:str
    | [Value] kind:("int" | "str" | "real" | "sym")
    | [Ref] "<" path:Path  ">"
    | [Call] rule:</rules[it]>
    | [Code] "{" code:Expr "}"
    | [Regular] arg:P "*" Sep? { optional && many }
    | [Regular] arg:P "?" { optional }
    | "(" A ")"
Sep ::= "@"sep:P
