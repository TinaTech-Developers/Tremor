import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'drawer.dart';
// import 'package:tremor_admin/fulldisplay.dart';

class Sales extends StatefulWidget {
  Sales({Key? key}) : super(key: key);

  @override
  State<Sales> createState() => _SalesState();
}

class _SalesState extends State<Sales> {
  final databaseRef = FirebaseDatabase.instance.reference().child("sales");

  // deletedata(id) async {
  //   await FirebaseDatabase.instance.reference().child("sales").doc(id).delete();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Customer-Orders")),
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
                                "Specs",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(snapshot.value["info"]),
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
                                  // CupertinoAlertDialog(
                                  //   content: Text("Successfully Deleted"),
                                  // );
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
