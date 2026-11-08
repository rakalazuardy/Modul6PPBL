import 'package:flutter/material.dart';

import '../pages/halaman_beranda.dart';
import '../pages/halaman_layanan.dart';
import '../pages/halaman_warga.dart';
import '../widgets/badge_pengajuan.dart';
import '../widgets/theme_toggle_button.dart';
import 'app_routes.dart';

class KerangkaNavigasi extends StatefulWidget {
  const KerangkaNavigasi({super.key});

  @override
  State<KerangkaNavigasi> createState() =>
      _KerangkaNavigasiState();
}

class _KerangkaNavigasiState extends State<KerangkaNavigasi> {
  int indeksTerpilih = 0;

  final List<Widget> halaman = const [
    HalamanBeranda(),
    HalamanLayanan(),
    HalamanWarga(),
  ];

  final List<String> judulHalaman = const [
    'Beranda',
    'Layanan',
    'Warga',
  ];

  void pilihHalaman(int indeks) {
    setState(() {
      indeksTerpilih = indeks;
    });

    Navigator.popUntil(
      context,
      (route) => route.isFirst,
    );
  }

  void bukaMenuPendukung(String route) {
    Navigator.pop(context);
    Navigator.pushNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final layarLebar = constraints.maxWidth >= 600;

        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Nusantara Cerdas - ${judulHalaman[indeksTerpilih]}',
            ),
            actions: const [
              ThemeToggleButton(),
            ],
          ),

          drawer: NavigationDrawer(
            selectedIndex: indeksTerpilih,
            onDestinationSelected: pilihHalaman,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 24, 16, 12),
                child: Text(
                  'NUSANTARA CERDAS',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              NavigationDrawerDestination(
                icon: const Icon(Icons.home_outlined),
                selectedIcon: const Icon(Icons.home),
                label: const Text('Beranda'),
              ),
              NavigationDrawerDestination(
                icon: const Icon(Icons.miscellaneous_services_outlined),
                selectedIcon: const Icon(Icons.miscellaneous_services),
                label: const Text('Layanan'),
              ),
              NavigationDrawerDestination(
                icon: const Icon(Icons.people_outline),
                selectedIcon: const Icon(Icons.people),
                label: const Text('Warga'),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.settings_outlined),
                title: const Text('Pengaturan Kota'),
                onTap: () {
                  bukaMenuPendukung(AppRoutes.pengaturan);
                },
              ),
              ListTile(
                leading: const Icon(Icons.info_outline),
                title: const Text('Tentang Aplikasi'),
                onTap: () {
                  bukaMenuPendukung(AppRoutes.tentang);
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Keluar'),
                onTap: () {
                  bukaMenuPendukung(AppRoutes.keluar);
                },
              ),
            ],
          ),

          body: Row(
            children: [
              if (layarLebar)
                NavigationRail(
                  selectedIndex: indeksTerpilih,
                  onDestinationSelected: pilihHalaman,
                  labelType: NavigationRailLabelType.all,
                  leading: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Icon(Icons.location_city, size: 32),
                  ),
                  destinations: [
                    const NavigationRailDestination(
                      icon: Icon(Icons.home_outlined),
                      selectedIcon: Icon(Icons.home),
                      label: Text('Beranda'),
                    ),
                    const NavigationRailDestination(
                      icon: Icon(Icons.miscellaneous_services_outlined),
                      selectedIcon: Icon(Icons.miscellaneous_services),
                      label: Text('Layanan'),
                    ),
                    NavigationRailDestination(
                      icon: const BadgePengajuan(),
                      selectedIcon: const BadgePengajuan(),
                      label: const Text('Warga'),
                    ),
                  ],
                ),

              Expanded(
                child: IndexedStack(
                  index: indeksTerpilih,
                  children: halaman,
                ),
              ),
            ],
          ),

          bottomNavigationBar: layarLebar
              ? null
              : NavigationBar(
                  selectedIndex: indeksTerpilih,
                  onDestinationSelected: pilihHalaman,
                  destinations: const [
                    NavigationDestination(
                      icon: Icon(Icons.home_outlined),
                      selectedIcon: Icon(Icons.home),
                      label: 'Beranda',
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.miscellaneous_services_outlined),
                      selectedIcon: Icon(Icons.miscellaneous_services),
                      label: 'Layanan',
                    ),
                    NavigationDestination(
                      icon: BadgePengajuan(),
                      selectedIcon: BadgePengajuan(),
                      label: 'Warga',
                    ),
                  ],
                ),
        );
      },
    );
  }
}