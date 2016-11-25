double Primary() throws NumberFormatException :
{
	Token t ;
	double d ;
}
{
	t=<NUMBER>
	{ return Double.parseDouble( t.image ) ; }
|
	<PREVIOUS>
	{ return previousValue ; }
|
	<OPEN_PAR> d=Expression() <CLOSE_PAR>
	{ return d ; }
|
	<MINUS> d=Primary()
	{ return -d ; }
}
