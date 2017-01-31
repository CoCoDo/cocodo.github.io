double multiply(double x, double y) { return x*y; }
double add(double x, double y) { return x+y; }
double subtract(double x, double y) { return x-y; }
double divide(double x, double y) { return x/y; }

typedef Parser<string, double>::type NumParser;

NumParser ops = op_table(real)
                 ->infix_left("+", 10, add)
                 ->infix_left("-", 10, subtract)
                 ->infix_left("*", 20, multiply)
                 ->infix_left("/", 20, divide);

ParseResult<double> result;
 
result = parse("3+4*2", ops);

if (result.parse_finished())
{
  std::cout << parse.data(); 
}