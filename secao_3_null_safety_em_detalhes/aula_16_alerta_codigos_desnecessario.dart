String checkList(List lista) {
  ///Aqui dará erro pois o parâmetro deste método é non nullable,
  ///logo, não faz sentido usar o operador ? para validar se está
  ///nulo ou não. Dá erro:
  // if (lista?.isEmpty) {
  ///Funciona:
  if (lista.isEmpty) {
    return 'Nada';
  }
  return 'Alguma coisa';
}

String checkList2(List? lista) {
  if (lista == null) {
    return 'Sem lista';
  }
  ///Aqui dá erro também pois já caíu no if anterior que validava
  ///se a lista era nula ou não, portanto não faz sentido usar
  ///o operador ? para validar se a lista está nula pois ela
  ///nunca estará. Dá erro:
  // else if (lista?.isEmpty) {
  ///Funciona:
  else if (lista.isEmpty) {
    return 'Lista vazia';
  }
  return 'Alguma coisa na lista';
}

///Essas são mudanças pequenas mas que são pedidas para que 
///mantenhamos o Código Limpo, sem redundâncias desnecessárias.

void main() {
  print(checkList([]));
  print(checkList([1]));
  print(checkList2([]));
  print(checkList2([1]));
}