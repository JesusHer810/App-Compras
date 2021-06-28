import 'package:flutter/material.dart';
import 'package:converse_flutter/widgets/zapato_page.dart';
import 'package:converse_flutter/widgets/zapato_desc.dart';

class Pagina extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white, //COLOR DE FONDO DEL CONVERSE_HOME//
        //body: CustomAppBar(texto 'for you'),//
        body: Column(
          children: <Widget>[
            // CustomAppBar( texto : 'for you' ),
            SizedBox(height: 10),
            ZapatoPreview(),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),

                child: Column(
                  children: <Widget>[
                    Descripcion(
                      titulo: "MODELO 2021",
                      descripcion:
                          "!!CONVERSE !! !!PRODUCTO NUEVO!! Este Año Un Nuevo Modelo De Calzado Se Aproxima Y Puede Ser Tuyo, Converse Maneja De La Mas Alta Calidad De Calzado, Utiliza Este Nuevo Modelo 2021 Comodo, Eficaz Y A La Moda !! QUE ESPERAS !!!!",
                    ),
                    Descripcion(
                      titulo: " PRODUCTO",
                      descripcion:
                          "Producto 100% Mexicano Elaborado Con Las Mejores Herramientas De Calzado, Utilizando Los mejores Procesoso Para Otorgarle Austed Una Seguridad En Su Ser Con Este Nuevo Modelo",
                    ),
                    Descripcion(
                      titulo: " PRODUCTO",
                      descripcion:
                          "INICIA ESTE MES DE DESCUENTOS, ASI COMO EL PODER RECONOCER UN BUEN CALZADO CUANDO LO VEAS,!!",
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

/*class Pagina extends StatefulWidget { //OTRA PAGINA//

  @override
  _PaginaState createState() => _PaginaState();
}

class _PaginaState extends State<Pagina> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('otra pagina', style: TextStyle(fontSize: 15.0)
        ),
      ),
    );
  }
}*/
