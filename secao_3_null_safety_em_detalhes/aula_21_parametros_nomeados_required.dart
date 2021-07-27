main() {
  ///Erro pois não faz sentido ter um parâmetro não nullable
  ///mas como nomeado e opcional
  // void naoPermitido({String word}) => null;

  ///Funciona pois o parâmetro é não nullable e nomeado, mas é
  ///requirido também, já não é mais um annotation, de fato dá
  ///erro se não passar o parâmetro, o [required] agora é um 
  ///modificador
  Null permitido({required String word}) => null;
  print(permitido(word: 'a'));

  ///Agora pode pois é uma variável String não nula como 
  ///parâmetro opcional
  Null permitido2({String? word}) => null;
  print(permitido2(word: 'a'));

  ///Nesse caso é obrigatório passar apenas os parâmetros b e
  ///d, mas eles podem ser nulos. Os demais são opcionais e podem ser nulos
  ///também.
  void function({
    int? a,
    required int? b,
    int? c,
    required int? d,
  }) {
    print('-------');
    print('a = $a');
    print('b = $b');
    print('c = $c');
    print('d = $d');
    print('-------');
  };
  
  function(
    b: null,
    d: null,
  );
  function(
    b: 2,
    d: 1,
    a: 5,
  );

}