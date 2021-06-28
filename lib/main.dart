





import 'package:flutter/material.dart';
import 'package:converse_flutter/models/producto_model.dart';//IMPORTACION DE LA LISTA PRODUCTOS//
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; //IMPORTACION DEL PAQUETE FontAwesomeIcons//
import 'package:converse_flutter/paginas/otra_pagina.dart'; ///IMPORTACION DE PAGINA//
import 'package:converse_flutter/paginas/pedido_lista.dart'; //IMPORTACION DE PEDIDO LISTA//"cart"//



void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal), //COLOR DE LA PALETA DE ARRIBA//
      home: MyHomePage(title: '  CONVERSE'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
///VAMOS A DISTANCIAR NUESTRA LISTA DE PRODUCTO MODELO//TODO ESTO LO VAMOS A METER DENTRO DE UN LISTADO//
List<Producto> _producto = List<Producto> (); //QUE LO MANDE A  DE PRODUCTO//

//CREAMOS OTRA LISTA PARA EL CARRITO DE COMPRAS//
List<Producto> _listaCarrito = List<Producto> (); //LISTA CARRO//

@override
  void initState() {// TODO: implement initState//MANDAR A LLAMAR NUESTRA BASE DE DATOS//
    super.initState();
    _ProductoDb();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),//AQUI SE CREO EL ICONO DEL CARRITO Y MANDAR A LLAMR A PRODUCOS COMO TAL//PEDIDOS//
      actions: <Widget>[ //CARRITO PARTE SUPERIOR DERECHA CONTADOR Y MOSTRADOR///
        Padding(padding: const EdgeInsets.only(right:16.0,), //MARGEN DERECHA Y PARTE SUPERIOR//
        child: GestureDetector(
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Icon(Icons.shopping_cart, size: 39,),
               ////SE CREA OTRA CONDICIONAL//
               if(_listaCarrito.length >0) //SI LA LISTA CARRITO ES MAYOR A CERO, ESQUE YA TENEMOS PRODUCTOS GUARDADOS O CARGADOS EN EL LISTADO//
               Padding(padding: const EdgeInsets.only(left: 2.0),
               child: CircleAvatar(
                 radius: 8.0,
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  child: Text( //VAMOS APINTARLE EL NUMERO CADA VEZ QUE SE SELECCIONE//
                    _listaCarrito.length.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10.0),

                  ),
               ),
               ),
            ],
          ),
          ////ESTE "onTap" CUANDO LO PRESIONESMO NOS TIENE QUE LLEVAR A LA PANTALLA TABLA POEDIDOS//
          onTap:(){
            if(_listaCarrito.isNotEmpty)
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Cart(_listaCarrito), //MANDA A LLAMAR EL "cart" DESDE pedido_lista //
              ),
            );
          },
        ),
        ), 
      ],
      ),
       backgroundColor: Colors.tealAccent, //COLOR DE FONDO DE LA PANTALLA PRINCIPAL//
      drawer: Container(//NOS PERMITIRA CREAR EL MENU DE LA PARTE IZQUIERDA//
       width: 180.0, //DARLE UN ANCHO A LA PALETA DEL DRAWER//
        child: Drawer( //MOS VA A DEVOLVER EL MISMO DRAWER//
          child: Container( //AQUI SE DARA DISEÑO AL DRAWER, DENTRO DE EL Y EN EL DESPLIEGUE ASI COMO LA BARRA Y EL MENÚ//
            width: MediaQuery.of(context).size.width *0.5, //EL VALOR DEL DRAWER AL DESPLEGARSE//
             color: Colors.black, ///EL COLOR DE FONDO DEL DRAWER AL DARLE CLICK//
             child: new ListView(
                padding: EdgeInsets.only(top: 50.0), //ESTE PADDIN SERA "only" PARA UNO DE SUS LADOS Y SU TAMAÑO//EN ESTE CASO LA PARTE SUPERIOR//
                  children: <Widget>[
                    Container(
                      height: 120,
                      child: new UserAccountsDrawerHeader( //AQUI VA ACONTENER UNA DESCRIPCION DENTRO DEL DRAWER PUEDE SER UNA IMAGEN UN CORREO//
                        accountName: new Text(''),
                        accountEmail: new Text(''),
                        decoration: new BoxDecoration(
                          image: new DecorationImage(image: AssetImage("assets/image/converse.png",), //LOGO DEL DRAWER//
                            fit: BoxFit.fill //ESTO HARA QUE EL LOGO DEL DRAWER SE EXPANDA//
                          ),
                          ),
                        ), 
                    ),
                    ///AQUI EMPIEZA EL DESARROLLO DEL DRAWER PRINCIPAL//
                  
                    new Divider(), ///HACEMOS UNA LINEA DE DIVISION//HOME//
                    new ListTile(
                        title: new Text('HOME',style: TextStyle(color: Colors.white),),
                        trailing: new Icon(Icons.home, size: 30.0, color: Colors.white,),
                        onTap: ()=> Navigator.of(context).push(new MaterialPageRoute( //MOSTRARA UN BOTON DEL CUAL NOS MANDARA A UNA PAGINA NUEVA//
                          builder:(BuildContext context) => Pagina())),   
                    ),

                    ///INICIA SEGUNDA PAGINA DEL DRAWER////PROMOCIONES//
                     new Divider(), ///HACEMOS UNA LINEA DE DIVISION//
                    new ListTile(
                        title: new Text('PROMOCION',style: TextStyle(color: Colors.white),),
                        trailing: new Icon(Icons.card_giftcard_outlined, size: 30.0, color: Colors.white,),
                        onTap: ()=> Navigator.of(context).push(new MaterialPageRoute( //MOSTRARA UN BOTON DEL CUAL NOS MANDARA A UNA PAGINA NUEVA//
                          builder:(BuildContext context) => Pagina())),   
                    ),

                    ///INICIA  TERCERA DEL DRAWER////SUCURSALRES//
                     new Divider(), ///HACEMOS UNA LINEA DE DIVISION//
                    new ListTile(
                        title: new Text('SUCURSALES',style: TextStyle(color: Colors.white),),
                        trailing: new Icon(Icons.place, size: 30.0, color: Colors.white,),
                        onTap: ()=> Navigator.of(context).push(new MaterialPageRoute( //MOSTRARA UN BOTON DEL CUAL NOS MANDARA A UNA PAGINA NUEVA//
                          builder:(BuildContext context) => Pagina())),   
                    ),

                    ///INICIA CUARTA DEL DRAWER////COMBOS//
                     new Divider(), ///HACEMOS UNA LINEA DE DIVISION//
                    new ListTile(
                        title: new Text('NUEVOS',style: TextStyle(color: Colors.white),),
                        trailing: new Icon(Icons.stacked_bar_chart, size: 30.0, color: Colors.white,),
                        onTap: ()=> Navigator.of(context).push(new MaterialPageRoute( //MOSTRARA UN BOTON DEL CUAL NOS MANDARA A UNA PAGINA NUEVA//
                          builder:(BuildContext context) => Pagina())),   
                    ),

                     ///INICIA QUINTA DEL DRAWER////CODIGO QR//
                     new Divider(), ///HACEMOS UNA LINEA DE DIVISION//
                    new ListTile(
                        title: new Text('CODIGO QR',style: TextStyle(color: Colors.white),),
                        trailing: new FaIcon(FontAwesomeIcons.qrcode, color: Colors.white, size: 30.0), //HACE USO DEL PAQUETE O LIBRERIA "FontAwesomeIcons"//DANDOLE COLOR Y TAMAÑO(size)//
                        onTap: ()=> Navigator.of(context).push(new MaterialPageRoute( //MOSTRARA UN BOTON DEL CUAL NOS MANDARA A UNA PAGINA NUEVA//
                          builder:(BuildContext context) => Pagina())),   
                    ),
                  ],
             ),
          ),
        ), 
      ), 
      body: _cuadroProducto(), //ESTO HARA QUE UNA VEZ QUE ENTREMOS NOS CARGUE NUESTRO PRODUCTO POR DEFECTO PRIMERO//DONDE NOS MOSTRARA TODO LO QUE NECESITEMOS CADA A UNO DE ELLOS EN ESPECIFICO//
    );
  }
  

  GridView _cuadroProducto (){
    return GridView.builder(
      padding: const EdgeInsets.all(4.0) ,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: _producto.length,
      itemBuilder: (context, index){
        final String imagen = _producto[index].image;
        var item = _producto[index];
        return Card(
          elevation: 4.0,
          child: Stack(
             fit: StackFit.loose, // //
             alignment: Alignment.center,
             children: <Widget>[
               Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                   Expanded(child: new Image.asset("assets/image/$imagen", fit: BoxFit.contain ),), ///MANDAR A LLAMAR LAS IMAGENES DENTROI DE BD//
                   Text(item.name, textAlign: TextAlign.center,
                   style: TextStyle(fontSize: 20.0),
                   ),
                   //AQUI VAMOS A INCLUIR EL PRECION Y EL ICONO DEL CARRITO//
                    SizedBox(
                        height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                        height: 25,
                        ),
                        //ESTE TIPO "toString" NOS LO PINTARA O MANDAR DE TIPO CARACTER//
                           Text(item.price.toString(), style: TextStyle( ///AQUI SE PRESENTA EL PRECIO Y COMO ESTA ENTERO LO PASAMOS A "toString"/  
                             fontWeight: FontWeight.bold,
                             fontSize: 23.0,
                             color: Colors.black,
                             ),), 
                              Padding(padding: const EdgeInsets.only(right: 8.0, bottom: 8.0
                              ),
                               child: Align(alignment: Alignment.bottomRight, //ALINEAR EL BOTON DEL CARRITO EN LA PANTALLA//
                               child: GestureDetector(child:(!_listaCarrito.contains(item)) ///SE VA MANDAR A LLAMAR "!_listaCarrito" EN LA CONDICION "if" //
                               ? Icon(Icons.add_shopping_cart_rounded,  ///SE PONE SU RESPECTIVO ICONO/AQUI ES PARA QUE SE ALMACENE CADA UNO DE LA LISTA_PEDIDOS//
                               color: Colors.green, //SI EL LISTADO ESTA VACIO SE PONE EN VERDE//
                               size: 38, 
                              ): ///VAMOS A DARLE UNA CONDICION ESOS "puntitos" SIGNIFICAN CONDICION//
                              Icon(Icons.add_shopping_cart_rounded,  ///SE PONE SU RESPECTIVO ICONO/AQUI ES PARA QUE SE ALMACENE CADA UNO DE LA LISTA_PEDIDOS//
                               color: Colors.red, ///SI YA TIENE ALGUN ARTICULO ESTA EN ROJO//
                               size: 38,
                               ), ///SE ABRE UNA CONDICION//
                              onTap:(){//CUANDO EL CARRITO ESTE LENNO SE CAMBIARA DE COLOR DICIENDO QUE ESTA LLENO//Y NOS DE LA POSIBILIDAD DE BOPRRAR EL LISTADO//
                                setState(() { //EL "setState HACE MANEJO DE LOS LISTADOS//
                                  if(!_listaCarrito.contains(item))
                                  _listaCarrito.add(item);
                                  else
                                  _listaCarrito.remove(item);
                                });
                              }, 
                               ),),),       
                      ],
                    )
                 ],
               )  
             ],
          ),);
      },
    );
  }

  ////COMO NO SE ESTA CONSUMIENDO UNA API VAMOS A EMULAR UNA BASE DE DATOS COMO TAL DE LA SIGUIENTE MANERA///
  
  void _ProductoDb(){
   var list = <Producto>[
    Producto(
       name: 'MODELO HOMBRE',
       image: 'converse1.jpg',
       price: 250.00,
    ),
    ///////////
    Producto(
       name: 'CALZADO INFANTIL',
       image: 'converse9.jpg',
       price: 300.00,
    ),
    ///////////
    Producto(
       name: 'MODELOS 2021',
       image: 'converse10.jpg',
       price: 400.00,
    ),
    
    ///////////
    Producto(
       name: 'CALZADO INFANTIL',
       image: 'converse11.jpg',
       price: 560.00,
      ),
      ///////
      Producto(
       name: 'GORRA COMODA',
       image: 'gorra.jpg',
       price: 550.00,
      ),
      //////
      Producto(
       name: 'GORRA COMODA',
       image: 'gorra.jpg',
       price: 600.00,
      ),
      Producto(
       name: 'NUEVOS MODELOS',
       image: 'converse6.png',
       price: 300.00,
      ),
      Producto(
       name: 'CALZADO 2021',
       image: 'converse7.jpg',
       price: 150.00,
      ),
       Producto(
       name: 'CALZADO JUVENIL',
       image: 'converse7.jpg',
       price: 500.00,
      ),
       Producto(
       name: 'CALZADO NUEVO ',
       image: 'converse7.jpg',
       price: 300.0,
      ),
      
      Producto(
       name: 'CONVERSE OSCUROS',
       image: 'converse9.jpg',
       price: 700.00,
      ),
      Producto(
       name: 'gorra',
       image: 'gorra.jpg',
       price: 300.00,
      ),
      Producto(
       name: 'gorra',
       image: 'gorra2.jpg',
       price: 200.00,
      ),
      Producto(
       name: 'gorra',
       image: 'gorra3.jpg',
       price: 250.00,
      ),
      Producto(
       name: 'ESTILOS 2021',
       image: 'gorra4.jpg',
       price: 300.00,
      ),
      Producto(
       name: 'GORRA ESTILO.N',
       image: 'playera.jpg',
       price: 150.00,
      ),
      Producto(
       name: 'gorra',
       image: 'playera2.jpg',
       price: 180.00,
      ),
      Producto(
       name: 'gorra',
       image: 'playera3.jpg',
       price: 200.00,
      ),
   ];

   ///MANDAMOS UN LLAMADO A "setState" Y EL DECIMOS QUE ///
   setState(() {
      _producto = list; //MANDA A LLAMAR EL PRODCUTO DE LA "list" DEL "var list"//
   });
  }
 
}