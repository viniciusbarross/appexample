import 'package:flutter/material.dart';
import 'package:appexample/core/theme_consts.dart';
import 'package:appexample/features/favorites/presentation/controller/favorites_controller.dart';
import 'package:appexample/features/favorites/presentation/favorites_screen.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => FavoritesController(),
        child: MaterialApp(
          title: 'Favorites websites',
          theme: ThemeData(
            buttonTheme: const ButtonThemeData(buttonColor: Color(secondaryColor)),
            inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: const Color(secondaryColor),
              contentPadding: const EdgeInsets.all(10),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 1, color: primaryColor),
                borderRadius: BorderRadius.circular(40.0),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40.0),
              ),
            ),
            appBarTheme: const AppBarTheme(color: Color(secondaryColor)),
            colorScheme:
                ColorScheme.fromSeed(seedColor: Colors.deepPurple, secondary: const Color(secondaryColor), primary: primaryColor),
            useMaterial3: true,
          ),
          home: const FavoritesScreen(),
        ));
  }
}
