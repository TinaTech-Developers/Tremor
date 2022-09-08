import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  // MyDrawer({Key? key}) : super(key: key);
  final user = FirebaseAuth.instance.currentUser!;

  String get accountName => user.email!;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(user.email!),
              accountEmail: const Text(""),
              currentAccountPicture: CircleAvatar(
                  radius: 50,
                  child: Image(
                    image: AssetImage('assets/tremo.png'),
                  )

                  // Image.asset('assets/tremor.png'),
                  ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("TremorTech"),
              subtitle: const Text("Admin"),
              // trailing: const Icon(Icons.edit),
              // onTap: () {},
            ),
            // ListTile(
            //   leading: Icon(Icons.no_accounts),
            //   title: Text("Create Account"),
            //   subtitle: Column(children: <Widget>[
            //     IconButton(
            //         onPressed: () {
            //           Navigator.pushNamed(context, 'register');
            //         },
            //         icon: Icon(Icons.add))
            //   ]),

            //   // subtitle: Text()),
            //   // trailing: Icon(Icons.edit),
            // ),
          ],
        ),
      ),
    );
  }
}
