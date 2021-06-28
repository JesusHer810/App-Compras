import 'package:flutter/material.dart';

class Descripcion extends StatelessWidget {
  final String titulo;
  final String descripcion;

  const Descripcion ({Key key, this.titulo, this.descripcion});



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30), //SE ACOMODA LA LETRA DE DESCRIPCION//
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, //HACE QUE EL TITULO SE ACOMODE DE FORMA CENTRADAD ARRIBA//
        children: <Widget>[
          //CustomAppBar( texto: 'for you'),
          SizedBox( height: 30,), //AQUI SE DA UN ESPACIO ENTRE CADA UNO DEL TITULO Y LA DESCIPCION//
          Text( this.titulo, style: TextStyle( fontSize: 40, fontWeight: FontWeight.w700)),
           SizedBox( height: 30,),
           

          Text( this.descripcion, style: TextStyle( color: Colors.black54, height: 3.1 )),
        ]
      ),
      
    );
  }
}