import 'package:flutter/material.dart';

class Producto{ //DENTRO DE ESTA CLASE SE DECLARA LOS VALORES DE TIPO STRING//"productosModel"
 final String name;
 final String image;
 final String color;
 final  price; //ESTE SERA DE TIPO ENTERO //
 int quiantity; //ESTE SERA DE TIPO ENTERO POR LA CANTIDAD/


 Producto({this.name,this.image, this.color, this.price, this.quiantity = 1}); //EN EL "quantity" SE UTILIZSA UN VALOR EN ESTE CASO1 POR DEFECTO"

}