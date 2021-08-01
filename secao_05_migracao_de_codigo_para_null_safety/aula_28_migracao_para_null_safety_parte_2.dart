/*
Podemos fazer a migração manualmente 
ou usando a ferramenta de migração do Dart.
O bom de usar a ferramenta de migração é que
ele fez para nós automaticamente a migração
onde conseguir, mas haverá partes do código 
que a ferramenta fará errado ou não conseguirá
fazer pois não tem como entender todo o código.
Já manualmente dá bem mais trabalho, mas fazendo
manualmente de forma certa, o resultado final 
será mais preciso.
Para fazer o processo usando a ferramenta de 
migração, podemos rodar os seguintes comandos na
ordem:
dart pub upgrade --null-safety
dart migrate
Ao rodar o dart migrate, irá aparecer uma URL no
console, devemos abrir essa URL no navegador.
A página que abrirá no navegador servirá para nos
ajudar na migração, tendo assim a estrutura de pastas,
o código do arquivo e algumas dicas que vão sendo dadas
de acordo com a linha que selecionarmos. Apenas os 
arquivos que estiverem com um check verde na estrutura
de pastas que de fato serão atualizados. Se não quisermos
migrar um arquivo específico é só tirar a seleção desse
check verde.
Basicamente no código cada arquivo que selecionamos é feito 
alterações e destacadas em azul a alteração, aí para a alteração
que clicamos será destacado a dica explicando o motivo da mudança.
É interessante lermos para entender o motivo de cada alteração.
Aí analisamos cada uma das alterações para validar se de fato 
todas elas fazem sentido, e se é o ideal, pois podem haver códigos
que funcionam só que não são o ideal.
Então pegamos esses códigos que não são o ideal e vamos alterando
as sugestões que vão sendo dadas. Alteramos essas sugestões usando
os Hint Markers.
Hint Markers são marcadores que geram efeitos na migração. 
Seus tipos:
*/
/// 1. /*!*/: Adiciona o !, marca como non-nullable;
/// 2. /*?*/: Marca como nullable;
/// 3. /*late*/: Gera uma inicialização tardia;
/// 4. /*late final*/: Gera uma inicialização tardia com o late
/// e adiciona o final também;
/// 5. /*required*/: Marca o parâmetro como obrigatório;

void main(List<String> args) {
  ///Exemplo de código para ser migrado:
  /*
    var ints = const <int>[0, null];
    var zero = ints[0];
    var one = zero + 1;
    var zeroOne = <int>[zero, one];
  */

  ///Como ficou após a migração:
  /*
    var ints = const <int?>[0, null];
    var zero = ints[0];
    var one = zero! + 1;
    var zeroOne = <int?>[zero, one];
  */

  ///Mas como podemos ver após a migração, a variável zeroOne não
  ///precisa ser nullable pois temos certeza que ambas as variáveis
  ///dentro da lista foram declaradas, então adicionamos um Hint 
  ///Marker mostrando que a variável zero com certeza é não nula 
  ///de forma que após fazer a migração com o Hint Marker, a 
  ///variável zeroOne venha tipada como non-nullable certo.
  ///Como fica com o Hint Marker:
  var ints = const <int?>[0, null];
  var zero = ints[0]/*!*/;
  var one = zero! + 1;
  var zeroOne = <int>[zero, one];
  print('zeroOne = $zeroOne');

  ///Basicamente o Hint Marker troca as propostas da ferramenta
  ///pois assim a ferramenta vai entender exatamente como o 
  ///código deve funcionar com os Hint Markers.
  
  ///Após analisar todo o código a ser migrado, clicamos em 
  ///Apply Migration. Ao clicar em Apply Migration, será pego
  ///todas as mudanças sugeridas. Sempre é bom ter um backup do
  ///código do projeto, principalmente gerenciamento de versão.
  ///Após migrar, temos que remover os Hint Markers que ficaram
  ///no código na mão.
  ///Caso a ferramenta de migração esteja rodando e alteremos algo
  ///no código fonte é só clicar em "Rerun from sources" para 
  ///atualizar o código da ferramenta de migração com o código
  ///fonte.
  
  /*
  Agora, para fazer a migração manual, temos que ir primeiramente
  no puspec.yaml e lá em environment tem a versão do SDK. Temos
  que setar a versão mínima para 2.12.0 ou superior. Aí rodamos:
  dart pub get
  Aí fazemos o mesmo procedimento dos packages para o manual, 
  atualizando um por um.
  Ao abrir a IDE irão aparecer inúmeros erros, e teremos que ir 
  mudando um por um segundo a regra do Null-Safety. Podemos deixar
  alguns arquivos específicos para migrar para depois, e para tal
  é só por esse comentário no começo do arquivo:
  // @dart = 2.9
  Mas o ideal é sempre migrar o código por completo para garantir
  mais segurança para o projeto.
  Feito isso, é só testar o código e validar se está tudo certo.
  */
}