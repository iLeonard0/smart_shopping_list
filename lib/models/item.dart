class ShoppingItem {
  int? id;
  String name;
  bool isBought;

  ShoppingItem({this.id, required this.name, this.isBought = false});

  // Converte de um mapa (do banco de dados) para um objeto ShoppingItem
  factory ShoppingItem.fromMap(Map<String, dynamic> map) {
    return ShoppingItem(
      id: map['id'],
      name: map['name'],
      isBought: map['isBought'] == 1,
    );
  }

  // Converte um objeto ShoppingItem para um mapa (para salvar no banco)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'isBought': isBought ? 1 : 0,
    };
  }
}
