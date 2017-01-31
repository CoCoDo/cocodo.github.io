%{
import java.lang.Math;
import java.io.*;
import java.util.StringTokenizer;
%}

/* YACC Declarations */
%token NUM
%left '-' '+'
%left '*' '/'
%left NEG /* negation--unary minus */
%right '^' /* exponentiation */

/* Grammar follows */
%%
input: /* empty string */
 | input line
 ;

line: '\n'
 | exp '\n' { System.out.println(" " + $1.dval + " "); }
 ;

exp: NUM { $$ = $1; }
 | exp '+' exp { $$ = new ParserVal($1.dval + $3.dval); }
 | exp '-' exp { $$ = new ParserVal($1.dval - $3.dval); }
 | exp '*' exp { $$ = new ParserVal($1.dval * $3.dval); }
 | exp '/' exp { $$ = new ParserVal($1.dval / $3.dval); }
 | '-' exp %prec NEG { $$ = new ParserVal(-$2.dval); }
 | exp '^' exp { $$ = new ParserVal(Math.pow($1.dval, $3.dval)); }
 | '(' exp ')' { $$ = $2; }
 ;
%%

String ins;
StringTokenizer st;

void yyerror(String s) { System.out.println("par:"+s); }

boolean newline;
int yylex()
{
	String s;
	int tok;
	Double d;
	if (!st.hasMoreTokens())
		if (!newline)
		{
			newline=true;
			return '\n';
		}
		else
			return 0;
	s = st.nextToken();
	try
	{
		d = Double.valueOf(s);
		yylval = new ParserVal(d.doubleValue());
		tok = NUM;
	}
	catch (Exception e)
	{
		tok = s.charAt(0);
	}
	return tok;
}

void dotest()
{
	BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
	while (true)
	{
		System.out.print("expression:");
		try { ins = in.readLine(); }
		catch (Exception e) {}
		st = new StringTokenizer(ins);
		newline=false;
		yyparse();
	}
}

public static void main(String args[])
{
	Parser par = new Parser(false);
	par.dotest();
}