class ShoppingItem {
  int? id;
  String name;
  bool isBought;

  ShoppingItem({this.id, required this.name, this.isBought = false});

  factory ShoppingItem.fromMap(Map<String, dynamic> map) {
    return ShoppingItem(
      id: map['id'],
      name: map['name'],
      isBought: map['isBought'] == 1,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'isBought': isBought ? 1 : 0,
    };
  }
}
