import 'package:app/global.dart';



class Category {
  final String name, iconUrl, id, slug;

  Category({this.id, this.name, this.iconUrl, this.slug});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['_id'],
      slug: json['slug'],

      /// path :http://192.168.1.223:2000/   categoryImage:/public/Oc7MAqqBQ-leone-venter-VieM9BdZKFo-unsplash.jpg
      iconUrl: "http://192.168.1.223:2000" + json['categoryImage'],
      name: json['name'],
    );
  }
}
