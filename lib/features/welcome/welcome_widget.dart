import 'package:flutter/material.dart';
import '../../core/widgets/app_text.dart';
import 'package:flutter/cupertino.dart';
import '../../features/dashboard/dashboard_screen.dart';
import '../../features/welcome/welcome_page.dart';

/// Class induk: mendeklarasikan setiap widget sebagai method tersendiri,
/// lalu memanggil class halaman (WelcomePage).
class WelcomeParent extends StatelessWidget {
  const WelcomeParent({super.key});

  @override
  Widget build(BuildContext context) {
    return WelcomePage(
      brandBadge: _buildBrandBadge(context),
      welcomeTitle: _buildWelcomeTitle(context),
      description: _buildDescription(context),
      nextButton: _buildNextButton(context),
    );
  }

  // ---------------------------------------------------------------------------
  // WIDGET BUILDERS
  // ---------------------------------------------------------------------------

  /// Badge kecil berisi nama aplikasi (gaya pill, khas iOS).
  Widget _buildBrandBadge(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: _secondaryBackground(context),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        _texts()['brand']!,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.2,
          color: _labelColor(context),
        ),
      ),
    );
  }

  /// Judul besar "Selamat Datang" (Large Title emphasized).
  Widget _buildWelcomeTitle(BuildContext context) {
    return Text(
      _texts()['welcome']!,
      style: TextStyle(
        fontSize: 42,
        fontWeight: FontWeight.w700,
        letterSpacing: -1.2,
        height: 1.05,
        color: _labelColor(context),
      ),
    );
  }

  /// Deskripsi aplikasi (Body 17pt).
  Widget _buildDescription(BuildContext context) {
    return Text(
      _texts()['description']!,
      style: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.2,
        height: 1.45,
        color: _secondaryLabelColor(context),
      ),
    );
  }

  /// Tombol bulat di kanan bawah → arahkan ke halaman berikutnya.
  Widget _buildNextButton(BuildContext context) {
    return Semantics(
      button: true,
      label: _texts()['nextLabel']!,
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: () {
           TODO: // navigasi ke halaman berikutnya, contoh:
          Navigator.of(context).push(
            CupertinoPageRoute(builder: (_) => const DashboardPage()),
          );
        },
        child: Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: _accentColor(context),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            CupertinoIcons.arrow_right,
            color: CupertinoColors.white,
            size: 26,
          ),
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// TEKS — semua string hanya dideklarasikan di fungsi ini.
// -----------------------------------------------------------------------------
Map<String, String> _texts() => {
      'brand': 'AsaTest',
      'welcome': 'Selamat Datang',
      'description':
          'AsaTest adalah aplikasi yang dapat membantumu dalam pengerjaan soal '
              'dan pembelajaran suatu pengetahuan yang dapat disediakan oleh '
              'anda sendiri maupun komunitas. Selamat mencoba, semoga anda '
              'nyaman disini.',
      'nextLabel': 'Lanjutkan',
    };

// -----------------------------------------------------------------------------
// WARNA — helper yang otomatis beradaptasi light/dark (Apple Dynamic Colors).
// -----------------------------------------------------------------------------
Color _labelColor(BuildContext context) =>
    CupertinoDynamicColor.resolve(CupertinoColors.label, context);

Color _secondaryLabelColor(BuildContext context) =>
    CupertinoDynamicColor.resolve(CupertinoColors.secondaryLabel, context);

Color _secondaryBackground(BuildContext context) =>
    CupertinoDynamicColor.resolve(CupertinoColors.secondarySystemBackground, context);

Color _accentColor(BuildContext context) =>
    CupertinoDynamicColor.resolve(CupertinoColors.activeBlue, context);
