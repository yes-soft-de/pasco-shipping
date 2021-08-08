class ProductRequest {
  int? id;
  String name;
  String description;
  String hscode;

  ProductRequest(
      {this.id,
      required this.name,
      required this.description,
        required this.hscode
      });

  Map<String, dynamic> toJson() {
    if (id == null) {
      return {'name': name, 'description': description , 'hsCode':hscode};
    } else {
      return {
        'id': id,
        'name': name,
        'description': description,
        'hsCode':hscode
      };
    }
  }
}
