import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/pengajuan_cubit.dart';
import '../models/layanan.dart';

class HalamanRiwayat extends StatelessWidget {
  const HalamanRiwayat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Pengajuan'),
      ),
      body: BlocBuilder<PengajuanCubit, List<Layanan>>(
        builder: (context, daftar) {
          if (daftar.isEmpty) {
            return const Center(
              child: Text('Belum ada riwayat pengajuan.'),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: daftar.length,
            itemBuilder: (context, index) {
              final layanan = daftar[index];

              return Card(
                child: ListTile(
                  leading: const Icon(Icons.assignment_turned_in),
                  title: Text(layanan.nama),
                  subtitle: Text(layanan.dinas),
                  trailing: IconButton(
                    tooltip: 'Hapus dari pengajuan',
                    icon: const Icon(Icons.delete_outline),
                    onPressed: () {
                      context
                          .read<PengajuanCubit>()
                          .hapusPengajuan(layanan.id);
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}