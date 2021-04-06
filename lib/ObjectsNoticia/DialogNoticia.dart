import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Noticia.dart';

class DialogNoticia extends StatefulWidget {
  Noticia noticia;

  DialogNoticia(this.noticia);

  @override
  DialogState createState() => DialogState(noticia);
}

class DialogState extends State<DialogNoticia> {
  Noticia noti;

  DialogState(this.noti);

  //Para no realizar mas de 1 consulta y ahorrar tiempo de ejecucion
  double width;
  double heigth;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);

    //Obtenemos datos del tamaño de la pantalla
    width = MediaQuery.of(context).size.width;
    heigth = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Container(
              child: Image.network(
                noti.url,
                fit: BoxFit.fitHeight,
              ),
              width: width * 0.35,
              height: heigth,
            ),
            Column(
              children: <Widget>[
                Container(
                  // color: Colors.red,
                  height: 50,
                  width: width * 0.65,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/banner.png'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text(
                    '${noti.titulo}',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  width: width * 0.6,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Text(
                        '${noti.noticia}',
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  // alignment: Alignment.centerLeft,
                  width: width * 0.6,
                  height: heigth * 0.7,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void deactivate() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }
}
