///O [Never] é um novo tipo criado do Dart, e ele é 
///filho de todos os outros tipos, inclusive do null.
///É um tipo que deve ser usado para uma função que 
///nunca chega ao fim, como por exemplo uma função que
///serve apenas para disparar uma exceção, que nesse
///caso para o fluxo do sistema devido a exceção, a
///função ou método que disparam uma exceção não chega
///a terminar, ao dar a exceção o fluxo é parado, e 
///no caso de uma função que só dispara uma exceção, não
///faz sentido retornarmos um tipo específico. Não é 
///void pois nem chega a terminar o método, o void é sem
///retorno, mas no caso não é uma função sem retorno, é
///uma função que aborta a execução do programa, que 
///não chega a finalizar, por isso faz sentido ser 
///[Never].
Never tipoErrado(String tipo, Object valor) {
  throw ArgumentError(
    'Espera $tipo,'
    ' mas é ${valor.runtimeType}'
  );
}

///Outro exemplo:
class Ponto {
  Ponto(this.x, this.y);

  final double x, y;
  

  @override
  bool operator ==(Object outro) {
    if (outro is! Ponto) {
      tipoErrado('Ponto', outro);
    }

    return x == outro.x && y == outro.y;
  }

  @override
  int get hashCode => y.hashCode ^ x.hashCode;
}

main(List<String> args) {
  try {
    tipoErrado('String', 5);
  }
  catch(err) {
    print('tipoErrado = $err');
  }

  try {
    final point = Ponto(10, 20);
    print('1: ${point == Ponto(11, 20)}');
    print('2: ${point == Ponto(10, 20)}');
    print('3: ${point == "String"}');
  }
  on ArgumentError catch (err){
    print('Erro na comparação: $err');
  }
}