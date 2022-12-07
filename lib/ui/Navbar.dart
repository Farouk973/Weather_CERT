import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_irrigation/ui/LoginPage.dart';
import 'package:smart_irrigation/ui/barchatui.dart';
import 'package:smart_irrigation/ui/weatherstationpage.dart';

import '../main.dart';
import '../service/dsvsd.dart';
import '../service/lignchartmonth.dart';
import 'mapPage.dart';
import 'nextpage.dart';

class Navbar extends StatelessWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User = FirebaseAuth.instance.currentUser!;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Cert1'),
            accountEmail: Text(User.email!),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg'))),
          ),
          ListTile(
            leading: Icon(Icons.query_stats),
            title: Text('Stations'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Weatherapp3Widget()));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.query_stats),
            title: Text('stations locations'),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => mapPage())),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.download),
            title: Text('Data History'),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => new barchatui(
                          title: 'stats',
                        ))),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('About'),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => new page1())),
          ),
          Divider(),
          ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log Out'),
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new Login()));
              }),
        ],
      ),
    );
  }
}
