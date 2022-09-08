import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tremor_admin/pages/login.dart';

import '../drawer.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(
          child: Text("Tremor-Technologies",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'PermanentMarker',
              )),
        ),
      ),
      // body: StreamBuilder<User?>(
      //   stream: FirebaseAuth.instance.authStateChanges(),
      //   builder: (context, snapshot) {
      //     if (snapshot.hasData) {
      body: Container(
        //margin: EdgeInsets.only(top: 150, bottom: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            const SizedBox(
              height: 16,
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: SizedBox(
                      width: 200,
                      child: RaisedButton(
                          shape: StadiumBorder(),
                          color: Colors.blue,
                          onPressed: () {
                            Navigator.pushNamed(context, 'sales');
                          },
                          child: Text("Sales")),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: SizedBox(
                      width: 200,
                      child: RaisedButton(
                          shape: StadiumBorder(),
                          onPressed: () {
                            Navigator.pushNamed(context, 'services');
                          },
                          child: Text("Services")),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  MaterialButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                    },
                    color: Colors.redAccent,
                    child: Text("SIgn out"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: MyDrawer(),
    );
    //   } else {
    //     return Login();
    //   }
    // },
  }
}
