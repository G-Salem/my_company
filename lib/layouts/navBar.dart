
import 'package:flutter/material.dart';
import 'package:my_company/Screens/others/accountSettings.dart';
import 'package:my_company/Screens/others/configuration.dart';
import 'package:my_company/Screens/others/helpCenter.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Mohamed Salem Gabsi'),
              accountEmail: Text('gabsimedsalem@gmail.com'),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.asset(
                    'assets/salem.jpg',
                    fit: BoxFit.cover,
                    width: 90,
                    height: 90,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Color(0xff08022D),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Account settings'),
              onTap: () => 
              {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> AccountSetting()))
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Help Center'),
              onTap: () => {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> HelpCenter()))
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configuration'),
              onTap: ( ) => {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Configuration()))
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log out'),
              
              onTap: () => {
              },
            ),
          ],
        ),
      ),
    );
  }
}

getUserinfo(){

}
