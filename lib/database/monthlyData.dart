class Monthly {
  double one;
  double two;
  double three;
  double four;
  double five;
  double six;
  double seven;
  Monthly({
    required this.one,
    required this.two,
    required this.three,
    required this.four,
    required this.five,
    required this.six,
    required this.seven,
  });
  List<Inidividual> monthly = [];
  void initialize() {
    monthly = [
      Inidividual(xAxis: 1, yAxis: one),
      Inidividual(xAxis: 2, yAxis: two),
      Inidividual(xAxis: 3, yAxis: three),
      Inidividual(xAxis: 4, yAxis: four),
      Inidividual(xAxis: 5, yAxis: five),
      Inidividual(xAxis: 6, yAxis: six),
      Inidividual(xAxis: 7, yAxis: seven),
    ];
  }
}

class Inidividual {
  double xAxis;
  double yAxis;
  Inidividual({
    required this.xAxis,
    required this.yAxis,
  });
}
