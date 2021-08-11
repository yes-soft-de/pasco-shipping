class SubProductRequest {
  int? id;
  int productCategoryID;
  String name;
  String description;
  String hscode;

  SubProductRequest(
      {this.id,
      required this.name,
      required this.description,
        required this.hscode,
        required this.productCategoryID
      });

  Map<String, dynamic> toJson() {
    if (id == null) {
      return {'name': name, 'description': description , 'hsCode':hscode ,'productCategoryID':productCategoryID};
    } else {
      return {
        'id': id,
        'name': name,
        'description': description,
        'hsCode':hscode,
        'productCategoryID':productCategoryID
      };
    }
  }
}
