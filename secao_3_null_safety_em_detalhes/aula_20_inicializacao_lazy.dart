import 'dart:math';

class Clima {
  int _verTermometro() {
    return Random().nextInt(40);
  }

  ///Ao inicializar diretamente uma variável 
  ///usando o modificador late, na verdade o valor
  ///não é atribuído na mesma hora a variável. Isso é
  ///chamado de inicialização lazy, a variável [_temperatura]
  ///só será de fato inicializada na hora que tentarmos acessá-la (quando lermos
  ///o valor ou tentarmos o modificar). Se não usarmos a variável
  ///em nenhum lugar, acaba que a mesma não é inicializada e isso até faz sentido,
  ///pois não tem motivo para usar recursos computacionais para inicializar uma
  ///variável que nunca venha a ser usada.
  late int _temperatura = _verTermometro();
  int get temperatura => _temperatura;
  void set temperatura(int value) {
    _temperatura = value;
  }
}

class Cafe {
  ///Variáveis com [late] podem ser final também sem problemas, só muda que no
  ///caso de ser final uma vez atribuído (ou seja, uma vez que de fato o atributo
  ///seja acessado) seu valor não pode mudar mais
  late final String _temperatura;

  void calor() {
    _temperatura = 'quente';
  }

  void gelado() {
    _temperatura = 'frio';
  }

  String beber() => 'Café' + _temperatura;
}

main(List<String> args) {
  final clima = Clima();
  print(clima.temperatura); //Número aleatório
  clima.temperatura = 37;
  print(clima.temperatura); //37

  final cafe = Cafe();
  cafe.calor();
  print(cafe.beber());
  ///Aqui dá erro pois tentamos mudar o valor da temperatura que era final
  cafe.gelado();
  print(cafe.beber());
}