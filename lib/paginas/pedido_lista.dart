

import 'package:flutter/material.dart';
import 'package:converse_flutter/models/producto_model.dart';
//IMPORTACION DE LOS PQUETES DE ANIMACION//
/*import 'package:fancy_dialog/fancy_dialog.dart'; //IMPORTACION DEL "fancy_dialog"//
import 'package:fancy_dialog/FancyTheme.dart'; //IMPORTACION DEL "fancy_theme"//
import 'package:fancy_dialog/FancyAnimation.dart'; //IMPORTACION "fancy_animation"//
import 'package:fancy_dialog/FancyGif.dart'; //IMPORTACION DEL "fancy_Gif"*/

class Cart extends StatefulWidget {
  
  final List<Producto> _cart;
  
  Cart(this._cart);

  @override
  _CartState createState() => _CartState( this._cart);
}


class _CartState extends State<Cart> {
  /*int _selectDrawerItem = 0;
  _getDrawerItemWidget( int pos) {
    switch ( pos){
      case 0: 
      return 
    }
  }*/

  _CartState(this._cart);
 final _scrollcontroller = ScrollController(); //SE DECLARA ESTO COMO VA A MANEJAR UNA LSITA Y RESULTADO Y PAGO//
 var _firstScroll = true;
 bool _enabled = false;

 final List<Producto>_cart; //DARA ENTRADA A NAVEGAR DENTRO ///
 

Container pagoTotal(List<Producto>_cart){
  return Container( //VA A MANDAR A RETORNAR UN WIDGET ENTRE CONTAINER//
    alignment: Alignment.centerRight,
    padding: EdgeInsets.only(left: 120),
    height: 70,
    width:  400,
    color: Colors.grey[200],
    child: Row(
      children: <Widget>[ //EN LA PALABRA TOTAL DE ADICIONAMOS LA FUNCION DE //
        Text("TOTAL A PAGAR: \$${valorTotal(_cart)}", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),)

      ],
    ),
  );
}
  ///VAMOS A CREAR UNA FUNCION DE TIPO STRING DE CUAL PARTIRA Y RECORRERA PARA DAR EL VALOR TOTAL//
  String valorTotal(List<Producto> listaProductos){
    double total= 0.0;
      for ( int i = 0; i<listaProductos.length; i++){
          total = total + listaProductos[i].price * listaProductos[i].quiantity;  //EL CICLO FOR DARA EL PRECIO POR LA CANTIDAD//
      }
      return total.toStringAsFixed(2);  ///ESTO RETORNARA EL TOTAL//EN CUANTO DEMOS CLICK EL NUMERO 2 VA IR INCREMENTANDO//
  }

  @override
  Widget build(BuildContext context) { //AQUI DENTRO DEL SCAFFOLD VIENE LA PARTE DEL DISEÑO DE LA PAGINA//
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton( 
            icon: Icon(Icons.shopping_basket_sharp), //ICONO DE LA PARTE SUPERIOR DERECHA ARRIBA DENTRO DE DETALLES COMPRAS//
            onPressed: null,
            color: Colors.white,

          )
        ],
        title: Text('DETALLE Y COMPRA DEL PRODUCTO', style: new TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14.0, 
          color: Colors.white)
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.keyboard_arrow_left_sharp), //BOTON DE REGRESO A PANTALLA PRINCIPAL//
            onPressed: (){
              Navigator.of(context).pop();
              setState(() {
                _cart.length;
              });
            },
            color: Colors.white,
          ),
      ),
      body: GestureDetector(
        onVerticalDragUpdate: (details){
          if(_enabled && _firstScroll){
            _scrollcontroller.jumpTo(_scrollcontroller.position.pixels - details.delta.dy);
          }
        },
         onVerticalDragEnd: (_){ //ESTO HARA QUE DE SOLUCINES O POSIBLES SOLUCIONES//
            if(_enabled) _firstScroll = false;
         },
         child: SingleChildScrollView(
           child: Column(
             children: <Widget>[
               ListView.builder(
                 scrollDirection: Axis.vertical, //LE ESTA DICIENDO QUE PUEDE SER HORIZONTAL O VERTICAL//
                 shrinkWrap: true, //VA DE LA MANO CON "physics" SI NO SE PONE UNO ESTARA MAL//
                 physics: NeverScrollableScrollPhysics(),
                 itemCount: _cart.length,
                 itemBuilder: (context, index){//LE VAMOS A DAR EL TEXTO Y EL INDICE///
                    final String imagen = _cart[index].image;
                    var item = _cart[index];
                     return  Column(
                      children: <Widget>[
                        Padding(padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                        child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Expanded( child: Container(
                                    width: 100,
                                    height: 100,
                                    child: new Image.asset("assets/image/$imagen",
                                    fit: BoxFit.contain),
                                  )),
                                  ///AQUI SE CREAR EL QUE HARA LOS DETALLES, LOS PEDIDOS ETC///
                                  Column(
                                    children: <Widget>[
                                      Text(item.name,
                                      style: new TextStyle(
                                         fontWeight: FontWeight.bold,
                                         fontSize: 16,
                                         color: Colors.black),),
                                           Row(
                                             mainAxisAlignment: MainAxisAlignment.center,
                                             children: <Widget>[
                                               Container(
                                                 width:120, //AQUI SE PERSONALIZA EL ANCHO Y LARGO DEL BOTON//
                                                 height: 80,
                                                 decoration: BoxDecoration(
                                                   color: Colors.red[600],
                                                     boxShadow: [
                                                        BoxShadow(
                                                       blurRadius: 6.0,
                                                       color: Colors.blue[400],
                                                       offset: Offset(0.0, 1.0),
                                                     )
                                                     ],

                                                     borderRadius: BorderRadius.all(
                                                       Radius.circular(50.0),
                                                     ), ),
                                                  margin: EdgeInsets.only(top: 20.0),
                                                  padding: EdgeInsets.all(2.0),
                                                  child: new Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: <Widget>[
                                                      SizedBox(height: 8.0,),
                                                        IconButton(icon: Icon(Icons.remove),///AQUI SE PONE EL ICONO Y LA FUNCUIN QUE DARA AL PRESIONAR EL BORRAR DENTRO DE BOTON//
                                                         onPressed:(){
                                                            _eliminarProducto(index); //HACEMOS EL LLAMADO A LA FUNCINO PARA CUANDO SE DE CLICK EN ELMINAR  CANTIDADES VAYA ELIMINANDO LOS NUMEROS DEL EL CONTADOR//
                                                              Navigator.of(context).pop();
                                                              setState(() {
                                                                 valorTotal (_cart); //AL PRECIONAR, NOS DARA EL VAOR TOTAL///
                                                              });
                                                        },
                                                        color: Colors.white,
                                                        ),
                                                        Text('${_cart[index].quiantity}', //AQUI ESTAMOS MANDANDO A LLAMAR LA CANTIDAD DEL PRODUCTO COMO TAL//PASAMOS LA VARIABLE INDICE "cart"///
                                                        style: new TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 22.0,
                                                          color: Colors.white,
                                                        )),
                                                        ////////////CREAMOS EL SEGUNDO BOTON//
                                                         IconButton(icon: Icon(Icons.add),///AQUI SE PONE EL ICONO Y LA FUNCUIN QUE DARA AL PRESIONAR EL BORRAR DENTRO DE BOTON//
                                                         onPressed:(){
                                                           _addProducto(index); //HACEMOS EL LLAMDAO A LA FUNCION PARA CUANDO SE DE CLICK EN AUMENTAR CANTIDADES VAYA INCREMENTANDO EL CONTADOR//
                                                              Navigator.of(context).pop();
                                                              setState(() {
                                                                 valorTotal (_cart); //AL PRECIONAR, NOS DARA EL VAOR TOTAL///
                                                              });
                                                        },
                                                        color: Colors.yellow, //COLOR DE //
                                                        ),
                                                        SizedBox(height: 8.0 ,) 
                                                    ],
                                                  ),
                                               )
                                             ],
                                           )
                                    ],
                                  ),
                                  SizedBox(width: 38.0), 
                                  Text(item.price.toString(),
                                  style: new TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize:24.0,
                                    color: Colors.black
                                  ),)     
                                ]
                              )//ROW// 
                            ]
                         )//COLUMN//
                        ),
                        ///ESTO HARA QUE AL ESCOGER EL PRDUCTO TENGA ESPACIO Y NO SE VEA AMONTONADO EN LA SEECCION DE DETALLES//
                        Divider( color:Colors.teal)
                      ], //WIDGET//
                     );
                     
                 }, 
               ),


               ///AQUI MANDAMOS A LLAMR A PAGO TOTAL DEL CUAL FUE CREADO EN LA PARTE DE ARRIBA EN LA QUE SUNMA Y MULTIPLICA TODOS LOS PRODUCTOS//
               SizedBox(width: 10.0), 
               pagoTotal(_cart),
               SizedBox(
                 width: 30.0,
               ),
               //CREAMOS UN BOTON DONDE IRA EL "fancy_dialog" DEL CUAL IRA EL ANIMATOR DIALOG//
               Container( 
               height:100, 
               width:200, 
               padding: EdgeInsets.only(top: 50,),
               child: RaisedButton( 
                 textColor: Colors.white,
                 color: Colors.green,
                 child: Text("PAGAR"), onPressed: (){
                 showDialog(
                   context: context, 
                   barrierDismissible: false,
                   builder: (context) => AlertDialog(
                     title: Text("PAGAR PRODUCTO"),
                     content: Text("!! LISTO PARA PAGAR!!"),
                     actions: <Widget>[
                       FlatButton(
                         child: Text('Acepto'),
                         onPressed: (){
                           Navigator.of(context).pop('ok');
                         },
                       ),
                     ],
                   )
                   ).then((result){
                     print(result);
                   });
               },
               //AQUI SE LE DA PERSONALIZACION AL BOTON DE PAGAR//
               shape: new RoundedRectangleBorder(
                 borderRadius: new BorderRadius.circular(30.0),
               ),
               )
               ),
             ],
           ),
         
         )),
        
    );
  }
  ///VAMOS A CREAR EL REMOVER EL PRECIO ADEMAS DE DARLE TOTAL//PARA ESO CREAMOS EL PRIVADO PARA MANDARLO A CREAR//
  ///PRIMERO CREAMOS EL QUE HARA POSIBLE QUE EN CUANTO DEMOS CLICK EN EL DE SUMAR AUMENTARA LAS CANTIDADES DE PRODUCTOS///
  _addProducto(int index){
    setState(() {
      _cart[index].quiantity++; //SIMBOLO DE MAS//
    });
  }
  ///POR SEGUNDA VEZ  CREAMOS EL QUE HARA POSIBLE QUE EN CUANTO DEMOS CLICK EN EL, RESTARA  LAS CANTIDADES DE PRODUCTOS QUE SE ESCOGIERON///
   _eliminarProducto(int index){
    setState(() {
      _cart[index].quiantity--; //SIMBOLOS DE MENOS//
    });
  }
}

////#IMPORTACION PARA QUE FUNCIONARA EL BOTON DE ANIMACION#///