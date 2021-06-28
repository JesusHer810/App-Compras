import 'package:flutter/material.dart';

class ZapatoPreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric( horizontal:40, vertical: 40), //COMO SE ESTIRA EL CUADRO NEGRO//
      child: Container(
        width: double.infinity,
        height: 400, //LARGO DEL RECUADRO BLANCO//
        decoration: BoxDecoration(
          color: Colors.grey, //COLOR DEL RECUADRO CHICO//
          borderRadius: BorderRadius.circular(50),
        ),
        child: Column(
          children: <Widget>[

              _HomeConSombra(),
          ]
        ),
        

      ),
    );
  }

}


  class _HomeConSombra   extends StatelessWidget {
 
  
    @override
    Widget build(BuildContext context) {
      return Stack( //ESTE LE HARA LAS FILAS Y LAS COLUMNAS//
        children: <Widget>[
          
            Image( image: AssetImage('assets/image/bienvenida.gif', )),
        ],
      );
    }
  }