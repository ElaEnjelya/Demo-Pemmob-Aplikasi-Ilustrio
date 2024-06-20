import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                radius: 200,
                backgroundColor: Colors.white,
                child: ClipOval(
                  child: Image.asset(
                    'assets/splash.jpeg',
                    width: 300,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: OutlinedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/signin');
                              },
                              style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(),
                                  foregroundColor:
                                      Color.fromRGBO(138, 218, 178, 1),
                                  side: BorderSide(
                                      color: Color.fromRGBO(138, 218, 178, 1)),
                                  padding:
                                      EdgeInsets.symmetric(vertical: 20.0)),
                              child: Text("Sign in"))),
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/signup');
                              },
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(),
                                  foregroundColor: Colors.white,
                                  backgroundColor:
                                      Color.fromRGBO(138, 218, 178, 1),
                                  side: BorderSide(
                                      color: Color.fromRGBO(138, 218, 178, 1)),
                                  padding:
                                      EdgeInsets.symmetric(vertical: 20.0)),
                              child: Text("Sign Up"))),
                    ],
                  ))
            ],
          ),
        ));
  }
}
