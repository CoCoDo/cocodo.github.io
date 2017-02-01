class ExprParser(GenericParser):
	def __init__(self, start='expr'):
		GenericParser.__init__(self, start)

	def p_rules(self args):
		'''
			expr ::= expr + term
			expr ::= term
			term ::= term * factor
			term ::= factor
			factor ::= number
			factor ::= float
		'''
