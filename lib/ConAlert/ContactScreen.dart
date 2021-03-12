import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contact/contacts.dart';
import 'AddContactScreen.dart';
import 'Contacto.dart';
import 'DatabaseConalert.dart';

class ContactScreen extends StatefulWidget {
  @override
  ContactState createState() => ContactState();
}

class ContactState extends State<ContactScreen> {
  List<Contacto> listContacts;
  var _db = DatabaseConalert();

  @override
  void initState() {
    listContacts = new List();
  }

  // @override
  // void dispose() {
  //   _db.close();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[900],
      body: Column(
        children: <Widget>[
          SizedBox(height: 45),
          Text(
            "CONTACTOS",
            style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
            softWrap: false,
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30), bottom: Radius.circular(0)),
                ),
                child: FutureBuilder(
                  future: _db.initDB(),
                  builder: (BuildContext context, AsyncSnapshot data) {
                    if (data.connectionState == ConnectionState.done) {
                      return FutureBuilder(
                        future: _db.getContactos(),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<Contacto>> snapshot) {
                          print ("si");
                          if (snapshot.hasData) {
                            return ListView.builder(
                                itemCount: snapshot.data.length,
                                itemBuilder: (BuildContext context, int index) {

                                  listContacts.add(snapshot.data.get(index));
                                  return Card(
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        backgroundColor: Colors.green,
                                        child: Center(
                                            child: Text(
                                                "${listContacts.get(index).name.characters.characterAt(0)}")),
                                      ),
                                      title: InkWell(
                                        child: Text(
                                            "${listContacts.get(index).name}"),
                                      ),
                                      subtitle:
                                          Text("${listContacts.get(index).phone}"),
                                    ),
                                  );
                                });
                          } else
                            return Container(child: Text("Sin Datos"));
                        },
                      );
                    } else
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                  },
                )

                ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Route route = MaterialPageRoute(builder: (context) => AddContactScreen(listContacts));
          Navigator.pushReplacement(context,route);

          //
          // Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddContactScreen(listContacts)));
          // Navigator.of(context).pop();
        },
        backgroundColor: Colors.blue[700],
        child: Icon(Icons.add),
      ),
      // floatingActionButton: ,
    );
  }

}
