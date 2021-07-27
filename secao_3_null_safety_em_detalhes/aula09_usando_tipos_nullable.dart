bad(String? suaString) {
  ///Dá erro:
  // print(suaString.length);
  ///Funciona:
  print(suaString?.length ?? 'nulo');
}

main(List<String> args) {
  bad(null);

  ///Três operações que podem ser feitas com variáveis nullables:
  ///1. método toString();
  ///2. operador ==;
  ///3. atributo hashCode.
  
  ///Lugares para usar variáveis nullables:
  ///1. Leitura de Maps;
  ///2. Parâmetros Opcionais;
  ///3. Comparação de Valores;
  ///4. Interpolação de Strings;
  
  ///Não quebra:
  print(null.toString()); //null
  print(null == null); //true
  print(null.hashCode); //2011
  print(null.hashCode); //2011
}