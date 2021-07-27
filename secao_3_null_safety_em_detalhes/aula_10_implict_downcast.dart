void stringNaoNula(String okString) {
  print(okString.length);
}

void StringSemObjeto(String okString) {
  print(okString.length);
}

List<int> filtreIsso(List<int> ints) {
  ///Sem o Null-Safety este retorno desta função 
  ///funcionava pois era feito Implicit Downcast também,
  ///uma vez que o where retorna um iterável que é pai da 
  ///List, aí era usado o as para converter o iterável para
  ///lista antes de retornar já que o retorno da função é
  ///lista. Agora, temos que fazermos a conversão antes de
  ///retornarmos pois como já vimos o Implicit Downcast 
  ///foi removido.
  ///Dá erro:
  // return ints.where((x) => x.isEven)
  ///Funciona:
  return ints.where((x) => x.isEven).toList();
}

void main() {
  String? suaString = null;
  ///Irá dar erro:
  // stringNaoNula(suaString);
  print(suaString);

  ///Aqui ocorre o chamado implict Downcast, em que 
  ///temos uma variável do tipo Objeto que é genérico e 
  ///ancestar na hierarquia de todos os tipos do dart, aí
  ///o inicializamos com uma String e passamos para uma 
  ///função que recebe uma String. Como é do tipo Object 
  ///e a String herda desse Object, implicitamente o 
  ///Dart ao passar este tipo Object para uma função que
  ///recebe uma String, passa o valor convertendo-o 
  ///primeiro para String colocando o as, então na verdade
  ///o objeto é passado assim:
  ///suaString2 as String
  ///Agora no Null-Safety, esse implict Downcast não ocorre
  ///mais, portanto irá dar erro.
  ///O motivo de ter sido retirado é justamente a questão
  ///desse valor que vai ser convertido acabar sendo nulo
  ///aí o implict Downcast ia acabar gerando o erro.
  Object suaString2 = 'String!';
  ///Portanto não funciona:
  // StringSemObjeto(suaString2);
  ///Funciona (fazemos explicitamente o cast):
  StringSemObjeto(suaString2 as String);
  print(filtreIsso([0, 1, 2, 3]));
}