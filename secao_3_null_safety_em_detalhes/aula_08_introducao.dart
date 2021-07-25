bool _isEmpty(String string) => string.length == 0;

main() {
  ///Funciona:
  _isEmpty('');
  ///Dá erro:
  // _isEmpty(null);

  ///O null foi separado da hierarquia dos tipos do Dart mas ainda é útil como
  ///nesse caso (parâmetros opcionais):
  fazerCafe('café');
  fazerCafe('café', 'leite');
}

void fazerCafe(String cafe, [String? leite]) {
  if (leite != null) {
    print('$cafe com $leite');
  }
  else {
    print('apenas $cafe');
  }
}