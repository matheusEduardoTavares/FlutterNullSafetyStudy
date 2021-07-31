///Mas temos mecanismos para controlar melhor essa 
///nulidade nos generics
class Box<T> {
  ///Aqui declaramos o generics como nullable, deixando
  ///portanto o campo nullable, sendo útil isso apenas
  ///se não precisamos chamar nenhum método ou atributo
  ///desta variável object pois sendo nullable teríamos
  ///que fazer o cast como já vimos
  T? object;
  Box.empty();
  Box.full(this.object);

  ///Por exemplo para ler esse valor:
  T unbox() => object as T;
  ///Não devemos para o caso do generics usar o 
  ///null assertion jamais, pois em alguns casos só
  ///de usar o null assertion nesse caso irá ser 
  ///disparado uma Exception, no caso da variável 
  ///object ser nulo, diferente de usar o as T pois
  ///como o T é o generics vimos que ele pode ser os 2,
  ///aí não quebraria
}