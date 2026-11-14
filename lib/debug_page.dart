import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DebugPage extends StatelessWidget {
  const DebugPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DEBUG LANGSUNG')),
      body: FutureBuilder(
        future: () async {
          final results = <String>[];

          // TES 1: Load id.json langsung, tanpa AssetManifest
          try {
            final s = await rootBundle.loadString('assets/materi/aljabar/id.json');
            results.add('✅ TES 1 BERHASIL load id.json langsung:');
            results.add(s);
          } catch (e) {
            results.add('❌ TES 1 GAGAL load id.json langsung:');
            results.add(e.toString());
          }

          // TES 2: Cek AssetManifest
          try {
            final manifest = await AssetManifest.loadFromAssetBundle(rootBundle);
            final all = manifest.listAssets();
            results.add('');
            results.add('📁 TES 2 AssetManifest total: ${all.length} file');
            for (final f in all) {
              results.add(' - $f');
            }
            if (all.isEmpty) results.add('⚠️ Manifest-nya beneran kosong total');
          } catch (e) {
            results.add('❌ TES 2 GAGAL baca manifest: $e');
          }

          return results;
        }(),
        builder: (context, snap) {
          if (!snap.hasData) return const Center(child: CircularProgressIndicator());
          final lines = snap.data as List<String>;
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [for (final l in lines) Text(l)],
          );
        },
      ),
    );
  }
}
