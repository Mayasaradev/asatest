

// lib/pages/soal_uas_page.dart
// CustomScrollView - di bawah header SENGAJA KOSONG
import 'package:flutter/material.dart';
import 'package:asatest/l10n/app_strings.dart';
import 'package:asatest/core/widgets/app_botton_nav.dart';

class SoalUasPage extends StatefulWidget {
  const SoalUasPage({super.key});
  @override State<SoalUasPage> createState() => _SoalUasPageState();
}
class _SoalUasPageState extends State<SoalUasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FB),
      body: CustomScrollView(
        slivers: [
          // ===== HEADER =====
          SliverToBoxAdapter(
            child: AppHeader(
              icon: Icons.description_outlined,
              title: AppStrings.soalUasTitle,
              subtitle: AppStrings.soalUasSubtitle,
              actions: [AppHeaderAction(icon: Icons.search, onTap: () {})],
            ),
          ),
          // ===== AREA KOSONG - ISI DI SINI NANTI =====
          // TODO: Isi widget Soal UAS di bawah ini.
          // Nanti ganti SliverToBoxAdapter ini dengan SliverList / SliverToBoxAdapter
          // untuk Tab, Pilih Fakultas, List Prodi, dll.
          // Contoh:
          //   SliverToBoxAdapter(child: _TabBar(...)),
          //   SliverToBoxAdapter(child: _FakultasChips(...)),
          //   SliverList(delegate: SliverChildBuilderDelegate(...)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: const Color(0xFFE8EDF3))),
                child: const Text('TODO: Isi konten Soal UAS di sini\n\n- Tab: Soal UAS / Premium\n- Pilih Fakultas\n- List Prodi', style: TextStyle(color: Color(0xFF9AA6B8))),
              ),
            ),
          ),
          // Biar ada ruang scroll di bawah
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
        ],
      ),
    );
  }
}
