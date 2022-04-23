

class BasePayment {
     late String paymentID;
     late double amount ;
   late  DateTime paymentDate ;
    late  String paymentMethode ;

     BasePayment(this.paymentID, this.amount, this.paymentDate, this.paymentMethode);

     BasePayment.fromJson(Map<String , dynamic> jsonObject){
       this.paymentID = jsonObject['payment_id'];
       this.amount = jsonObject ['amount'];
       this.paymentDate = DateTime.parse(jsonObject['payment_date']);
       this.paymentMethode = jsonObject ['payment_method'];

     }
}