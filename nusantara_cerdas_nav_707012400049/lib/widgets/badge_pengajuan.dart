import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/pengajuan_cubit.dart';
import '../models/layanan.dart';

class BadgePengajuan extends StatelessWidget {
  const BadgePengajuan({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<PengajuanCubit, List<Layanan>, int>(
      selector: (daftarPengajuan) {
        return daftarPengajuan.length;
      },
      builder: (context, total) {
        final warna = Theme.of(context).colorScheme;

        return Stack(
          clipBehavior: Clip.none,
          children: [
            const Icon(Icons.people_alt_outlined),
            if (total > 0)
              Positioned(
                right: -9,
                top: -7,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  constraints: const BoxConstraints(
                    minWidth: 18,
                    minHeight: 18,
                  ),
                  decoration: BoxDecoration(
                    color: warna.error,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '$total',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: warna.onError,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}