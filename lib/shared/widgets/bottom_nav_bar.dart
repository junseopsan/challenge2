import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bottomNavIndexProvider = StateProvider<int>((ref) => 0);

class BottomNavBar extends ConsumerWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavIndexProvider);

    return NavigationBar(
      backgroundColor: Colors.black,
      indicatorColor: Colors.transparent,
      selectedIndex: currentIndex,
      onDestinationSelected: (index) {
        ref.read(bottomNavIndexProvider.notifier).state = index;
      },
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined, color: Colors.white),
          selectedIcon: Icon(Icons.home, color: Colors.white),
          label: '홈',
        ),
        NavigationDestination(
          icon: Icon(Icons.search_outlined, color: Colors.white),
          selectedIcon: Icon(Icons.search, color: Colors.white),
          label: '검색',
        ),
        NavigationDestination(
          icon: Icon(Icons.add_box_outlined, color: Colors.white),
          selectedIcon: Icon(Icons.add_box, color: Colors.white),
          label: '만들기',
        ),
        NavigationDestination(
          icon: Icon(Icons.favorite_outline, color: Colors.white),
          selectedIcon: Icon(Icons.favorite, color: Colors.white),
          label: '활동',
        ),
        NavigationDestination(
          icon: Icon(Icons.person_outline, color: Colors.white),
          selectedIcon: Icon(Icons.person, color: Colors.white),
          label: '프로필',
        ),
      ],
    );
  }
} 