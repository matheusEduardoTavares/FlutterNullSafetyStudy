class HttpResponse {
  int code;
  String? error;

  HttpResponse.ok() : code = 200;
  HttpResponse.notFound() :
    code = 404,
    error = 'Not Found';

  @override
  String toString() {
    if (code == 200) {
      return 'OK';
    }

    ///Se não colocar o ?. dá erro aqui, pois analisando o fluxo sabemos que 
    ///a única forma de chegar aqui é tendo o atributo error preenchido, mas 
    ///o Analyser não consegue interpretar essas situações complexas. Dá erro:
    // return 'ERROR $code ${error.toUpperCase()}';
    ///Funciona:
    // return 'ERROR $code ${error?.toUpperCase()}';
    ///Ou como nós temos certeza que será preenchido, podemos usar o null assertion:
    return 'ERROR $code ${error!.toUpperCase()}';
    ///Podemos também usar o as String para o error no lugar do !. 
    ///A diferença do ! para o as é que o as também faz conversões de tipos, já
    ///o operador ! serve para evitar verbosidade
    ///Lembrando que quando forçamos o cast para um tipo não nullable, se aquela
    ///variável for nula irá gerar uma Exception e mostrar a famosa tela vermelha
  }

}

void main(List<String> args) {
  ///O operador ! é o operador null assertion, e ele serve para transformar
  ///uma variável nullable para não nullable. Mas há cenários em que o Analyzer
  ///não consegue detectar segurança desta operação.
  print(HttpResponse.notFound()); // ERROR 404 NOT FOUND
  print(HttpResponse.ok()); // OK

  ///Observação para o ! :
  ///- Perde-se a segurança estática, pois ao usar o ! para de fazer a validação
  ///em tempo de compilação e deixa para fazer em tempo de execução (o mesmo para
  ///o as), perdendo portanto essa proteção;
}