//ESTE ARCHIVO ES EL ENCARGADO DE HACER ÑLA INTERACCION DIRECTA CON MI BASE DE  DATOS//



import 'package:flutter/material.dart';
import 'package:formvalidation/src/models/producto_model.dart'; //IMPORTACION DE LA PAGINA "producto_model"//
import 'package:http/http.dart' as http; //AQUI IMPORTO EL PAQUETE Y DIGO QUE SEA APLICADO A ACCESIBLES A TODA HTTP//
//import 'dart:html';
import 'dart:convert';

import 'package:url/url.dart';

class ProductosProvider {

 final String _url = 'https://appflutter-8b47d-default-rtdb.firebaseio.com'; //AQUI VA MI URL DE MI FIREBASE//

 Future<bool> crearProducto ( ProductoModel producto ) async { //ES UN "async" PORQUE S EHARA UNA INSERCCION//

   final url = '$_url/producto.json'; //ESTA ES LA PETICIN DONDE QUIERO HACER LA PETICION POST//

   final resp = await http.post(url, body: productoModelToJson(producto));//ES UN FUTURE RESPONSE//
   final decodeData = json.decode( resp.body);

   print ( decodeData);
   return true;

 }
 ///NECESITA RETORNAR LOS PRODUCTOS PERO AHORA SI QUE LOS MUESTRE EN PANTALLA//
 
 Future<List<ProductoModel>> cargarProductos() async {

   final url = '$_url/producto.json';
   final resp = await http.get(url);

   final decodeData = json.decode(resp.body);
 }

}