define program 
        [compilation_unit]
end define

define compilation_unit
        [definition_module] 
    |   [opt 'IMPLEMENTATION] [program_module]
end define

define definition_module
                                        [NL]
        DEFINITION MODULE [id] ;        [NL][NL]
                [repeat import_]
                [repeat definition]
        END [id] .                      [NL]
end define

define program_module
        MODULE [id] [opt priority] ;    [NL][NL]
                [repeat import_]
                [block] [id] .          
end define
