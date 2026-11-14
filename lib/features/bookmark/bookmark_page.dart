

// lib/pages/bookmark_page.dart - CustomScrollView + Empty State
import 'package:flutter/material.dart';
import 'package:asatest/l10n/app_strings.dart';
import 'package:asatest/core/widgets/app_botton_nav.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});
  final List<String> bookmarks = const []; // TODO: ganti dengan model kamu
  @override
  Widget build(BuildContext context) {
    final isEmpty = bookmarks.isEmpty;
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FB),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: AppHeader(
              icon: Icons.bookmark_border,
              title: AppStrings.bookmarkTitle,
              subtitle: AppStrings.bookmarkCount,
              actions: [
                AppHeaderAction(icon: Icons.search, onTap: () {}),
                AppHeaderAction(icon: Icons.delete_outline, onTap: () {}),
              ],
            ),
          ),
          if (isEmpty)
            // Empty state harus pakai SliverFillRemaining agar bisa center
            // walau kontennya pendek
            SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Stack(alignment: Alignment.center, children: [
                      Container(width: 140, height: 140, decoration: BoxDecoration(color: const Color(0xFF1A7CFF).withOpacity(0.08), shape: BoxShape.circle)),
                      Container(width: 100, height: 100, decoration: BoxDecoration(color: const Color(0xFF1A7CFF).withOpacity(0.18), shape: BoxShape.circle)),
                      Container(width: 68, height: 68, decoration: const BoxDecoration(color: Color(0xFF1A7CFF), shape: BoxShape.circle), child: const Icon(Icons.bookmark_border, color: Colors.white, size: 34)),
                    ]),
                    const SizedBox(height: 28),
                    Text(AppStrings.bookmarkEmptyTitle, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: Color(0xFF1A2433)), textAlign: TextAlign.center),
                    const SizedBox(height: 10),
                    Text(AppStrings.bookmarkEmptySubtitle, style: const TextStyle(color: Color(0xFF6B778D), fontSize: 15, height: 1.4), textAlign: TextAlign.center),
                  ]),
                ),
              ),
            )
          else
            // Kalau ada isi, pakai SliverList (bukan ListView di dalam Column)
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, i) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Card(child: ListTile(title: Text(bookmarks[i]))),
                  ),
                  childCount: bookmarks.length,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
