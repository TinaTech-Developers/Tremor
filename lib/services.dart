import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import 'drawer.dart';
// import 'package:tremor_admin/fulldisplay.dart';

class Services extends StatefulWidget {
  Services({Key? key}) : super(key: key);

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  final databaseRef = FirebaseDatabase.instance.reference().child("services");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Customer-Bookings")),
      ),
      body: SafeArea(
        child: FirebaseAnimatedList(
            query: databaseRef.orderByChild("date"),
            itemBuilder: (BuildContext context, DataSnapshot snapshot,
                Animation<double> animation, int index) {
              var x = snapshot.value['name'];
              print(x);
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                "Email",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(snapshot.value["email"]),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                "Company",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(snapshot.value["Company Name"]),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Expanded(
                              flex: 1,
                              child: Text(
                                "Name",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(snapshot.value["name"]),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                "Serial No.",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(snapshot.value["serialnumber"]),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                "Cell",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(snapshot.value["phonenumber"]),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                "Description",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: Card(
                                    child: Text(snapshot.value["description"])),
                              ),
                            ),
                            Container(
                              child: IconButton(
                                color: Colors.red,
                                onPressed: () {
                                  var key = snapshot.key;
                                  print("Delete ID: " + key.toString());
                                  _deleteRecord(key);
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            content:
                                                Text("Successfully Deleted"),
                                            actions: [
                                              TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(context),
                                                  child: Text("CANCEL")),
                                              TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(context),
                                                  child: Text("OK")),
                                            ],
                                          ));
                                },
                                icon: Icon(Icons.delete),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
      drawer: MyDrawer(),
    );
  }

  _deleteRecord(var key) async {
    await databaseRef.child(key).remove();
  }
}
