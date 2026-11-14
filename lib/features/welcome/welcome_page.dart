import 'package:flutter/material.dart';

import '../../features/dashboard/dashboard_screen.dart';

/// ===========================================================================
/// WELCOME PAGE — layout saja, konten diterima dari induk.
/// ===========================================================================
class WelcomePage extends StatelessWidget {
  final Widget brandBadge;
  final Widget welcomeTitle;
  final Widget description;
  final Widget nextButton;

  const WelcomePage({
    super.key,
    required this.brandBadge,
    required this.welcomeTitle,
    required this.description,
    required this.nextButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor(context),
      body: SafeArea(
        child: Stack(
          children: [
            // Konten utama
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  brandBadge,
                  const Spacer(),
                  welcomeTitle,
                  const SizedBox(height: 16),
                  description,
                  const SizedBox(height: 96), // ruang untuk tombol kanan bawah
                ],
              ),
            ),
            // Tombol navigasi kanan bawah
            Positioned(
              right: 24,
              bottom: 24,
              child: nextButton,
            ),
          ],
        ),
      ),
    );
  }
}

/// ===========================================================================
/// WELCOME PARENT — mendeklarasikan tiap widget lewat method, lalu
/// memanggil WelcomePage.
/// ===========================================================================
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

  /// Badge kecil berisi nama aplikasi (gaya pill).
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
          fontSize: 14,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.2,
          color: _labelColor(context),
        ),
      ),
    );
  }

  /// Judul besar "Selamat Datang".
  Widget _buildWelcomeTitle(BuildContext context) {
    return Text(
      _texts()['welcome']!,
      style: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.w700,
        letterSpacing: -1.0,
        height: 1.1,
        color: _labelColor(context),
      ),
    );
  }

  /// Deskripsi aplikasi.
  Widget _buildDescription(BuildContext context) {
    return Text(
      _texts()['description']!,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.1,
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
      child: Material(
        color: Theme.of(context).colorScheme.primary,
        shape: const CircleBorder(),
        elevation: 2,
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const DashboardPage(),
              ),
            );
          },
          child: SizedBox(
            width: 60,
            height: 60,
            child: Icon(
              Icons.arrow_forward_rounded,
              color: Theme.of(context).colorScheme.onPrimary,
              size: 26,
            ),
          ),
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// TEKS — semua string dideklarasikan di satu fungsi.
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
// WARNA — helper adaptif light/dark menggunakan ThemeData Material.
// -----------------------------------------------------------------------------
Color _backgroundColor(BuildContext context) =>
    Theme.of(context).scaffoldBackgroundColor;

Color _labelColor(BuildContext context) =>
    Theme.of(context).colorScheme.onSurface;

Color _secondaryLabelColor(BuildContext context) =>
    Theme.of(context).colorScheme.onSurfaceVariant;

Color _secondaryBackground(BuildContext context) =>
    Theme.of(context).colorScheme.surfaceContainerHighest;
