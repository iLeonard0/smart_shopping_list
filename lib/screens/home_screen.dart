import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> fetchPlatformData() async {
    try {
      const platform = MethodChannel('com.example.smart_shopping_list/channel');
      final String platformData = await platform.invokeMethod('getPlatformData');
      print("Dados da plataforma: $platformData");
    } catch (e) {
      print("Erro ao obter dados da plataforma: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/products');
                    fetchPlatformData();
                  },
                  child: Text(
                    'SmartShopper',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/products');
                    fetchPlatformData();
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                  child: const Text(''),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
