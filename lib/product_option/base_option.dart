class BaseProductOption {

  late String name ;
  late String value ;
  late String meta ;
  late double price ;

  BaseProductOption(this.name, this.value, this.meta, this.price);

  BaseProductOption.fromJson (Map<String , dynamic> jsonObject){
    this.name = jsonObject ['name'];
    this.value = jsonObject ['value'];
    this.meta = jsonObject ['meta'];
    this.price =jsonObject ['price'];
  }
}