import 'package:flutter/material.dart';

class image extends StatelessWidget{
  @override
  var direccionImagen;
  var _largo;
  var _ancho;

  image(String di,Orientation deviceOrientation){
    this.direccionImagen=di;
    if(deviceOrientation ==Orientation.portrait){
      _ancho=250.0;
      _largo=200.0;
    }else{
      _ancho=150.0;
      _largo=200.0;
    }
  }

  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
        width: _ancho,
        height: _largo,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/fotografia.jpg',),
                fit: BoxFit.cover
            ),
            borderRadius: BorderRadius.all(Radius.circular(50.0))
          ),
        );
  }
}

class contenedorTextos extends StatelessWidget{
  @override

  var _paddingh;
  var _paddingv;

  contenedorTextos(Orientation deviceOrientation){
    if(deviceOrientation==Orientation.portrait){
      _paddingh=0.0;
      _paddingv=30.0;
    }else{
      _paddingh=0.0;
      _paddingv=40.0;
    }
  }

  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: _paddingv,horizontal: _paddingh ),
        child: Column(
          children: <Widget>[
            Text('Alvaro Martinez Mancilla',style: TextStyle(fontSize: 15.0,color: Colors.black),),
            Text('@Alvardud',style: TextStyle(fontSize: 12.0,color: Colors.blueGrey),),
          ],
        ),
      ),
    );
  }
}

class elementoVertical extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
        width: 200.0,
        height: 300.0,
        child: Column(
          children: <Widget>[
            image('assets/fotografia.jpg',MediaQuery.of(context).orientation),
            contenedorTextos(MediaQuery.of(context).orientation),
          ],
        ),
      ),
    );
  }
}

class elementoHorizontal extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      width: 200.0,
      height: 150.0,
      child: Row(
        children: <Widget>[
          image('assets/fotografia.jpg',MediaQuery.of(context).orientation),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
            child: Container(
              width: 350.0,
              height: 200.0,
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: <Widget>[
                  contenedorTextos(MediaQuery.of(context).orientation),
                  Container(
                    child: Text('Soy un estudiante del study jam de flutter, \ntambien soy miembro de la comuninad GDG La Paz',
                        style: TextStyle(fontSize: 15.0,color: Colors.blueGrey)),)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class cuentaLayout extends StatelessWidget{
  
  Widget creadorLayout(Orientation deviceOrientation){
    if(deviceOrientation == Orientation.portrait){
      return elementoVertical();
    }else return elementoHorizontal();
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    assert (debugCheckHasMediaQuery(context));
    return creadorLayout(MediaQuery.of(context).orientation);
  }
}