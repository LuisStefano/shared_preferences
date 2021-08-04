import 'package:flutter/material.dart';
import 'package:preferencias/src/share_prefs/preferencias_usuario.dart';
import 'package:preferencias/src/widgets/menu_widgets.dart';


class HomePage extends StatelessWidget {
  
  static final String routeName   = 'home';
  final prefs                     = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {

    prefs.ultimaPgina = HomePage.routeName;

    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias'),
        backgroundColor: ( prefs.colorSecundario ) ? Colors.amber : Colors.green,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Color secundario: ${prefs.colorSecundario}'),
          Divider(),
          Text('Genero ${prefs.genero}'),
          Divider(),
          Text('Nombre de usuario: ${prefs.nombreUsuario}'),
          Divider(),
        ],
      ),
    );
  }
  

  
}