import 'package:flutter/material.dart';

import 'pages/home_page.dart';

class GemStoreApp extends StatelessWidget {
  const GemStoreApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'GemStore',
    theme: ThemeData(
      scaffoldBackgroundColor: Colors.white,
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff372b29)),
      useMaterial3: true,
    ),
    home: const HomePage(),
  );
}

class MyApp extends GemStoreApp {
  const MyApp({super.key});
}
