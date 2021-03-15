import 'package:Conalep360/ConAlert/Contacto.dart';
import 'package:Conalep360/ConAlert/DatabaseConalert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contact/contact.dart';
import 'package:flutter_contact/contacts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';

List<Contacto> phones; //Lista de numeros ya agregados

class AddContactScreen extends StatefulWidget {

  //------------------------------------
  //Constructor que pasa datos por parametros
  //----------------------------------
  AddContactScreen(List<Contacto> data){
    phones = data;
  }

  @override
  AddContactState createState() => AddContactState();
}

class AddContactState extends State<AddContactScreen> {
  List<Contact> listContacts;//Lista de contactos cargados desde el dispositivo
  var _db = DatabaseConalert();
  FToast toast;

  @override
  void initState() {
    listContacts = new List();
    readContacts();
    toast = FToast();

    toast.init(context);
  }

  Future guardarContacto(String name, String phone) async {
    
    
    if(phones.length == 10){
      toast.showToast(child: customToast("No se pueden agregar mas contactos."),
        gravity: ToastGravity.BOTTOM,
        toastDuration: Duration(seconds: 2),);
    }else if(!contactoAgregado(phone)){
      await _db.saveContactos(Contacto(name: name, phone: phone));
      Navigator.of(context).pop();
    }

  }
  Widget customToast(String data){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.blueAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 12.0,
          ),
          Text("${data}",style: TextStyle(color: Colors.white, fontSize: 16),),
        ],
      ),
    );
  }
  
  
  //--------------------
  // Se encarga de revisar si el contacto ya ha sido agregado
  //------------------
  bool contactoAgregado(String phone){
    for(Contacto contac in phones){
      if(contac.phone.compareTo(phone) == 0){
        return true;
      }
    }
    return false;
  }

  //-----------------------------
  //cuando el state del objeto es removido
  //----------------------------
  @override
  void dispose() {
    super.dispose();
    
    _db.close();
  }


  @override
  Widget build(BuildContext context) {
    _db.initDB(); //Inicializa la base de datos con el nombre de la tabla

    return Scaffold(
      backgroundColor:
          (listContacts.length > 0) ? Colors.green[900] : Colors.white,
      body: (listContacts.length > 0)
          ? Column(
              children: <Widget>[
                SizedBox(
                  height: 25,
                  child: Container(
                    color: Colors.green[900],
                  ),
                ),
                Expanded(
                  child: Container(
                    // color: Colors.white,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      // borderRadius: BorderRadius.vertical(top: Radius.circular(30),bottom: Radius.circular(0)),
                    ),

                    child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: listContacts.length,
                        itemBuilder: (context, index) {
                          Contact contact = listContacts.elementAt(index);
                          return InkWell(
                            onTap: (){
                              guardarContacto(contact.displayName, contact.phones.get(0).value);
                            },
                            child: Card(
                              elevation: 0,
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.green,
                                  child: Center(
                                      child: Text(
                                    "${contact.displayName.characters.characterAt(0)}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25.0,
                                        color: Colors.white),
                                  )),
                                ),
                                title: Text("${contact.displayName}"),

                                subtitle:
                                    Text("${contact.phones.get(0).value}"),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              ],
            )
          : Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.green[900],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      "Reading Contacts...",
                      style: TextStyle(fontSize: 14.0, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  //Check contacts permission
  Future<PermissionStatus> _getPermission() async {
    final PermissionStatus permission = await Permission.contacts.status;
    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.denied) {
      final Map<Permission, PermissionStatus> permissionStatus =
          await [Permission.contacts].request();
      return permissionStatus[Permission.contacts] ??
          PermissionStatus.undetermined;
    } else {
      return permission;
    }
  }

  readContacts() async {
    final PermissionStatus permissionStatus = await _getPermission();
    if (permissionStatus == PermissionStatus.granted) {
      Contacts.streamContacts().forEach((contact) {
        setState(() {
          listContacts.add(contact);
        });
      });
    }
  }
}
