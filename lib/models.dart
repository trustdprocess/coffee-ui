// ignore_for_file: public_member_api_docs, sort_constructors_first
class models {
  int? id;
  String? name;
  double? price;
  String? category;
  String? image;
  String? description;
  models({
    this.id,
    this.name,
    this.price,
    this.category,
    this.image,
    this.description,
  });
  models.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
     price = json["price"];
      category = json["category"];
       image = json["image"];
        description = json["description"];

  }
}
