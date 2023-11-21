import 'package:app_teste_floor/controller/app_home_controller.dart';
import 'package:app_teste_floor/core/database_impl.dart';
import 'package:app_teste_floor/views/home_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (conext) => DatabaseImpl()),
        Provider(create: (ctx) => AppHomeController(ctx.read<DatabaseImpl>()))
      ],
      child: const MaterialApp(
        home: HomeApp(),
      ),
    );
  }
}
