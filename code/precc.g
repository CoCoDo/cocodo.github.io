integer = [ <'+'>|<'-'> ]
          unsigned_int
          [ {<'E'>|<'e'>} [<'+'>] unsigned_int ]

unsigned_int = (isdigit)+