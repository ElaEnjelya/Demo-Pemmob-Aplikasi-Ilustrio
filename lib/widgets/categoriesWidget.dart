import 'package:commission_art_app2/screens/categoryDigitalArt.dart';
import 'package:commission_art_app2/screens/categoryPainting.dart';
import 'package:commission_art_app2/screens/categoryIllustration.dart';
import 'package:commission_art_app2/screens/categorySketch.dart';
import 'package:flutter/material.dart';

class categoriesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildCategoryCard(context,'Digital Art', 'assets/digital_art.png', CategoryDigitalArt()),
            _buildCategoryCard(context,'Painting', 'assets/painting.jpg',CategoryPainting()),
            _buildCategoryCard(context,'Illustration', 'assets/illustration.png', CategoryIllustration()),
            _buildCategoryCard(context,'Sketch', 'assets/sketch.png', CategorySketch()),
          ],
        ));
  }
}

Widget _buildCategoryCard(BuildContext context, String title, String imagePath, [Widget? page]) {
    return InkWell(
      onTap: () {
        // Navigasi ke halaman yang sesuai saat item diklik
        if (page != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Fitur $title belum diimplementasikan')),
          );
        }
      },
  
  child: Container( 
    width: 80,
    margin: EdgeInsets.only(right: 10),
    child: Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            imagePath,
            width: 70,
            height: 70,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 4),
        Text(
          title,
          style: TextStyle(fontSize: 12),
          textAlign: TextAlign.center,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
  )
  );
}
