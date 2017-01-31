from Pysec import Parser, choice, quoted_chars, group_chars, option_chars, digits, between, pair, spaces, match, quoted_collection

json_choices = []
json         = choice(json_choices)
text         = quoted_chars("'", "'")
number       = group_chars([option_chars(["-"]), digits, option_chars([".", digits])]) >> Parser.lift(float)
joiner       = between(spaces, match(","), spaces)
mapping_pair = pair(text, spaces & match(":") & spaces & json)
collection   = quoted_collection("[", spaces, json,         joiner, "]") >> Parser.lift(list)
mapping      = quoted_collection("{", spaces, mapping_pair, joiner, "}") >> Parser.lift(dict)
json_choices.extend([text, number, mapping, collection])

print json.parseString("{'a' : -1.0, 'b' : 2.0, 'z' : {'c' : [1.0, [2.0, [3.0]]]}}")