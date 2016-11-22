ClassDeclaration:
  Modifiers 'class' Identifier Super Interfaces ClassBody .

Super:
  'extends' InhName / .

Interfaces:
  ['implements' InterfaceTypeList] .

InterfaceTypeList:
  InterfaceType /
  InterfaceTypeList ',' InterfaceType .

ClassBody:
  '{' ClassBodyDeclarations '}' .

ClassBodyDeclarations:
  / ClassBodyDeclarationList .

ClassBodyDeclarationList:
  ClassBodyDeclaration /
  ClassBodyDeclarationList ClassBodyDeclaration .
