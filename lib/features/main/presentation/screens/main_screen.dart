import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:threads_clone/features/home/presentation/screens/home_screen.dart';
import 'package:threads_clone/features/search/presentation/screens/search_screen.dart';
import 'package:threads_clone/features/post/presentation/screens/post_create_screen.dart';
import 'package:threads_clone/features/activity/presentation/screens/activity_screen.dart';
import 'package:threads_clone/features/profile/presentation/screens/profile_screen.dart';
import 'package:threads_clone/shared/widgets/bottom_nav_bar.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavIndexProvider);

    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: const [
          HomeScreen(),
          SearchScreen(),
          PostCreateScreen(),
          ActivityScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
} 