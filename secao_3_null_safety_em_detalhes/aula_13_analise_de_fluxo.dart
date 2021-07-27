///Na linha do if para validar se é lista, se for a 
///variável objeto acaba promovendo o objeto para 
///o tipo List, portanto terá o atributo [isEmpty].
///Funcionará tanto no Null-Safety quanto em versões 
///mais antigas.
bool listaVazia(Object objeto) {
  if (objeto is List) {
    return objeto.isEmpty;
  }
  else {
    return false;
  }
}

///Nesse caso aqui, não irá funcionar em versões mais 
///antigas que o Null-Safety. A lógica é a mesma de cima,
///só foi invertida, em cima validava se o objeto é uma
///lista e se for chamava o isEmpty, aqui, se for uma 
///lista não cairá no if retornando false e retornará 
///o isEmpty do objeto, mas o antigo Analyzer do Dart 
///não era muito inteligente, então nesse caso que não
///era bem explicitado o tipo com o is, não ocorreria a 
///promoção automática da variável objeto para List, de 
///forma que continuaria sendo um Object e não teria o 
///atributo [isEmpty], dando erro portanto. Mas no 
///Null-Safety funciona pois o Dart Analyzer está mais 
///inteligente e detecta esse cenário fazendo a promoção
///de objeto para List. Agora o return, o break e o 
///throw são levados em consideração.
bool listaVazia2(Object objeto) {
  if (objeto is! List) {
    return false;
  }

  return objeto.isEmpty;
}

void main() {
  print(listaVazia([]));
  print(listaVazia([1]));
  print('-----------');
  print(listaVazia2([]));
  print(listaVazia2([1]));
}