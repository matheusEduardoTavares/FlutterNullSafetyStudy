import 'dart:math';

class Pessoa {
  Pessoa(this.nome, this.sobrenome);
  String nome;
  String? sobrenome;
}

void main() {
  String? naoString = null;
  print(naoString?.length);
  final randomBool = Random().nextBool();

  Pessoa? pessoa;
  if (randomBool) {
    pessoa = Pessoa('Daniel', 'Ciolfi');
  }
  ///Antes do Null-Safety deveriámos colocar dois ? para não ter perigo do 
  ///código abaixo quebrar, uma vez que para cada atributo que se acessa sempre
  ///é preciso por o operador de nulo, mas depois do Null-Safety, o Analyzer
  ///já entende que se o primeiro elemento foi usado o operador ?, não é preciso
  ///colocar o operador nos demais elementos, pois o resto da sentença já é 
  ///ignorado. Só é possível nesse caso fazer isso também porquê o atributo nome
  ///é não nullable, se não seria preciso tratar o chamamento do atributo length
  ///caso o nome pudesse ser nulo.
  print(pessoa?.nome.length);
  ///Se não usarmos o ? no atributo sobrenome na linha abaixo dará erro pois 
  ///o sobrenome é um atributo nullable
  print(pessoa?.sobrenome?.length);

  ///Alguns Operadores novos:
  ///Podemos usar o operador de cascata junto com o nullable: ?..
  List<int>? values;
  if (randomBool) {
    values = [5, 2];
  }
  final newList = values?..add(8)..remove(2);
  print(newList); // às vezes da null e às vezes [5, 8]

  ///Acessar algum índice da lista: Podemos usar o ? antes dos colchetes para 
  ///pegar um certo índice da lista, assim não tem que validar se ela é nula 
  ///ou não
  final secondItem = newList?[1];
  print('secondItem = $secondItem'); /// null ou secondItem = 8

  ///Já tínhamos antes do Null-Safety mas é um operador interessante: 
  ///Usar o ?.call na hora de chamar a função
  int Function()? printOnConsole;
  if (randomBool) {
    printOnConsole = () {
      return 5;
    };
  }

  print(printOnConsole?.call());  /// null ou 5
}