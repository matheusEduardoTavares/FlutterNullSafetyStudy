class Cafe {
  ///Mesmo que tenhamos certeza que sempre chamaremos o método [calor] ou 
  ///[gelado] antes de chamar o método [beber], ou seja, que a variável de 
  ///temperatura terá sido inicializada, é preciso avisar para o Analyser que
  ///essa variável temperatura será iniciada apenas depois, e para tal, usamos
  ///o late. 
  ///Até funcionaria também deixar a variável [_temperatura] como não nullable
  ///e depois no método beber usar o as ou o ! para passar a variável para não
  ///nullable, mas isso deixa confuso para a classe, não faz muito sentido, pois
  ///pode significar que o null tem algum significado importante para esta 
  ///variável, e isso não é esse caso. Por isso o ideal é usar o late mesmo.
  ///Dá erro:
  // String _temperatura;
  ///Funciona:
  late String _temperatura;
  ///Forma ruim:
  // String? _temperatura;

  void calor() {
    _temperatura = 'quente';
  }

  void gelado() {
    _temperatura = 'frio';
  }

  String beber() => 'Café ' + _temperatura;
  ///Forma ruim:
  // String beber() => 'Café ' + _temperatura!;
}

main(List<String> args) {
  final cafe = Cafe()..calor();
  print(cafe.beber());
  cafe.gelado();
  print(cafe.beber());
  ///O late também coloca as restrições da variável em tempo de execução, então
  ///se for usado erroneamente causará erros, assim como o as e o !.
}