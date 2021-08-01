import 'dart:math';

void _showSpace() {
  print('-------- ${++_counterSpace}');
}

int _counterSpace = 0;

// int primeiroNivel; ERRO
///Obrigado inicializar campos estáticos / variáveis de nível
///superior de variáveis non-nullables
int primeiroNivel = 0;
int? segundoNivel;

class AlgumaClasse {
  int precisaInstanciar = 0;
}

int _getRandomInt() {
    return Random().nextInt(1000);
  }

class Inteiro {
  late int umInt;

  Inteiro() {
    umInt = _getRandomInt();
  }
}

class Clima {
  ///Lazy initialization
  late int _temperatura = _getRandomInt();
}

main() {
  // int umIntNulo = null; ERRO
  int? umIntNulo = null;
  print(umIntNulo);
  _showSpace();

  print(primeiroNivel);
  print(segundoNivel);
  _showSpace();

  print(AlgumaClasse().precisaInstanciar);
  _showSpace();

  List<int?>? items;
  if (Random().nextBool()) {
    items = [];
  }
  items?..add(5);
  final value = items?[0];
  print('items = $items');
  print('value = $value');
  _showSpace();

  print('Inteiro().umInt = ${Inteiro().umInt}');
  _showSpace();

  final clima = Clima();
  print('clima._temperatura = ${clima._temperatura}');
}