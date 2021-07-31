///Outra coisa que mudou no Null-Safety é a escrita
///e leitura do tamanho da lista em listas non-nullables.

///O [length] da lista na verdade é um acessor, 
///tem o getter e o setter dele, portanto se só
///acessarmos a lista.length será printado o tamanho
///da lista, mas ele tem o setter.

///O setter permite definir um comprimento para a
///lista. Caso tenhamos uma lista não vazia e 
///coloquemos um valor menor que o tamanho da 
///lista no momento, iremos truncar a lista, então
///se a lista tem 10 elementos e fizermos 
///lista.length = 3, a lista vai deixar só os 3 
///primeiros elementos, e vai jogar os outros 7 
///no lixo.
///Caso coloquemos um valor maior que o tamanho 
///da lista, então se a lista tem 5 itens e fizermos
///lista.length = 10, a lista irá preencher esses
///outros 5 itens com null. Mas isso viola a questão
///do non-nullable. Isso fez com que no Null-Safety
///ao ocorrer esse caso de via setter setar um 
///tamanho para uma lista non-nullable maior que 
///o tamanho atual, será lançado uma exception.
main(List<String> args) {
  final list = <int>[1, 2];
  print(list.length); //2
  list.length = 1;
  print(list); //[1]
  print(list.length); //1
  try {
    list.length = 5;
    print(list);
    print(list.length);
  }
  catch(error) {
    print(error is TypeError); //true
    print(error); //type 'Null' is not a subtype of type 'int' in type cast
  }
}