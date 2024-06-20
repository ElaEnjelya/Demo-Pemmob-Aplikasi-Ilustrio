import 'package:flutter/material.dart';

class MyAccountPage extends StatelessWidget {
  const MyAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Account'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 20),
              CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('assets/Profile.jpg'),
              ),
              const SizedBox(height: 20),
              itemProfile('Name', 'Kim Minji', Icons.person),
              const SizedBox(height: 10),
              itemProfile('Phone', '082563980764', Icons.phone),
              const SizedBox(height: 10),
              itemProfile('Email', 'kimminji@gmail.com', Icons.email),
              const SizedBox(height: 10),
              itemProfile('Password', '••••••••', Icons.password),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 5),
                color: Color.fromRGBO(138, 218, 178, 1),
                spreadRadius: 5,
                blurRadius: 15)
          ]),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        tileColor: Colors.white,
      ),
    );
  }
}
