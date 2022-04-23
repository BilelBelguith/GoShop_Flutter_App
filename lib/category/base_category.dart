

class BaseCategory {
  late String id ;
  late String title ;

  BaseCategory(this.id, this.title);

  BaseCategory.fromJson (Map<String , dynamic> jsonObject){
    this.id = jsonObject ['id'];
    this.title = jsonObject['title'];
  }
}