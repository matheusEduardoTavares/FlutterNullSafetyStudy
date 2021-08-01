/*
O Null-Safety foi introduzido a partir da versão
2.12 do Dart, então para migrar um projeto para
o Null-Safety primeiramente a versão do Dart
deve ser 2.12 ou superior.
Para fazer a migração do projeto, primeiro temos
que aguardar que todos os packages usados no 
projeto sejam migrados também para o Null-Safety. 
Para verificar o estado de migração das 
dependências, rodamos o seguinte comando dentro do projeto:
dart pub outdated --mode=null-safety
Assim será listado todos os packages usados no
projeto, trazendo as dependências que suportam 
o Null-Safety em verde, e as que não suportam
em vermelho.
Uma vez que todos os packages usados tenham sido
migrados para o Null-Safety, devemos atualizar
a versão desses packages para que todos os 
packages também estejam usando o Null-Safety.
Para fazer essa atualização, basta rodar o 
comando:
dart pub upgrade --null-safety
Com isso todas as dependências já são 
atualizadas para o Null-Safety, aí é só rodar:
dart pub get
Para obter todos os pacotes já que atualizamos
as versões.
É importante que todos os packages tenham suporte
do Null-Safety, porquê aí poderemos executar 
com o Sound Null-Safety, pois sabemos que isso
significa que todo o projeto está usando 
Null-Safety trazendo mais confiabilidade no 
projeto.
*/