import 'package:flutter/material.dart';
import 'package:commission_art_app2/screens/detail_pengembang.dart';
import 'package:commission_art_app2/pages/login.dart';
import 'package:commission_art_app2/screens/edit_profile.dart';
import 'package:commission_art_app2/screens/info.dart';
import 'package:commission_art_app2/screens/myAccount.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  void _navigateToEditProfile(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditProfilePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 150,
                height: 150,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(
                          'assets/profile.jpg'), // Corrected image setup
                    ),
                    Positioned(
                      right: -8,
                      bottom: 0,
                      child: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          color: Colors
                              .white, // Background color to make the button stand out
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white),
                        ),
                        child: IconButton(
                          icon: Icon(Icons.edit), // Correct asset path
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditProfilePage()),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40.0),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    _navigateToEditProfile(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(138, 218, 178, 1),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                  ),
                  child: const Text('Edit Profile'),
                ),
              ),
              const SizedBox(height: 20.0),
              ListTile(
                title: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.grey.shade200,
                        ),
                        child: const Icon(Icons.person),
                      ),
                      const SizedBox(width: 16),
                      const Expanded(
                        child: Text('My Account'),
                      ),
                      const Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            MyAccountPage()), // Ganti dengan halaman info yang sesuai
                  );
                },
              ),
              const SizedBox(height: 15.0),
              ListTile(
                title: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.grey.shade200,
                        ),
                        child: const Icon(Icons.info),
                      ),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: Text('Info'),
                      ),
                      const Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
                onTap: () {
                  // Navigasikan ke halaman informasi
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InfoPage()),
                  );
                },
              ),
              const SizedBox(height: 15.0),
              ListTile(
                title: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.grey.shade200,
                        ),
                        child: const Icon(Icons.logout),
                      ),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: Text('Log Out'),
                      ),
                      // const Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
                onTap: () async {
                  // Pop up konfirmasi Logout
                  bool? confirmLogout =
                      await _showLogoutConfirmationDialog(context);
                  if (confirmLogout == true) {
                    _performLogout(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<bool?> _showLogoutConfirmationDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 8, height: 8),
            Text('Konfirmasi Log Out'),
          ],
        ),
        content: Text('Apakah Anda yakin ingin keluar?'),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey.shade300,
              foregroundColor: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text(
              'Cancel',
              style: TextStyle(color: Colors.grey.shade900),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromRGBO(138, 218, 178, 1),
              foregroundColor: Colors.white,
              // shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(8.0),
              // ),
            ),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: Text('Confirm'),
          ),
        ],
      );
    },
  );
}

void _performLogout(BuildContext context) {
  // Navigasikan kembali ke halaman login
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (context) => LoginPage()),
  );
}
