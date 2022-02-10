class JCoffeeModel {
  String? title;
  int? price;
  String? img;
  
  JCoffeeModel({
    this.title,
    this.price,
    this.img,
  });
  static JCoffeeModel fromJson(Map<String, dynamic> json) {
    return JCoffeeModel(
      title: json["title"],
      price: json["price"],
      img: json["img"],
    );
  }
}