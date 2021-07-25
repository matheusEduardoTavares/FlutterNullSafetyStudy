main(List<String> args) {
  Map<String, int> meuMap = {'a': 1, 'b': 2};
  ///Irá dar erro, pois os itens do Map não aceitam nulo:
  // meuMap['c'] = null;
  print('meuMap = $meuMap');

  /// --------------------------------

  Map<String, int?> meuMap2 = {'a': 1, 'b': 2};
  ///Irá funcionar pois os itens do Map aceitam nulo
  meuMap2['c'] = null;
  print('meuMap2 = $meuMap2');

  /// --------------------------------

  ///Irá dar erro, pois o Map pode ser nulo mas não pode ter itens nulo, teria
  ///que ter um ? ao lado do valor do generics (no caso int) para que os itens
  ///pudessem ser nulos:
  // Map<String, int>? meuMap3 = {'sete': 7, 'dez': null};
  ///Funciona:
  Map<String, int>? meuMap3 = {'sete': 7, 'dez': 10};
  print('meuMap3 = $meuMap3');

  /// --------------------------------
  
  ///Funciona:
  Map<String, int>? meuMap4;
  print('meuMap4 = $meuMap4'); //meuMap4 = null

  /// --------------------------------
  
  ///Irá dar erro, pois sempre que tentamos pegar um valor de um Map a chave
  ///pode não estar nele e nesse caso o retorno seria null, ainda que o Map 
  ///tivesse os valores não nullables, ou seja, todo retorno de map é sempre
  ///um nullable
  // int valor = <String, int>{'sete': 7}['sete'];
  ///Irá funcionar:
  int? valor = <String, int>{'sete': 7}['sete'];
  print('valor = $valor');

  /// --------------------------------
  
  ///Irá funcionar, pois usando o operador ! estamos dizendo que temos certeza
  ///que o valor existe
  int valor2 = <String, int>{'oito': 8}['oito']!;
  print('valor2 = $valor2');

  /// --------------------------------
  
  ///Irá funcionar, pois estamos usando o operador ?? para atribuir um outro
  ///valor caso o retorno do map seja null
  int valor3 = <String, int>{'nove': 9}['nove'] ?? 0;
  print('valor3 = $valor3');
}