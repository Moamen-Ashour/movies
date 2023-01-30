

class CategoryModel{

  final int id;
  final String name;



  const CategoryModel ({
    required this.id,
    required this.name,
  });



  factory CategoryModel.fromJson(Map<String , dynamic> json) => CategoryModel(
    id:json["id"],
    name:json["name"],

  );
}