class Address {


  late String streetName ;
  late String streetNumber ;
  late  String city;
  late  String state ;
  late String country ;
  late  String postCode ;




  Address.fromjson (Map<String,dynamic> jsonObject){
    this.streetName=jsonObject['street_name'];
    this.streetNumber=jsonObject['street_number'];
    this.city=jsonObject['city'];
    this.state=jsonObject['state'];
    this.country=jsonObject['country'];
    this.postCode=jsonObject['post_code'];
  }

    }