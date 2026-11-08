import 'package:flutter/material.dart';

import '../data/data_layanan.dart';
import '../models/layanan.dart';
import '../widgets/kartu_layanan.dart';


class HalamanLayanan extends StatelessWidget {
  const HalamanLayanan({super.key});

  void bukaDetail(BuildContext context, Layanan layanan) {
    Navigator.pushNamed(context, '/detail-layanan', arguments: layanan);
  }

  Widget daftarLayanan(BuildContext context, String kategori) {
    final daftar = DataLayanan.berdasarkanKategori(kategori);

    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: daftar.length,
      itemBuilder: (context, index) {
        final layanan = daftar[index];

        return KartuLayanan(
          layanan: layanan,
          onTap: () => bukaDetail(context, layanan),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Column(
          children: [
            Material(
              color: Theme.of(context).colorScheme.surface,
              child: const TabBar(
                tabs: [
                  Tab(text: 'Perizinan'),
                  Tab(text: 'Kesehatan'),
                  Tab(text: 'Transportasi'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  daftarLayanan(context, 'Perizinan'),
                  daftarLayanan(context, 'Kesehatan'),
                  daftarLayanan(context, 'Transportasi'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
