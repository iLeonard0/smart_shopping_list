import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
import '../providers/theme_provider.dart';
import '../widgets/item_counter_widget.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

    Future<void> showAddItemDialog() async {
      TextEditingController controller = TextEditingController();

      String? newItem = await showDialog<String>(
        context: context,
        builder: (context) {
          bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

          return AlertDialog(
            title: Text(
              "Adicionar Item",
              textAlign: TextAlign.center,
              style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
            ),
            content: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "Nome do item",
                hintStyle: TextStyle(
                    color: isDarkMode ? Colors.white70 : Colors.black54),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FilledButton(
                    onPressed: () => Navigator.pop(context, null),
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.red),
                    ),
                    child: Text(
                      "Cancelar",
                      style: TextStyle(
                          color: isDarkMode ? Colors.white : Colors.white),
                    ),
                  ),
                  const SizedBox(width: 15),
                  FilledButton(
                    onPressed: () => Navigator.pop(context, controller.text),
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.black),
                    ),
                    child: Text(
                      "Adicionar",
                      style: TextStyle(
                          color: isDarkMode ? Colors.white : Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      );

      if (newItem != null && newItem.isNotEmpty) {
        provider.addItem(newItem);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Produtos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () {
              themeProvider.toggleTheme();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          ItemCounterWidget(),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Center(
              child: Text(
                provider.shoppingList.isEmpty
                    ? "Adicione itens à sua lista."
                    : "",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          if (provider.shoppingList.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: provider.shoppingList.length,
                itemBuilder: (context, index) {
                  final item = provider.shoppingList[index];
                  return ListTile(
                    title: Text(
                      item['name'],
                      style: TextStyle(
                        decoration: item['isBought']
                            ? TextDecoration.lineThrough
                            : null,
                        decorationThickness: 3.0,
                      ),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.check,
                              color: item['isBought'] ? Colors.green : null),
                          onPressed: () {
                            provider.toggleBoughtStatus(index);
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            provider.removeItem(index);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Item removido da lista!")),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  provider.fetchProducts();
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black,
                  textStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  side: BorderSide(width: 2),
                ),
                child: const Text("Ver Sugestões de Produtos"),
              ),
            ),
          ),
          if (provider.isLoading)
            const Center(child: CircularProgressIndicator()),
          if (!provider.isLoading && provider.products.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: provider.products.length,
                itemBuilder: (context, index) {
                  final product = provider.products[index];
                  return ListTile(
                    title: Text(product.title),
                    trailing: IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        provider.addItem(product.title);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content:
                                  Text("${product.title} adicionado à lista!")),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showAddItemDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
