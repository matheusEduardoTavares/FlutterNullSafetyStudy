///Campos não são promovidos pois podem ter o 
///valor diferente dependendo do momento da execução.
class CamposNaoSaoPromovidosParaNaoNullables {
  // ignore: unused_element
  String? get _variavel {
    if (_contador == 0) {
      _contador = 1;
      return '0';
    }
    return null;
  }

  int _contador = 0;

  void verificarZero() {
    ///Da erro porquê o campo [_variavel] é computado e 
    ///pode ter o valor diferente em cada execução, logo,
    ///não é promovido para um não nullable automaticamente
    // if (_variavel != null) {
    //   print(_variavel.length);
    // }
    ///Para resolver isso, basta apenas copiar o campo para
    ///uma variável local, pois sabemos que variáveis locais
    ///são promovidas
    final variavel = _variavel;
    if (variavel != null) {
      print(variavel.length);
    }
  }  
}

class Cafe {
  String? _temperatura;

  void calor() {
    _temperatura = 'quente';
  }

  void gelado() {
    _temperatura = 'frio';
  }

  void checkTemp() {
    ///Só colocando o if não é feito a promoção da variável
    ///[_temperatura] para não nullable, pois como vimos o
    ///[_temperatura] é um campo também e não é promovido 
    ///automaticamente. Dá erro:
    // if (_temperatura != null) {
    //   print('Vamos beber ' + _temperatura);
    // }
    ///Para resolver o problema é só usar o operador de
    ///null assertion
    if (_temperatura != null) {
      print('Vamos beber ' + _temperatura!);
    }
  }

  String beber() => 'Café ' + _temperatura!;
}

main(List<String> args) {
  
}