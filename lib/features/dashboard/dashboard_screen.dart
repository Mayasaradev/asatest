

// lib/pages/dashboard_page.dart
// WAJIB CustomScrollView - navigasi dipegang MainShell
import 'package:flutter/material.dart';
import 'package:asatest/l10n/app_strings.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FB),
      body: CustomScrollView(
        slivers: [
          // ===== HEADER =====
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 52, 16, 20),
              decoration: const BoxDecoration(color: Color(0xFF1A7CFF), borderRadius: BorderRadius.vertical(bottom: Radius.circular(24))),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(children: [
                  Container(width: 44, height: 44, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)), child: const Center(child: Text('A', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: Color(0xFF1A7CFF))))),
                  const SizedBox(width: 12),
                  Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(AppStrings.appName, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Colors.white)),
                    Text(AppStrings.appTagline, style: const TextStyle(color: Colors.white70, fontSize: 12)),
                  ])),
                  Container(width: 42, height: 42, decoration: BoxDecoration(color: Colors.white.withOpacity(0.22), borderRadius: BorderRadius.circular(12)), child: const Icon(Icons.notifications_none_rounded, color: Colors.white)),
                ]),
                const SizedBox(height: 18),
                Container(padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12), decoration: BoxDecoration(color: Colors.white.withOpacity(0.22), borderRadius: BorderRadius.circular(14)), child: Row(children: [const Icon(Icons.search, color: Colors.white), const SizedBox(width: 8), Text(AppStrings.searchHint, style: const TextStyle(color: Colors.white))])),
                const SizedBox(height: 16),
                Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: const Color(0xFF0B5ED7), borderRadius: BorderRadius.circular(18)), child: Row(children: [
                  Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4), decoration: BoxDecoration(color: Colors.white.withOpacity(0.22), borderRadius: BorderRadius.circular(20)), child: Text(AppStrings.welcomeBadge, style: const TextStyle(color: Colors.white, fontSize: 12))),
                    const SizedBox(height: 10),
                    Text(AppStrings.welcomeTitle, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w800)),
                    const SizedBox(height: 6),
                    Text(AppStrings.welcomeSubtitle, style: const TextStyle(color: Colors.white70, fontSize: 13)),
                  ])),
                  const Icon(Icons.school_outlined, size: 64, color: Colors.white70),
                ])),
              ]),
            ),
          ),
          // ===== BODY =====
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(AppStrings.greetingTitle, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w800)),
                const SizedBox(height: 6),
                Text(AppStrings.greetingSubtitle, style: const TextStyle(color: Color(0xFF6B778D))),
                const SizedBox(height: 16),
                Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: const Color(0xFF1A2433), borderRadius: BorderRadius.circular(18)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(AppStrings.continueLearning, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16)), const Icon(Icons.north_east, color: Colors.white70, size: 20)]),
                  const SizedBox(height: 14),
                  Text(AppStrings.continueSubject, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w800)),
                  const SizedBox(height: 6),
                  Text(AppStrings.continueMeta, style: const TextStyle(color: Colors.white60)),
                  const SizedBox(height: 12),
                  ClipRRect(borderRadius: BorderRadius.circular(99), child: const LinearProgressIndicator(value: 0.6, minHeight: 6, backgroundColor: Colors.white12, valueColor: AlwaysStoppedAnimation(Color(0xFF1A7CFF)))),
                  const SizedBox(height: 12),
                  Text(AppStrings.continueAction, style: const TextStyle(color: Colors.white70, fontWeight: FontWeight.w600)),
                ])),
                const SizedBox(height: 16),
                Row(children: [
                  Expanded(child: _Stat(label: AppStrings.totalSoal, value: AppStrings.totalSoalValue)),
                  const SizedBox(width: 12),
                  Expanded(child: _Stat(label: AppStrings.akurasi, value: AppStrings.akurasiValue)),
                ]),
                const SizedBox(height: 22),
                Text(AppStrings.learningAnalytics, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
                const SizedBox(height: 12),
                Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18)), child: Column(children: [
                  _RowAnalytics(AppStrings.subjectMath, '82%'),
                  const SizedBox(height: 16),
                  _RowAnalytics(AppStrings.subjectIndonesian, '75%'),
                  const SizedBox(height: 16),
                  _RowAnalytics(AppStrings.subjectEnglish, '68%'),
                ])),
                const SizedBox(height: 22),
                Text(AppStrings.recommended, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
                const SizedBox(height: 12),
                Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18), border: Border.all(color: const Color(0xFFE8EDF3))), child: Row(children: [const Icon(Icons.my_location, color: Color(0xFF1A7CFF)), const SizedBox(width: 10), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(AppStrings.reviewTitle, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16)), Text(AppStrings.reviewSubtitle, style: const TextStyle(color: Color(0xFF6B778D))) ]))])),
                const SizedBox(height: 8),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
class _Stat extends StatelessWidget {
  final String label, value; const _Stat({required this.label, required this.value});
  @override Widget build(BuildContext context) => Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(label, style: const TextStyle(color: Color(0xFF6B778D))), const SizedBox(height: 14), Text(value, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w900))]));
}
class _RowAnalytics extends StatelessWidget {
  final String label, value; const _RowAnalytics(this.label, this.value);
  @override Widget build(BuildContext context) => Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(label), Text(value, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16))]);
}
