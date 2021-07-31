///No generics colocar só <T> significa que o tipo T pode ser nullable ou 
///não nullable, isso é chamado de potencialmente Nullable, pode ser que seja
///nullable, devido a isso, as classes genericas acabam adquirindo tanto as 
///restrições do nullable e do não nullable
class Box<T> {
  final T object;
  Box(this.object);
}

void main(List<String> args) {
  ///Obrigatório passar valor não nulo
  Box<String>('a string');
  ///Pode passar null
  Box<int?>(null);
}