


class BarChartModel {

  final double date26;
  final double date27;
  final double date28;
  final double date29;
  final double date30;
  final double date31;

  BarChartModel({
    required this.date26,required this.date27,required this.date28,required this.date29,required this.date30,required this.date31,
  });


  List<IndividualBar> barData = [];

  void InitializeBarData(){
    barData = [
      IndividualBar(x: 26, y: date26),
      IndividualBar(x: 27, y: date27),
      IndividualBar(x: 28, y: date28),
      IndividualBar(x: 29, y: date29),
      IndividualBar(x: 30, y: date30),
      IndividualBar(x: 31, y: date31),
    ];
  }
}

class IndividualBar{
  final int x;
  final double y;

  IndividualBar({required this.x, required this.y, });

}
