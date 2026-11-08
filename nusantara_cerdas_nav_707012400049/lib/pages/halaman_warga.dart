import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/favorit_cubit.dart';
import '../cubit/pengajuan_cubit.dart';
import '../data/data_layanan.dart';
import '../models/layanan.dart';
import '../widgets/theme_toggle_button.dart';

class HalamanWarga extends StatelessWidget {
  const HalamanWarga({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Layanan Favorit',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),

          BlocBuilder<FavoritCubit, Set<String>>(
            builder: (context, daftarFavorit) {
              if (daftarFavorit.isEmpty) {
                return const Card(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Icon(
                          Icons.star_border,
                          size: 40,
                        ),
                        SizedBox(height: 8),
                        Text('Belum ada layanan favorit.'),
                        Text(
                          'Tekan ikon bintang pada halaman Layanan.',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              }

              final layananFavorit = DataLayanan.semuaLayanan
                  .where(
                    (layanan) =>
                        daftarFavorit.contains(layanan.nama),
                  )
                  .toList();

              return Column(
                children: layananFavorit.map((layanan) {
                  return Card(
                    child: ListTile(
                      leading: Icon(
                        Icons.star,
                        color: theme.colorScheme.primary,
                      ),
                      title: Text(layanan.nama),
                      subtitle: Text(layanan.kategori),
                      trailing: IconButton(
                        tooltip: 'Hapus favorit',
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          context
                              .read<FavoritCubit>()
                              .batalTandai(layanan.nama);
                        },
                      ),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/detail-layanan',
                          arguments: layanan,
                        );
                      },
                    ),
                  );
                }).toList(),
              );
            },
          ),

          const SizedBox(height: 24),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Pengajuan Saya',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/riwayat');
                },
                child: const Text('Lihat Semua'),
              ),
            ],
          ),

          BlocBuilder<PengajuanCubit, List<Layanan>>(
            builder: (context, daftarPengajuan) {
              if (daftarPengajuan.isEmpty) {
                return const Card(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Center(
                      child: Text('Belum ada pengajuan layanan.'),
                    ),
                  ),
                );
              }

              return Column(
                children: daftarPengajuan.map((layanan) {
                  return Card(
                    child: ListTile(
                      leading: const Icon(
                        Icons.assignment_outlined,
                      ),
                      title: Text(layanan.nama),
                      subtitle: Text(layanan.dinas),
                      trailing: const Icon(
                        Icons.check_circle_outline,
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),

          const SizedBox(height: 24),

          Text(
            'Pengaturan Tampilan',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Card(
            child: ListTile(
              leading: Icon(Icons.brightness_6_outlined),
              title: Text('Mode Terang / Gelap'),
              subtitle: Text(
                'Gunakan tombol tema di bagian atas aplikasi.',
              ),
              trailing: ThemeToggleButton(),
            ),
          ),
        ],
      ),
    );
  }
}