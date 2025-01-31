import 'package:deskapp/util/createHeader.dart';
import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: <Widget>[
          logo(),
          CreateHeader(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                createDrawerItem(
                  icon: Icons.home,
                  text: 'Home',
                  isSelected: true,
                  onTap: () {},
                ),
                createDrawerItem(
                  icon: Icons.people_alt_outlined,
                  text: 'Employees',
                  onTap: () {},
                ),
                createDrawerItem(
                  icon: Icons.calendar_month_outlined,
                  text: 'Attendance',
                  onTap: () {},
                ),
                createDrawerItem(
                  icon: Icons.pie_chart_outline,
                  text: 'Summary',
                  onTap: () {},
                ),
                createDrawerItem(
                  icon: Icons.info_outline,
                  text: 'Information',
                  onTap: () {},
                ),
                ExpansionTile(
                  leading: Icon(Icons.workspaces_filled, color: Colors.black87),
                  title: Text(
                    'WORKSPACES',
                    style: TextStyle(fontSize: 14.0, color: Colors.black87),
                  ),
                  childrenPadding: EdgeInsets.only(left: 16.0),
                  children: <Widget>[
                    createSubDrawerItem(
                      text: 'Adstacks',
                      onTap: () {},
                    ),
                    createSubDrawerItem(
                      text: 'Finance',
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(color: Colors.black26),
          createDrawerItem(
            icon: Icons.settings,
            text: 'Setting',
            onTap: () {},
          ),
          createDrawerItem(
            icon: Icons.exit_to_app,
            text: 'Logout',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget logo() {
    return DrawerHeader(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Center(
        child: Image.asset(
          'images/adstack.png',
          fit: BoxFit.contain,
          width: 120,
          height: 120,
        ),
      ),
    );
  }

  Widget userProfile() {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey[300],
        child: Icon(Icons.person, color: Colors.white70),
      ),
      title: Text(
        'Pooja Mishra',
        style: TextStyle(color: Colors.black87, fontSize: 16.0),
      ),
      subtitle: Text(
        'Admin',
        style: TextStyle(color: Colors.black54, fontSize: 14.0),
      ),
    );
  }

  Widget createDrawerItem({
    required IconData icon,
    required String text,
    required GestureTapCallback onTap,
    bool isSelected = false,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: isSelected ? Colors.blueAccent : Colors.black54,
      ),
      title: Text(
        text,
        style: TextStyle(
          fontSize: 16.0,
          color: isSelected ? Colors.blueAccent : Colors.black87,
        ),
      ),
      tileColor: isSelected ? Colors.blue.withOpacity(0.1) : Colors.transparent,
      onTap: onTap,
    );
  }

  Widget createSubDrawerItem({
    required String text,
    required GestureTapCallback onTap,
  }) {
    return ListTile(
      title: Text(
        text,
        style: TextStyle(fontSize: 14.0, color: Colors.black54),
      ),
      onTap: onTap,
    );
  }
}
