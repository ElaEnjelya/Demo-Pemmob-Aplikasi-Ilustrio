import 'package:commission_art_app2/home/home_controller/home_controller.dart';
import 'package:commission_art_app2/route/route_name.dart';
import 'package:flutter/material.dart';
import 'package:commission_art_app2/widgets/categoriesWidget.dart';
import 'package:commission_art_app2/widgets/homeAppBar.dart';
import 'package:commission_art_app2/pages/profile_Page.dart';
import 'package:commission_art_app2/home/widgets/recomendation_card.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    HomeContent(),
    ProfileContent(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFFDF826C),
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        selectedLabelStyle:
            TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontSize: 12),
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeController _homeController = Get.put(HomeController());

    return Scaffold(
      body: Obx(() {
        if (_homeController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView(
            children: [
              HomeAppBar(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16),
                    Container(
                      height: 200,
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: AssetImage('assets/banner.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
                    Text(
                      'Category',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFDF826C),
                      ),
                    ),
                    SizedBox(height: 8),
                    categoriesWidget(),
                    SizedBox(height: 16),
                    Text(
                      'Recommendation',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFDF826C),
                      ),
                    ),
                    SizedBox(
                      height: 300,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            _homeController.recommendationProductList.length,
                        itemBuilder: (context, index) {
                          final data =
                              _homeController.recommendationProductList[index];
                          return InkWell(
                            onTap: () {
                              Get.toNamed(RouteName.detailScreen, arguments: {
                                'product_id': data.productId,
                              });
                            },
                            child: RecommendationCard(
                              artTitle: data.artTitle,
                              imagePath: data.imagePath,
                              imagePathProfile: data.imagePathProfile,
                              price: data.price,
                              category: data.category,
                              rating: data.rating,
                              artist: data.artist,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        }
      }),
    );
  }
}

class ProfileContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProfilePage(); //Menampilkan halaman profil
  }
}
