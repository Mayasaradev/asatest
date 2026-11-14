// lib/features/welcome/welcome_screen.dart
// Halaman pertama saat user baru membuka aplikasi.
// Tombol "Mulai Belajar" -> lempar ke Dashboard (MainShell).
//
// Cara pakai di main.dart:
//   home: const WelcomeScreen(),
// Atau kalau pakai first_launch_service:
//   home: isFirstLaunch ? const WelcomeScreen() : const MainShell(),

import 'package:flutter/material.dart';
import 'package:asatest/l10n/app_strings.dart';
import 'package:asatest/core/widgets/app_botton_nav.dart'; // MainShell ada di sini
// Kalau nama file kamu masih app_botton_nav.dart (pakai O), ganti baris di atas jadi:
// import 'package:asatest/core/widgets/app_botton_nav.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  // Kalau nanti mau pakai route bernama, pakai ini:
  // Navigator.pushReplacementNamed(context, '/main');
  void _goToDashboard(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const MainShell()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FB),
      body: CustomScrollView(
        slivers: [
          // ===== HEADER BIRU ala Soalut.com =====
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.fromLTRB(24, 64, 24, 32),
              decoration: const BoxDecoration(
                color: Color(0xFF1A7CFF),
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(28)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Logo
                  Container(
                    width: 84, height: 84,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.12), blurRadius: 16, offset: const Offset(0, 6))],
                    ),
                    child: const Center(child: Text('A', style: TextStyle(fontSize: 48, fontWeight: FontWeight.w900, color: Color(0xFF1A7CFF)))),
                  ),
                  const SizedBox(height: 18),
                  Text(AppStrings.appName, style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: Colors.white, letterSpacing: 0.5)),
                  const SizedBox(height: 6),
                  Text(AppStrings.appTagline, style: const TextStyle(fontSize: 14, color: Colors.white70), textAlign: TextAlign.center),
                ],
              ),
            ),
          ),

          // ===== BODY =====
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Badge
                  Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                      decoration: BoxDecoration(color: const Color(0xFFE8F2FF), borderRadius: BorderRadius.circular(99)),
                      child: Text(AppStrings.welcomeBadge, style: const TextStyle(color: Color(0xFF1A7CFF), fontWeight: FontWeight.w700, fontSize: 13)),
                    ),
                  ),
                  const SizedBox(height: 18),

                  // Judul + Deskripsi (versi formal C2, sudah dirapikan dari teks kamu)
                  Text(AppStrings.welcomeTitle, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w800, color: Color(0xFF1A2433), height: 1.25), textAlign: TextAlign.center),
                  const SizedBox(height: 12),
                  Text(AppStrings.welcomeDesc, style: const TextStyle(fontSize: 15, color: Color(0xFF6B778D), height: 1.6), textAlign: TextAlign.center),
                  const SizedBox(height: 24),

                  // 3 Fitur unggulan
                  const _FeatureItem(icon: Icons.description_outlined, tint: Color(0xFFE8F2FF), iconColor: Color(0xFF1A7CFF), title: AppStrings.welcomeFeature1Title, subtitle: AppStrings.welcomeFeature1Sub),
                  const SizedBox(height: 12),
                  const _FeatureItem(icon: Icons.book_outlined, tint: Color(0xFFFFF3D6), iconColor: Color(0xFFF59E0B), title: AppStrings.welcomeFeature2Title, subtitle: AppStrings.welcomeFeature2Sub),
                  const SizedBox(height: 12),
                  const _FeatureItem(icon: Icons.track_changes_outlined, tint: Color(0xFFD6F5E3), iconColor: Color(0xFF22C55E), title: AppStrings.welcomeFeature3Title, subtitle: AppStrings.welcomeFeature3Sub),
                  const SizedBox(height: 32),

                  // Tombol utama -> Dashboard
                  SizedBox(
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () => _goToDashboard(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1A7CFF),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        elevation: 0,
                      ),
                      child: Text(AppStrings.welcomeCta, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Tombol kedua (opsional) - lewati juga ke dashboard, tapi tanpa simpan first_launch
                  // Kalau tidak mau ada tombol ini, hapus TextButton di bawah.
                  TextButton(
                    onPressed: () => _goToDashboard(context),
                    child: Text(AppStrings.welcomeSkip, style: const TextStyle(color: Color(0xFF6B778D), fontWeight: FontWeight.w600)),
                  ),
                  const SizedBox(height: 8),
                  Text(AppStrings.welcomeFooter, style: const TextStyle(fontSize: 12, color: Color(0xFF9AA6B8)), textAlign: TextAlign.center),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FeatureItem extends StatelessWidget {
  final IconData icon; final Color tint, iconColor; final String title, subtitle;
  const _FeatureItem({required this.icon, required this.tint, required this.iconColor, required this.title, required this.subtitle});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18), border: Border.all(color: const Color(0xFFE8EDF3))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(width: 48, height: 48, decoration: BoxDecoration(color: tint, borderRadius: BorderRadius.circular(12)), child: Icon(icon, color: iconColor, size: 24)),
          const SizedBox(width: 12),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xFF1A2433))),
            const SizedBox(height: 4),
            Text(subtitle, style: const TextStyle(fontSize: 13, color: Color(0xFF6B778D), height: 1.4)),
          ])),
        ],
      ),
    );
  }
}
