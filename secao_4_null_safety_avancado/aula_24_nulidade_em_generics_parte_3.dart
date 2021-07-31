///Nesse caso temos uma classe que extende o tipo num
///não nullable 
class Interval<T extends num> {
  ///Nesse caso somos obrigados a inicializar os 
  ///campos min e max seja no construtor, logo após
  ///o construtor ou até na declaração, pois o tipo
  ///genérico T extender um tipo não nullable logo
  ///ele é não nullable também.
  T min, max;
  Interval(this.min, this.max);
  bool get isEmpty => max <= min;
}