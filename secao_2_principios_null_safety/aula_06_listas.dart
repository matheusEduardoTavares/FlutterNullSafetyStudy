main(List<String> args) {
  ///Possibilidades
  List<String> listaNaoNullItemNaoNull = [];
  List<String>? listaNullItemNaoNull = [];
  List<String?> listaNaoNullItemNull = [];
  List<String?>? listaNullItemNull = [];

  ///Dá erro:
  // List<String> nomeList = ['João', null, 'Nome'];
  ///Funciona:
  List<String?> nomeList = ['João', null, 'Nome'];
  
  ///Dá erro:
  // List<String>? nomeList2 = ['João', null, 'Nome'];
  ///Funciona:
  List<String>? nomeList2 = ['João', 'Nome'];

  print('$listaNaoNullItemNaoNull, $listaNullItemNaoNull, $listaNaoNullItemNull, $listaNullItemNull');
  print('nomeList = $nomeList');
  print('nomeList2 = $nomeList2');
}