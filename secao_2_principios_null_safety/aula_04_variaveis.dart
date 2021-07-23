import 'dart:math';

class Pessoa {}

class Inteiro {
  late int umInt;

  int _calcule() {
    return Random().nextInt(100);
  }

  Inteiro() {
    umInt = _calcule();
  }
}

void main() {
  var idade = 15;
  // String nome = null; -> erro
  String? nome = null;
  ///Ou:
  // String? nome;
  final pessoa = Pessoa();

  print('$idade, $nome, $pessoa');
  final int = Inteiro();
  print('int.umInt = ${int.umInt}');
}