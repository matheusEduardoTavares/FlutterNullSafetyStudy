import 'dart:math';

void main(List<String> args) {
  ///Convertendo variáveis do tipo nullable para do tipo não nullable.
  ///Variáveis do tipo nullable não conseguem chamar métodos.

  ///Exemplo 1, operador ?
  int? intNullable;
  if (Random().nextBool()) {
    intNullable = Random().nextInt(1000);
  }
  int value = intNullable ?? 0;
  print('value = $value');

  ///----------------------------------
  ///Exemplo 2, usando if
  final value2 = umInt();
  final value3 = umInt(intNullable: 8);
  print('value2 = $value2');
  print('value3 = $value3');

  ///----------------------------------
  ///Exemplo 3, usando operador !
  int? intNullable2 = 1;
  ///Neste caso é desnecessário o operador ! pois o próprio dart analyser sabe
  ///que o [intNullable2] não pode ser nulo. Mas em alguns casos que o dart 
  ///analyser não conseguir saber que pode ser nulo, o operador ! garante que 
  ///aquele valor não será nulo. Mas se o valor acabar sendo nulo irá quebrar
  ///a aplicação, pois a validação do ! é feito em tempo de execução.
  // int value4 = intNullable2!;
  int value4 = intNullable2;
  print('value4 = $value4');

  ///----------------------------------
  ///Exemplo 4, usando o "as"
  int value5 = seuNum() as int;
  ///Sem o as iria quebrar já que a função [seuNum] retorna um nullable. O as 
  ///age como o operador !, então quebra se vir null
  print(value5);

  ///----------------------------------
  ///Exemplo 5, operador null aware (?.)
  Pessoa? people;
  if (Random().nextBool()) {
    people = Pessoa();
    if (Random().nextBool()) {
      people.name = 'name';
    }
  }
  print('people is null: ${people == null}');
  print(people?.name);
}

int umInt({int? intNullable}) {
  if (intNullable == null) {
    return 0;
  }

  return intNullable;
}

int? seuNum() {
  return Random().nextInt(1000);
}

class Pessoa {
  String? _name;
  String? get name => _name;
  void set name(String? name) {
    _name = name;
  }
}