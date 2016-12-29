main := (num /[^0-9]/ | other)*
num := digit{1,3} ("," digit{3})*
digit := /[0-9]/
other := /./