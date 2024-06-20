import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          TextFormField(
            onTap: () {
              Navigator.pushNamed(context, "/searchscreen");
            },
            decoration: InputDecoration(
              hintText: 'Search',
              suffixIcon: const Icon(
                Icons.search,
                size: 24,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          )
        ],
      ),
    );
  }
}
