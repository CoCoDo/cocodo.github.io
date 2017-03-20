grammar org.example.domainmodel.Domainmodel
with org.eclipse.xtext.common.Terminals
 
generate domainmodel "http://www.example.org/domainmodel/Domainmodel"
 
Domainmodel :
    (elements+=Type)*;
  
Type:
    DataType | Entity;
  
DataType:
    'datatype' name=ID;
 
Entity:
    'entity' name=ID ('extends' superType=[Entity])? '{'
        (features+=Feature)*
    '}';
 
Feature:
    (many?='many')? name=ID ':' type=[Type];