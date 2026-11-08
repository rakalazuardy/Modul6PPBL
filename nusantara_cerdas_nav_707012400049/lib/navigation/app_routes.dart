import 'package:flutter/material.dart';

import '../models/layanan.dart';
import '../pages/halaman_detail_layanan.dart';
import '../pages/halaman_riwayat.dart';
import '../pages/halaman_pengaturan.dart';
import '../pages/halaman_tentang.dart';
import '../pages/halaman_keluar.dart';

class AppRoutes {
  static const String beranda = '/';
  static const String detailLayanan = '/detail-layanan';
  static const String riwayat = '/riwayat';
  static const String pengaturan = '/pengaturan';
  static const String tentang = '/tentang';
  static const String keluar = '/keluar';

  static Route<dynamic> generateRoute(
    RouteSettings settings,
  ) {
    switch (settings.name) {
      case detailLayanan:
        if (settings.arguments is! Layanan) {
          return MaterialPageRoute(
            builder: (_) => const Scaffold(
              body: Center(
                child: Text('Data layanan tidak ditemukan.'),
              ),
            ),
          );
        }

        return MaterialPageRoute(
          builder: (_) => const HalamanDetailLayanan(),
          settings: settings,
        );

      case riwayat:
        return MaterialPageRoute(
          builder: (_) => const HalamanRiwayat(),
        );

      case pengaturan:
        return MaterialPageRoute(
          builder: (_) => const HalamanPengaturan(),
        );

      case tentang:
        return MaterialPageRoute(
          builder: (_) => const HalamanTentang(),
        );

      case keluar:
        return MaterialPageRoute(
          builder: (_) => const HalamanKeluar(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(
              title: const Text('Halaman Tidak Ditemukan'),
            ),
            body: const Center(
              child: Text(
                'Halaman yang diminta tidak tersedia.',
              ),
            ),
          ),
        );
    }
  }
}