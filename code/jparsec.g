Terminals operators = Terminals.operators(","); // only one operator supported so far
Parser<?> integerTokenizer = Terminals.IntegerLiteral.TOKENIZER;
Parser<String> integerSyntacticParser = Terminals.IntegerLiteral.PARSER;
Parser<?> ignored = Parsers.or(Scanners.JAVA_BLOCK_COMMENT, Scanners.WHITESPACES);
Parser<?> tokenizer = Parsers.or(operators.tokenizer(), integerTokenizer); // tokenizes the operators and integer
Parser<List<String>> integers = integerSyntacticParser.sepBy(operators.token(","))
    .from(tokenizer, ignored.skipMany());
assertEquals(Arrays.asList("1", "2", "3"), integers.parse("1, /*this is comment*/2, 3");