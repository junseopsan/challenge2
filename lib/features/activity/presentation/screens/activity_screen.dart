import 'package:flutter/material.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('활동'),
      ),
      body: ListView.builder(
        itemCount: 20, // 더미 데이터
        itemBuilder: (context, index) {
          return ListTile(
            leading: const CircleAvatar(
              backgroundImage: NetworkImage('https://i.pravatar.cc/150'),
            ),
            title: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: const [
                  TextSpan(
                    text: '사용자',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: '님이 회원님의 게시물을 좋아합니다.'),
                ],
              ),
            ),
            trailing: const Text('1시간 전'),
          );
        },
      ),
    );
  }
} 