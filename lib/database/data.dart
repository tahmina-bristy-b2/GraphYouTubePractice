import 'package:collection/collection.dart';

class Data {
  double xAxis;
  double yAxis;
  Data({required this.xAxis, required this.yAxis});
}

List<Data> get data {
  final dataList = {10, 2, 4, 1, 8, 3, 0};
  return dataList
      .mapIndexed((index, element) =>
          Data(xAxis: index.toDouble(), yAxis: element.toDouble()))
      .toList();
}
