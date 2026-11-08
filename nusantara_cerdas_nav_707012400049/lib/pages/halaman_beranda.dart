import 'package:flutter/material.dart';

import '../data/data_layanan.dart';

class HalamanBeranda extends StatelessWidget {
  const HalamanBeranda({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.location_city,
                  size: 48,
                  color: theme.colorScheme.onPrimaryContainer,
                ),
                const SizedBox(height: 16),
                Text(
                  'Selamat Datang!',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    color: theme.colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Nusantara Cerdas Mobile membantu masyarakat '
                  'mengakses berbagai layanan publik dengan '
                  'lebih mudah dan praktis.',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onPrimaryContainer,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Layanan Publik',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          _kartuKategori(
            context,
            Icons.description_outlined,
            'Perizinan',
            'Mengurus berbagai kebutuhan administrasi dan perizinan.',
          ),
          _kartuKategori(
            context,
            Icons.local_hospital_outlined,
            'Kesehatan',
            'Mengakses informasi dan layanan kesehatan masyarakat.',
          ),
          _kartuKategori(
            context,
            Icons.directions_bus_outlined,
            'Transportasi',
            'Melaporkan masalah dan memperoleh informasi transportasi.',
          ),
          const SizedBox(height: 16),
          Text(
            'Total layanan tersedia: ${DataLayanan.semuaLayanan.length}',
            style: theme.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  Widget _kartuKategori(
    BuildContext context,
    IconData icon,
    String judul,
    String deskripsi,
  ) {
    final theme = Theme.of(context);

    return Card(
      child: ListTile(
        leading: Icon(icon, color: theme.colorScheme.primary, size: 32),
        title: Text(judul),
        subtitle: Text(deskripsi),
      ),
    );
  }
}
