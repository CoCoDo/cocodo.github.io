Start ::= Element

Element ::= s=STag Content ETag(s)
STag    ::= '<' n:Name Attribute* '>' {n.yield}
ETag(s) ::= '</' n:Name [n.yield == s] '>'

Attribute ::= Name "=" String
Content ::= Element* | Text

@Layout
L ::= Whitespaces

regex
{
	Name ::= [a-zA-Z][a-zA-Z0-9]*
	Text ::= [a-zA-Z0-9]+
	String ::= '\"' [a-zA-Z0-9]+ '\"'
	Whitespaces ::= [\n\r\t\f\ ]*
}