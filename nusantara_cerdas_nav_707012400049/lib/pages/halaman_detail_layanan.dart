import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/pengajuan_cubit.dart';
import '../models/layanan.dart';

class HalamanDetailLayanan extends StatefulWidget {
  const HalamanDetailLayanan({super.key});

  @override
  State<HalamanDetailLayanan> createState() =>
      _HalamanDetailLayananState();
}

class _HalamanDetailLayananState
    extends State<HalamanDetailLayanan> {
  bool sedangMengirim = false;

  Future<void> ajukanPermohonan(Layanan layanan) async {
    if (sedangMengirim) return;

    setState(() {
      sedangMengirim = true;
    });

    await Future.delayed(
      const Duration(seconds: 2),
    );

    if (!mounted) return;

    context.read<PengajuanCubit>().tambahPengajuan(layanan);

    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    final layanan =
        ModalRoute.of(context)!.settings.arguments as Layanan;

    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Layanan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 40,
                backgroundColor: theme.colorScheme.primaryContainer,
                child: Icon(
                  Icons.miscellaneous_services,
                  size: 40,
                  color: theme.colorScheme.onPrimaryContainer,
                ),
              ),
            ),
            const SizedBox(height: 24),

            Text(
              layanan.nama,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

            _informasi(
              context,
              'Kategori',
              layanan.kategori,
            ),
            _informasi(
              context,
              'Dinas Terkait',
              layanan.dinas,
            ),
            _informasi(
              context,
              'Jam Operasional',
              layanan.jam,
            ),

            const SizedBox(height: 20),

            Text(
              'Deskripsi Layanan',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(layanan.keterangan),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: sedangMengirim
                    ? null
                    : () => ajukanPermohonan(layanan),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                ),
                child: sedangMengirim
                    ? const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                          ),
                          SizedBox(width: 12),
                          Text('Mengirim Permohonan...'),
                        ],
                      )
                    : const Text('Ajukan Permohonan'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _informasi(
    BuildContext context,
    String judul,
    String isi,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            judul,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const SizedBox(height: 4),
          Text(isi),
        ],
      ),
    );
  }
}