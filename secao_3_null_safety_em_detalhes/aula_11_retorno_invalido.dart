///Essa função daria erro pois não temos um return 
///retornando uma String dentro dela, e seu retorno é
///não nullable
// String semRetorno() {

// }

///Já essa função para qualquer caminho é retornado algo,
///e o único caminho que não tem retorno tem um throw que
///também pararia o fluxo normal do código
String sempreRetorna(int y) {
  if (y == 0) {
    return 'zero';
  }
  else if (y < 0) {
    throw ArgumentError(
      'Valores negativos não aceitos'
    );
  }
  else {
    if (y > 10) {
      return 'Valor grande';
    }

    return y.toString();
  }
}

main(List<String> args) {
  final a = sempreRetorna(0);
  print('a = $a');
  try {
    final b = sempreRetorna(-1);
    print('b = $b');
  }
  catch (e) {
    print('b = $e');
  }
  final c = sempreRetorna(15);
  print('c = $c');
  final d = sempreRetorna(8);
  print('d = $d');
}