import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class imagen extends StatefulWidget{

  String _texto;
  imagen(String t){
    _texto=t;
  }
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return estadoImagen(_texto);
  }

}
class estadoImagen extends State<imagen>{

  String _texto;

  estadoImagen(String t){
    _texto=t;
  }

  picker(){

    switch(_texto){
      case 'Camara':
        ImagePicker.pickImage(source: ImageSource.camera);
        break ;
      case 'Galeria':
        ImagePicker.pickImage(source: ImageSource.gallery);
        break;
      default:
        print('no se realizo ninguna acción');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
      title: _texto,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(_texto),
          centerTitle: true,
          leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
            Navigator.pop(context);
          }),
        ),
        body: Center(
          child:Container(
            width: 200.0,
            height: 100.0,
            child:Center(
              child: RaisedButton(
                  color: Colors.deepPurple,
                  onPressed: picker,
                  child:Text('Activar',style: TextStyle(color: Colors.white,fontSize: 20.0))),
            ),
          ),
        ),
      ),
    );
  }
}