calc  <- ws sum

sum   <- prod *([+-] ws prod)

prod  <- unary *([*/] ws unary)

unary <= '-' ws unary
       | :'(' ws sum :')' ws
       | num

num   <- +[0-9] ?('.' +[0-9]) ws

ws    <: *[ \t\n\r]