class Category {
  final int? id;
  final String name;

  const Category({this.id, this.name = ''});

  // Custom fromJson method
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] as int?,
      name: json['name'] as String? ?? '',
    );
  }

  // Custom toJson method
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
