import 'package:flutter/material.dart';

class DeveloperProfilePage1 extends StatelessWidget {
  final String name1;
  final String npm1;
  final String programStudi1;

  const DeveloperProfilePage1({
    Key? key,
    required this.name1,
    required this.npm1,
    required this.programStudi1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Developer Profile'),
      ),
      body: Container( //Container dalam dengan margin dan padding
        decoration: BoxDecoration(
          color: Colors.blueGrey, // Background color of the app
        ),
        child: Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white, // warna latar belakang
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(138, 218, 178, 1),
                blurRadius: 15,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 160,
                  height: 160,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.8),
                    ),
                  ),
                  child: Center(
                    child: CircleAvatar(
                      radius: 80,
                      backgroundImage: AssetImage('assets/pengembang_1.jpg'),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ListTile(
                title: Text(
                  'Name',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                leading: Icon(
                  Icons.person,
                  color: Color.fromRGBO(223, 130, 108, 1),
                ),
                subtitle: Text(name1),
                tileColor: Colors.grey.shade200,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(height: 10),
              ListTile(
                title: Text(
                  'NPM',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                leading: Icon(
                  Icons.lock,
                  color: Color.fromRGBO(223, 130, 108, 1),
                ),
                subtitle: Text(npm1),
                tileColor: Colors.grey.shade200,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(height: 10),
              ListTile(
                title: Text(
                  'Program Studi',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                leading: Icon(
                  Icons.house,
                  color: Color.fromRGBO(223, 130, 108, 1),
                ),
                subtitle: Text(programStudi1),
                tileColor: Colors.grey.shade200,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DeveloperProfilePage2 extends StatelessWidget {
  final String name2;
  final String npm2;
  final String programStudi2;

  const DeveloperProfilePage2({
    Key? key,
    required this.name2,
    required this.npm2,
    required this.programStudi2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Developer Profile'),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey, // Background color of the app
        ),
        child: Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(138, 218, 178, 1),
                blurRadius: 15,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 160,
                  height: 160,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.5),
                      width: 3,
                    ),
                  ),
                  child: Center(
                    child: CircleAvatar(
                      radius: 80,
                      backgroundImage: AssetImage('assets/pengembang_2.jpg'),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ListTile(
                title: Text(
                  'Name',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                leading: Icon(
                  Icons.person,
                  color: Color.fromRGBO(223, 130, 108, 1),
                ),
                subtitle: Text(name2),
                tileColor: Colors.grey.shade200,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(height: 10),
              ListTile(
                title: Text(
                  'NPM',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                leading: Icon(
                  Icons.lock,
                  color: Color.fromRGBO(223, 130, 108, 1),
                ),
                subtitle: Text(npm2),
                tileColor: Colors.grey.shade200,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(height: 10),
              ListTile(
                title: Text(
                  'Program Studi',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                leading: Icon(
                  Icons.house,
                  color: Color.fromRGBO(223, 130, 108, 1),
                ),
                subtitle: Text(programStudi2),
                tileColor: Colors.grey.shade200,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
