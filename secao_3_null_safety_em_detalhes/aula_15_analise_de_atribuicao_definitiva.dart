///O Null-Safety trouxe mais flexibilidade também para
///variáveis do tipo final. Antes do Null-Safety era obrigatório
///inicializar uma variável do tipo final ao instanciá-la.
///Em versões anteriores ao Null-Safety, a função abaixo do 
///[seqFibonacci] daria erro pois a variável resultado é 
///marcada como final e precisaria ser inicializada já na 
///declaração. Mas no Null-Safety segue as regras já vistas,
///como está dentro de uma função, estamos tratando de escopo
///local, e podemos inicializar variáveis não nullables dentro
///de escopos locais sem a inicializar já na declaração desde
///que em todos os fluxos em algum local a mesma seja inicializada
///antes de ser usada. Com o final, a partir do momento que a 
///variável for atribuída, seu valor não será mais mudado.
int seqFibonacci(int n) {
  final int resultado;
  if (n < 2) {
    resultado = n;
  }
  else {
    resultado = seqFibonacci(n - 2) + seqFibonacci(n - 1);
  }

  ///Dará erro pois a variável [resultado] é final.
  // resultado = 3;
  return resultado;
}

main(List<String> args) {
  print(seqFibonacci(5)); 
}