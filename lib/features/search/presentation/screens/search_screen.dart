import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SearchBar(
          hintText: '검색',
          leading: Icon(Icons.search),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
        ),
        itemCount: 30, // 더미 데이터
        itemBuilder: (context, index) {
          return Image.network(
            'https://picsum.photos/200?random=$index',
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
} 