class BaseTag{

  late String id;
  late String title ;

  BaseTag(this.id , this.title);

  BaseTag.fromJson(Map<String , dynamic> jsonObject){
    this.title = jsonObject['title'];
    this.id  = jsonObject['id'];
  }

}