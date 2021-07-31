///O construtor List() foi completamente removido no Null-Safety,
///porquê passávamos como parâmetro o tamanho da lista e aqueles 
///campos eram inicializados nulos. Temos uma falta de integridade
///ao lidar com listas não nullables.

void main() {
  ///Opções que restaram para declarar uma lista:
  ///1:
  List<int> list1 = [1, 3, 5];
  print('list1 = $list1'); //list1 = [1, 3, 5]

  ///2 (passamos o length e os valores para inicializá-los):
  final list2 = List<int>.filled(5, 0);
  print('list2 = $list2'); //list2 = [0, 0, 0, 0, 0]

  ///3:
  final list3 = List<int>.generate(5, (index) => index + 1);
  print('list3 = $list3'); //list3 = [1, 2, 3, 4, 5]

  ///4 (este construtor é novo e entrou justamente
  ///para substituir o construtor padrão do List()):
  final list4 = List<int>.empty();
  print('list4 = $list4'); //list4 = []
}