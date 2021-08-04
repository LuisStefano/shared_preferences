import 'package:flutter/material.dart';
import 'package:preferencias/src/share_prefs/preferencias_usuario.dart';
import 'package:preferencias/src/widgets/menu_widgets.dart';



class SettignsPage extends StatefulWidget {  
  static final String routeName = 'setting';

  @override
  _SettignsPageState createState() => _SettignsPageState();
}

class _SettignsPageState extends State<SettignsPage> {

  bool _colorSecundario = true;
  int? _genero;
  //String _nombre = 'Luis';

  TextEditingController? _textCtrl;

  final prefs = new PreferenciasUsuario();

  @override
  void initState() {
    super.initState();

    prefs.ultimaPgina   = SettignsPage.routeName;
    _genero             = prefs.genero;
    _colorSecundario    = prefs.colorSecundario;
    _textCtrl           = new TextEditingController( text: prefs.nombreUsuario );
  }


  _selectedRadio( valor ) {
    prefs.genero  = valor;
    _genero       = valor;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
        backgroundColor: ( prefs.colorSecundario ) ? Colors.amber : Colors.green,
      ),
      drawer: MenuWidget(),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text(
              'Setting',
              style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold ),
            ),
          ),
          Divider(),
          SwitchListTile(
            value: _colorSecundario,
            title: Text('Color secundario: ${prefs.colorSecundario}'),
            onChanged: ( value ) {
              _colorSecundario = value;
              prefs.colorSecundario = value;
              print(_colorSecundario);
              setState(() {
                
              });
            },
          ),
          RadioListTile(
            value: 1,
            groupValue: _genero,
            title: Text('Masculino'),
            onChanged: _selectedRadio,
          ),
          RadioListTile(
            value: 2,
            groupValue: _genero,
            title: Text('Femenino'),
            onChanged: _selectedRadio,
          ),
          Divider(),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textCtrl,
              decoration: InputDecoration(
                labelText: 'Nombre',
                helperText: 'Nombre de la persona',
              ),
              onChanged: ( value ) {
                prefs.nombreUsuario = value;
              },
            ),
          )
        ],
      )
    );
  }
}