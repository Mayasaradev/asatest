

// lib/core/widgets/app_bottom_nav.dart
// FIX: pakai package: import, jangan relative. Ini yang bikin error kemarin.
import 'package:flutter/material.dart';
import 'package:asatest/l10n/app_strings.dart';
import 'package:asatest/features/dashboard/dashboard_screen.dart';
import 'package:asatest/features/exercise/exercise_screen.dart';
import 'package:asatest/features/bookmark/bookmark_page.dart';
// HAPUS baris ini kalau file Profile belum ada, atau sesuaikan pathnya:
// import 'package:asatest/features/profile/profile_page.dart';
import 'package:asatest/features/about/about_screen.dart'; // <- ini path benarnya, bukan features/about_screen.dart

class MainShell extends StatefulWidget {
  final int initialIndex;
  const MainShell({super.key, this.initialIndex = 0});
  @override State<MainShell> createState() => _MainShellState();
}
class _MainShellState extends State<MainShell> {
  late int _index;
  @override void initState(){ super.initState(); _index = widget.initialIndex; }
  // Kalau ProfilePage belum ada, ganti dulu dengan Placeholder agar compile:
  // const Center(child: Text('Profile belum dibuat'))
  static const List<Widget> _pages = [
    DashboardPage(),
    SoalUasPage(),
    BookmarkPage(),
    ProfilePage(), // <-- uncomment kalau file profile sudah ada
    //Center(child: Text('Profile - TODO')),
  ];
  void goTo(int i)=> setState(()=> _index=i);
  @override Widget build(BuildContext context){
    return Scaffold(
      body: IndexedStack(index: _index, children: _pages),
      bottomNavigationBar: AppBottomNav(currentIndex: _index, onTap: goTo),
    );
  }
}
class AppBottomNav extends StatelessWidget {
  final int currentIndex; final ValueChanged<int> onTap;
  const AppBottomNav({super.key, required this.currentIndex, required this.onTap});
  @override Widget build(BuildContext context){
    return BottomNavigationBar(
      currentIndex: currentIndex, onTap: onTap,
      selectedItemColor: const Color(0xFF1A7CFF),
      unselectedItemColor: const Color(0xFF9AA6B8),
      type: BottomNavigationBarType.fixed, showUnselectedLabels: true,
      items: [
        BottomNavigationBarItem(icon: const Icon(Icons.home_outlined), activeIcon: const Icon(Icons.home), label: AppStrings.navHome),
        BottomNavigationBarItem(icon: const Icon(Icons.description_outlined), activeIcon: const Icon(Icons.description), label: AppStrings.navSoal),
        BottomNavigationBarItem(icon: const Icon(Icons.bookmark_border), activeIcon: const Icon(Icons.bookmark), label: AppStrings.navBookmark),
        BottomNavigationBarItem(icon: const Icon(Icons.person_outline), activeIcon: const Icon(Icons.person), label: AppStrings.navProfile),
      ],
    );
  }
}
// Header reusable
class AppHeader extends StatelessWidget {
  final IconData icon; final String title, subtitle; final List<Widget>? actions;
  const AppHeader({super.key, required this.icon, required this.title, required this.subtitle, this.actions});
  @override Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.fromLTRB(16,52,16,20),
      decoration: const BoxDecoration(color: Color(0xFF1A7CFF), borderRadius: BorderRadius.vertical(bottom: Radius.circular(4))),
      child: Row(children: [
        Container(width:48,height:48,decoration: BoxDecoration(color: Colors.white.withOpacity(0.22), shape: BoxShape.circle), child: Icon(icon,color: Colors.white,size:26)),
        const SizedBox(width:12),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
          Text(title, style: const TextStyle(fontSize:22,fontWeight:FontWeight.w800,color:Colors.white)),
          Text(subtitle, style: const TextStyle(fontSize:13,color:Colors.white70)),
        ])),
        if(actions!=null) ...actions!,
      ]),
    );
  }
}
class AppHeaderAction extends StatelessWidget {
  final IconData icon; final VoidCallback onTap;
  const AppHeaderAction({super.key, required this.icon, required this.onTap});
  @override Widget build(BuildContext context)=> Padding(
    padding: const EdgeInsets.only(left:8),
    child: InkWell(onTap:onTap, borderRadius: BorderRadius.circular(99),
      child: Container(width:44,height:44,decoration: BoxDecoration(color: Colors.white.withOpacity(0.22), shape: BoxShape.circle), child: Icon(icon,color:Colors.white))),
  );
}
