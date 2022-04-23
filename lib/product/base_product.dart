



import '../category/base_category.dart';
import '../category/category_controller.dart';
import '../discount/base_discount.dart';
import '../discount/discount_controller.dart';
import '../image/base_image.dart';
import '../image/image_controller.dart';
import '../product_option/base_option.dart';
import '../tag/base_tag.dart';
import '../tag/tag_controller.dart';

class BaseProduct {

  late  String  id ;
  late  String title ;
  late String description ;
  late  String price ;
  late  double quantity ;
  late  List<BaseImage> images ;
  late  List<BaseProductOption> options ;
  late  List<BaseCategory> categories ;
  late  List<BaseTag> tags ;
  late  List<BaseDiscount> discounts ;


    BaseProduct(this.id, this.title, this.description, this.price, this.quantity,
      this.images, this.options, this.categories, this.tags, this.discounts);

  BaseProduct.fromJson(Map<String , dynamic> jsonObject){
        this.id = jsonObject['id'];
        this.title = jsonObject['title'];
        this.description = jsonObject['description'];
        this.price = jsonObject['price'];
        this.quantity = jsonObject['quantity'];
        this.images = ImageController.toImages(jsonObject['images']);
        this.categories = CategoryController.toCategories(jsonObject['categories']);
        this.tags = TagController.toTags(jsonObject['tags']);
        this.discounts = DiscountController.toDiscopunts(jsonObject['discouints']);
    }
}