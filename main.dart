import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'provider/foto_provider.dart';
import 'views/foto_view.dart';
import 'views/perfil_view.dart';
import 'views/home_view.dart';

void main(){
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => FotoProvider()),
  ],
    child: MyApp(),

  ));
}

class MyApp extends StatefulWidget{
  @override
  State<MyApp> createState() => MyAppState();

}

class MyAppState extends State<MyApp> {
  int index = 0;
  final screens = [
    HomeView(),
    FotoView(),
    PerfilView(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: screens[index],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          onTap: (i) => setState(() => index = i),
          items: [BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.camera_alt), label: "Fotos"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perdil"),
        ])
        )
      );
  }

}
