import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'screens/product_list_screen.dart';
import 'providers/shopping_list_provider.dart';
import 'providers/product_provider.dart';
import 'providers/theme_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ShoppingListProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Smart Shopping List',
          theme: themeProvider.currentTheme,
          home: HomeScreen(),
          routes: {
            '/products': (context) => ProductListScreen(),
          },
        );
      },
    );
  }
}
