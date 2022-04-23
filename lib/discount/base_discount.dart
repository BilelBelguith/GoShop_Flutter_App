class BaseDiscount {
  late double minQuantity ;
  late double maxQuantity ;
  late double amount ;
  late DateTime endDate ;

  BaseDiscount(this.minQuantity, this.maxQuantity, this.amount, this.endDate);

  BaseDiscount.fromJson (Map<String , dynamic> jsonObject){
    this.maxQuantity = jsonObject ['max_quantity'];
    this.minQuantity = jsonObject ['min_quantity'];
    this.endDate = DateTime.parse(jsonObject['end_date']);
  }
}