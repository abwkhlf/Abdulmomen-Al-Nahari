class CategoriesModel {
  dynamic id, name, image, description;

  CategoriesModel(
      {required this.id,
        required this.name,
      required this.image, required this.description});

  factory CategoriesModel.fromJson(Map<String, dynamic> product) {
    return CategoriesModel(
      id: product['id'],
      name: product['name'],
      image: product['image'],
      description: product['description'],
    );
  }

  CategoriesModel fromJson(Map<String, dynamic> json) {
    return CategoriesModel.fromJson(json);
  }

  factory CategoriesModel.init() {
    return CategoriesModel(
        id: '',
        name: '',
        image: '',
        description: '');
  }


  fromJsonList(List<dynamic> jsonList) {
    List<CategoriesModel> data = [];
    for (var post in jsonList) {
      data.add(CategoriesModel.fromJson(post));
    }
    return data;
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image
      };
}
