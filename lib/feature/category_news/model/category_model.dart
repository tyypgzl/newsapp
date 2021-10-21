class CategoryModel {
  String? imageUrl;
  String? categoryName;

  CategoryModel({this.imageUrl, this.categoryName});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    categoryName = json['categoryName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['imageUrl'] = imageUrl;
    data['categoryName'] = categoryName;
    return data;
  }
}
