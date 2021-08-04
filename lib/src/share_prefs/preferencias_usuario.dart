import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {

  static final PreferenciasUsuario _instancia = new PreferenciasUsuario._internal();

  factory PreferenciasUsuario(){
    return _instancia;
  }  

  PreferenciasUsuario._internal();

  SharedPreferences? _prefs;

  initPrefs() async {
   this._prefs = await SharedPreferences.getInstance();
  }

  // SET Y GET genero
  get genero {
    return _prefs?.getInt('genero') ?? 1;
  }

  set genero( value ){
    _prefs?.setInt('genero', value);
  }


  // SET Y GET colorSecundario
  get colorSecundario {
    return _prefs?.getBool('colorSecundario') ?? false;
  }

  set colorSecundario( value ){
    _prefs?.setBool('colorSecundario', value);
  }

  //SET Y GET nombreUsuario
  get nombreUsuario {
    return _prefs?.getString('nombreUsuario') ?? '';
  }

  set nombreUsuario( value ){
    _prefs?.setString('nombreUsuario', value);
  }

  //SET Y GET ultimaPgina
  get ultimaPgina {
    return _prefs?.getString('ultimaPgina') ?? 'home';
  }

  set ultimaPgina( value ){
    _prefs?.setString('ultimaPgina', value);
  }

}