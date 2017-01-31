#include <string>
#include <iostream>
#include <boost/spirit/include/qi.hpp>
#include <boost/spirit/include/phoenix.hpp>
 
int main()
{
  namespace qi = boost::spirit::qi;

  std::string input;
 
  std::cout << "Input a line: \n";
  getline(std::cin, input);
  std::cout << "Got '" << input << "'.\n";
 
  unsigned count = 0;

  auto rule = *(qi::lit("cat") [ ++qi::_val ] | qi::omit[qi::char_]);
  qi::parse(input.begin(), input.end(), rule, count);
  
  std::cout << "The input contained " << count << " occurrences of 'cat'\n";
}