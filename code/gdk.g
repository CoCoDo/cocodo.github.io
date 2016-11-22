specification : rule+;
rule          : ident ":" disjunction ";";
disjunction   : {conjunction "|"};
conjunction   : term+;
term          : basis repetition?;
basis         : ident
              | literal
              | "%epsilon"
              | alternation
              | group
              ;
repetition    : "+" | "*" | "?";
alternation   : "{" basis basis "}" repetition;
group : "(" disjunction ")" ;
