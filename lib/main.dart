import 'package:flutter/material.dart';
import 'package:preferencias/src/pages/home_page.dart';
import 'package:preferencias/src/pages/settings_page.dart';
import 'package:preferencias/src/share_prefs/preferencias_usuario.dart';
 
void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  runApp(MyApp());

}
 
class MyApp extends StatelessWidget {

  final prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Preferencias',
      initialRoute: prefs.ultimaPgina,
      routes: {
        HomePage.routeName     : ( BuildContext context ) => HomePage(),
        SettignsPage.routeName : ( BuildContext context ) => SettignsPage(),
      },
    );
  }
}