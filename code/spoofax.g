module Pascal

context-free start-symbols Program

context-free syntax
  
  Program.Program = <
    <Programheading> 
    <Block>.
  >

  Programheading.ProgramHeading = <
    program <Identifier> (<{Identifier ", "}*>);
  > {case-insensitive}

  Block.Block = <
    <LabelDeclarations?>
    <ConstantDefinitions?>
    <TypeDefinitions?>
    <VariableDeclarations?>
    
    <{ProcedureOrFunctionDeclaration "\n\n"}*>
    
    begin  
      <{Statement ";\n"}*>     
      <Term?>
    end
  > {case-insensitive} 

  LabelDeclarations.LabelDecls = <
    label 
       <{Label ", "}+>;
  > {case-insensitive}
  
  ConstantDefinitions.ConstDefs = <
    const 
       <{ConstantDefinition "\n"}+>
  > {case-insensitive}

  ConstantDefinition.ConstDef =
    <<Identifier> = <Constant>;>
  
  TypeDefinitions.TypeDefs = <
    type 
      <{TypeDefinition "\n"}+>
  > {case-insensitive}

  TypeDefinition.TypeDef =
    <<Identifier> = <Type>;>
  
  VariableDeclarations.VarDecls = <
    var 
       <{VariableDeclaration "\n"}+>
  > {case-insensitive}

  VariableDeclaration.VarDecl =
    <<{VariableIdentifier ", "}+> : <Type>;>
    
  VariableIdentifier.VarId = <<Identifier>>

...