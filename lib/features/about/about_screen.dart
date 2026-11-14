

// lib/pages/profile_page.dart - CustomScrollView
import 'package:flutter/material.dart';
import 'package:asatest/l10n/app_strings.dart';
import 'package:asatest/core/widgets/app_botton_nav.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FB),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: AppHeader(icon: Icons.person_outline, title: AppStrings.profileTitle, subtitle: AppStrings.profileSubtitle),
          ),
          // Semua section jadi SliverToBoxAdapter agar tetap 1 scroll
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                _Section(AppStrings.dataSaya, [
                  _Item(icon: Icons.history, tint: Color(0xFFE8F2FF), iconColor: Color(0xFF1A7CFF), title: AppStrings.riwayatLatihan, subtitle: AppStrings.riwayatLatihanSub, onTap: () {}),
                  _Item(icon: Icons.bookmark, tint: Color(0xFFFFF3D6), iconColor: Color(0xFFF59E0B), title: AppStrings.bookmarkMenu, subtitle: AppStrings.bookmarkMenuSub, onTap: () {}),
                  _Item(icon: Icons.cloud_download, tint: Color(0xFFD6F5E3), iconColor: Color(0xFF22C55E), title: AppStrings.latihanOffline, subtitle: AppStrings.latihanOfflineSub, onTap: () {}),
                  _Item(icon: Icons.picture_as_pdf_outlined, tint: Color(0xFFFFE4E4), iconColor: Color(0xFFEF4444), title: AppStrings.dokumenPdf, subtitle: AppStrings.dokumenPdfSub, onTap: () {}),
                ]),
                const SizedBox(height: 20),
                _Section(AppStrings.informasi, [
                  _Item(icon: Icons.language, tint: Color(0xFFE8F2FF), iconColor: Color(0xFF1A7CFF), title: AppStrings.tentangAsaTest, subtitle: AppStrings.tentangAsaTestSub, onTap: () {}),
                  _Item(icon: Icons.shield_outlined, tint: Color(0xFFD6F5E3), iconColor: Color(0xFF22C55E), title: AppStrings.privacyPolicy, subtitle: AppStrings.privacyPolicySub, onTap: () {}),
                  _Item(icon: Icons.warning_amber_rounded, tint: Color(0xFFFFF3D6), iconColor: Color(0xFFD97706), title: AppStrings.disclaimer, subtitle: AppStrings.disclaimerSub, onTap: () {}),
                  _Item(icon: Icons.mail_outline, tint: Color(0xFFFFEEDD), iconColor: Color(0xFFEA580C), title: AppStrings.hubungiKami, subtitle: AppStrings.hubungiKamiSub, onTap: () {}),
                ]),
                const SizedBox(height: 20),
                _Section(AppStrings.lainnya, [
                  _Item(icon: Icons.favorite_border, tint: Color(0xFFFFE4E4), iconColor: Color(0xFFEF4444), title: AppStrings.dukung, subtitle: AppStrings.dukungSub, onTap: () {}),
                  _Item(icon: Icons.campaign_outlined, tint: Color(0xFFFFF3D6), iconColor: Color(0xFFD97706), title: AppStrings.pasangIklan, subtitle: AppStrings.pasangIklanSub, onTap: () {}),
                  _Item(icon: Icons.refresh, tint: Color(0xFFE0F2F1), iconColor: Color(0xFF0D9488), title: AppStrings.cekPembaruan, subtitle: AppStrings.cekPembaruanSub, onTap: () {}),
                  _Item(icon: Icons.star, tint: Color(0xFFFFF3D6), iconColor: Color(0xFFF59E0B), title: AppStrings.beriPenilaian, subtitle: AppStrings.beriPenilaianSub, onTap: () {}),
                  _Item(icon: Icons.smartphone_outlined, tint: Color(0xFFF1F5F9), iconColor: Color(0xFF64748B), title: AppStrings.tentangAplikasi, subtitle: AppStrings.tentangAplikasiSub, onTap: () {}),
                ]),
                const SizedBox(height: 16),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
class _Section extends StatelessWidget {
  final String title; final List<Widget> children;
  const _Section(this.title, this.children);
  @override Widget build(BuildContext context) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800)), const SizedBox(height: 12), ...children]);
}
class _Item extends StatelessWidget {
  final IconData icon; final Color tint, iconColor; final String title, subtitle; final VoidCallback onTap;
  const _Item({required this.icon, required this.tint, required this.iconColor, required this.title, required this.subtitle, required this.onTap});
  @override Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: InkWell(onTap: onTap, borderRadius: BorderRadius.circular(18),
      child: Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18)), child: Row(children: [
        Container(width: 52, height: 52, decoration: BoxDecoration(color: tint, borderRadius: BorderRadius.circular(12)), child: Icon(icon, color: iconColor, size: 26)),
        const SizedBox(width: 12),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)), const SizedBox(height: 2), Text(subtitle, style: const TextStyle(color: Color(0xFF9AA6B8), fontSize: 13))])),
        const Icon(Icons.chevron_right, color: Color(0xFFCBD5E1)),
      ]))),
  );
}
