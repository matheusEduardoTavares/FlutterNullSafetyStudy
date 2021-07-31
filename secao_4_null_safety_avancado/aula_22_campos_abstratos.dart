class Pessoa {
  int idade = 30;
}

class Pessoa2 {
  DateTime aniversario = DateTime(1970, 10, 20);
  int get idade => 
    (DateTime.now().difference(aniversario).inDays / 365).floor();
}

///Essa classe funciona tanto no Null-Safety quanto antes.
abstract class Veiculo {
  String get modelo;
  set modelo(String);
}

///Antes do Null-Safety isso aqui funcionaria, mas no 
///Null-Safety não funciona, com um erro dizendo que a 
///variável modelo foi declarada como não nula mas não 
///foi inicializada, e por ser uma classe abstrata não 
///tem construtor. Mas tem casos que queremos que esse 
///atributo sirva com propósito da interface, para que 
///force o usuário a implementar o seu getter e seu 
///setter. Como já vimos uma solução é fazer o que foi
///feit na classe Veiculo que funcionará mesmo no 
///Null-Safety, mas se tivermos várias propriedades, será
///preciso declarar vários getters e setters para cada 
///propriedade que quiséssemos. Então, para evitar este
///problema, foi criado o modificador abstract para o 
///atributo, tal como mostra a classe Veiculo3
// abstract class Veiculo2 {
//   String modelo;
// }

///Aqui o campo modelo é interpretado como um getter e 
///como um setter, mas é muito mais fácil de trabalhar assim
///por não ter que criar vários getters e setters para cada
///atributo.
abstract class Veiculo3 {
  abstract String modelo;
}

///Obriga a implementar o getter e setter de modelo
class VeiculoImp extends Veiculo3 {
  ///Ou dá para sobrescrever o campo sem por o getter e
  ///settert aqui
  // @override 
  // String modelo = '';
  String get modelo => modelo;
  void set modelo(String modelo) {
    this.modelo = modelo;
  } 
}

///Obriga a implementar o getter e setter de modelo
class VeiculoImp2 implements Veiculo3 {
  ///Também funciona o override aqui ou é só implementar
  ///o getter e o setter.
  // @override 
  // String modelo = '';
  String get modelo => modelo;
  void set modelo(String m) {
    modelo = m;
  } 
}

///Ambas classes de veículo possuem o mesmo comportamento,
///são classes abstratas e a forma de acessar a leitura e
///escrita do dado é o mesmo. No dart não temos interfaces,
///então usamos classes abstratas para simular interfaces.
///A diferença de ambas é que se temos outra classe que 
///implements Veiculo teremos que implementar o getter e 
///o setter que foi criado. 
///Agora, se uma classe extender a classe Veiculo2 ela terá
///acesso ao atributo modelo. Se usarmos um implements em 
///Veiculo2 teremos que implementar o setter modelo e o 
///getter modelo.
///A implementação da classe Veiculo2 antes do Null-Safety
///ficaria assim e funcionaria normalmente:
// class Teste implements Veiculo2 {
//   late String variavel;
//   String get modelo => variavel;
//   set modelo(String m) => variavel = m;    
// }

///Agora a herança em Veiculo2 ficaria assim antes do 
///Null-Safety e também funcionaria (como vemos é possível
///acessar o atributo modelo que estava na classe pai):
// class Teste2 extends Veiculo2 {
//   Teste() {
//     print(modelo);
//   }
// }

void main() {
  void _printSeparation() {
    print('---------');
  }

  final pessoa = Pessoa();
  ///Campo armazenado pois é só um campo da classe com um
  ///valor armazenado nele
  print(pessoa.idade);
  _printSeparation();

  final pessoa2 = Pessoa2();
  ///Campo computado pois é um campo calculado a partir de
  ///algo.
  print(pessoa2.idade);
  _printSeparation();

  ///Ou seja, para sabermos se um campo de uma classe é 
  ///armazenado ou computado, temos que entrar na classe
  ///para ver como o campo foi criado. Esse é o princípio
  ///UAP, que nos diz que é impossível saber se uma propriedade
  ///é computada ou armazenada.
}