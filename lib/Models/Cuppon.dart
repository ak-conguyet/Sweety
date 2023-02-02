
class Cuppon{
  final String id;
  final String description;
  final double minApply;
  final double maxOff;
  final double percentOff;
  final double saleOff;
  final DateTime exp;

  Cuppon({
    required this.id, required this.description, required this.minApply, required this.maxOff, required this.percentOff, required this.saleOff, required this.exp
  });

}