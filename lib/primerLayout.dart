import 'package:flutter/material.dart';
import 'package:responsive_desing_and_packages/imagenMuestra.dart';

class elemento extends StatelessWidget{

  String _texto;
  IconData _icono;
  Color _color;
  imagen _image;

  elemento(String t, IconData i,Color c){
    _texto=t;
    _color=c;
    _icono=i;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      padding: EdgeInsets.only(top: 50.0),
      color: _color,
      child:InkWell(
        onTap: (){
          _image=new imagen(_texto);
          Navigator.push(context,MaterialPageRoute(
              builder: (context)=>_image) );
        },
          child: Column(
            children: <Widget>[
              Icon(_icono,size: 40.0,color: Colors.white,),
              Container(
                  padding: EdgeInsets.only(top:5.0),
                  child:Text(_texto,style: TextStyle(fontSize: 15.0,color: Colors.white),)
              ),
            ],
          )
      )
    );
  }
}

class elementoVertical extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(left: 15.0,right: 15.0,top: 30.0,bottom: 10.0),
      child: GridView.count(
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        children: <Widget>[
          elemento("Camara",Icons.camera_alt,Colors.brown),
          elemento("Bluetooth",Icons.bluetooth,Colors.green),
          elemento("Galeria",Icons.image,Colors.deepPurpleAccent),
          elemento("Llamadas",Icons.call,Colors.deepOrangeAccent),
          elemento("Nuevo",Icons.add,Colors.black),
        ],
      ),
    );
  }
}

class contenedorHorizontal extends StatelessWidget{

  String _nombre;
  IconData _icon;
  Color _color;

  contenedorHorizontal(String n,IconData i,Color c){
    _nombre=n;
    _icon=i;
    _color=c;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final pantalla=MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 80.0,horizontal: 10.0),
      width: 150.0,
      height: 100.0,
      child: elemento(_nombre,_icon,_color),

    );
  }
}

class elementoHorizontal extends StatelessWidget{
  @override

  Widget build(BuildContext context) {

    final pantalla=MediaQuery.of(context).size;
    // TODO: implement build
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        contenedorHorizontal("Camara",Icons.camera_alt,Colors.brown),
        contenedorHorizontal("Bluetooth",Icons.bluetooth,Colors.green),
        contenedorHorizontal("Galeria",Icons.image,Colors.deepPurpleAccent),
        contenedorHorizontal("Llamadas",Icons.call,Colors.deepOrangeAccent),
        contenedorHorizontal("Nuevo",Icons.add,Colors.black),


        //Container(width: pantalla.width/4,height: pantalla.height,child:elemento("Camara",Icons.camera_alt,Colors.brown),),
        /*Container(width: pantalla.width/4,height: pantalla.height,child:elemento("Bluetooth",Icons.bluetooth,Colors.green)),
        Container(width: pantalla.width/4,height: pantalla.height,child:elemento("Galeria",Icons.image,Colors.deepPurpleAccent),),
        Container(width: pantalla.width/4,height: pantalla.height,child:elemento("Llamadas",Icons.call,Colors.deepOrangeAccent)),
        Container(width: pantalla.width/4,height: pantalla.height,child:elemento("Nuevo",Icons.add,Colors.black),),
      */
      ],
    );
  }
  }


class primerLayout extends StatelessWidget{
  @override

  Widget _constructorWidget(Orientation deviceOrientation){
    if(deviceOrientation == Orientation.portrait){
      return elementoVertical();
    }else return elementoHorizontal();
  }


  Widget build(BuildContext context) {
    // TODO: implement build
    assert (debugCheckHasMediaQuery(context));
    return _constructorWidget(MediaQuery.of(context).orientation);
  }
}