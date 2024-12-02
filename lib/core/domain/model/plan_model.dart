class PlanModel {
  final String title;
  final String description;
  final double price;

  PlanModel({required this.title, required this.description, required this.price});
}


enum TimeOption {
  Yearly,
  Monthly
}