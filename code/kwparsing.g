GRAMMARSTRING ="""
       Value ::  ## indicates Value is the root nonterminal for the grammar
         @R SetqRule :: Value >> ( setq var Value )
         @R ListRule :: Value >> ( ListTail
         @R TailFull :: ListTail >> Value ListTail
         @R TailEmpty :: ListTail >> )
         @R Varrule :: Value >> var
         @R Intrule :: Value >> int
         @R Strrule :: Value >> str
         @R PrintRule :: Value >> ( print Value )
"""