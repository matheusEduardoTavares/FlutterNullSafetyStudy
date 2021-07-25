///Variáveis superiores e campos estáticos sempre devem ser inicializadas. Elas
///podem ser acessadas de qualquer parte do código, então é impossível o dart
///analyser prever o valor que elas terão em execução, e se as inicializarmos 
///como não nullable, então somos obrigado a inicializá-las.
int variavelSuperior = 0;
late int erroSeUsarSemInicializar;

class AlgumaClasse {
  static int campoEstatico = 0;
}

///Os atributos de uma classe não nullables devem sempre ser inicializados, 
///seja dentro do construtor (usando this), seja diretamente na declaração 
///como o [umaDeclaracao], ou através da inicialização em lista, que também 
///pertence ao construtor, mas é inicializado em forma de lista, que é o 
///caso do [inicializacaoDaList]
class ClasseDeInicializacao {
  ClasseDeInicializacao(
    this.inicializandoFormal,
  ) : inicializacaoDaList = 0;

  int umaDeclaracao = 0;
  int inicializandoFormal;
  int inicializacaoDaList;
}

///Agora, variáveis locais não precisam ser inicializadas
int seqFibonacci(int n) {
  ///Variável não nullable, mas é local então pode inicializar ela como nula, 
  ///mas dará erro de compilação se em algum fluxo ela acabar não sendo inicializada
  int resultado;
  if (n < 2) {
    resultado = n;
  }
  else {
    resultado = seqFibonacci(n - 2) + seqFibonacci(n - 1);
  }

  return resultado;
}

///Parâmetros opcionais devem ter um valor Padrão (Default)
///Dá erro pois o parâmetro opcional está nulo:
// void printNomePessoa({String nome}) {}
///Funciona:
void printNomePessoa({String nome = 'Sem nome'}) {
  print('nome = $nome');
}

main(List<String> args) {
  print(variavelSuperior);
  ///Sem a linha 16 iria dar erro por estarmos tentando usar uma variável
  ///não nullable e que não foi inicializada ainda
  erroSeUsarSemInicializar = 5;
  print(erroSeUsarSemInicializar);
  print(AlgumaClasse.campoEstatico);
  ///Exemplo de variável local:
  int value;
  ///Irá dar erro caso não a inicializemos diretamente (exemplo: int value = 0;),
  ///ou então como na linha abaixo
  value = 2;
  print(value);

  print('seqFibonacci(2) = ${seqFibonacci(2)}'); // 1
  print('seqFibonacci(5) = ${seqFibonacci(5)}'); // 5
  print('seqFibonacci(7) = ${seqFibonacci(7)}'); // 13

  printNomePessoa();
  printNomePessoa(nome: 'Daniel');

  ///Agora, para variáveis nullables, podemos as declarar de qualquer forma
  ///sem restrições
}