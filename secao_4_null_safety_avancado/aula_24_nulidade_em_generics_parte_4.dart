class Interval<T extends num?> {
  T? min, max;
  bool get isEmpty {
    ///Como os campos min e max são potencialmente nullables, temos que
    ///os tratar aqui, e no caso fazendo a promoção com variáveis 
    ///locais.
    var localMin = min;
    var localMax = max;
    if (localMin == null || localMax == null) {
      return false;
    }

    return localMax <= localMin;
  }
}