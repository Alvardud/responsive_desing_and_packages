import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:responsive_desing_and_packages/primerLayout.dart';
import 'package:responsive_desing_and_packages/cuentaLayout.dart';

void main() => runApp(new MyApp());


class LayoutPrincipal extends StatefulWidget{
  @override
  _tabs createState()=>_tabs();
}

class _tabs extends State<LayoutPrincipal>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            backgroundColor: CupertinoColors.lightBackgroundGray,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.home),
                  title: Text('Inicio')),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.profile_circled),
                  title: Text('Cuenta'))
            ],
          ),
          tabBuilder: (context,index){
            return CupertinoTabView(
              builder: (context){
                switch(index){
                  case 0:
                    return primerLayout();
                  case 1:
                    return cuentaLayout();
                  default:
                    return Container();
                }
              },
            );
          }),
    );
  }
}


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Resposive App',
      debugShowCheckedModeBanner: false,
      home: LayoutPrincipal(),
    );
  }
}
