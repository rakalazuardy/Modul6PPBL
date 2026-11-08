import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/favorit_cubit.dart';
import '../models/layanan.dart';

class KartuLayanan extends StatelessWidget {
  final Layanan layanan;
  final VoidCallback onTap;

  const KartuLayanan({
    super.key,
    required this.layanan,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        leading: CircleAvatar(
          backgroundColor: theme.colorScheme.primaryContainer,
          child: Icon(
            Icons.miscellaneous_services,
            color: theme.colorScheme.onPrimaryContainer,
          ),
        ),
        title: Text(
          layanan.nama,
          style: theme.textTheme.titleMedium,
        ),
        subtitle: Text(
          layanan.dinas,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            BlocBuilder<FavoritCubit, Set<String>>(
              builder: (context, daftarFavorit) {
                final isFavorit =
                    daftarFavorit.contains(layanan.nama);

                return IconButton(
                  tooltip: isFavorit
                      ? 'Hapus dari favorit'
                      : 'Tambahkan ke favorit',
                  onPressed: () {
                    context
                        .read<FavoritCubit>()
                        .toggleFavorit(layanan.nama);
                  },
                  icon: Icon(
                    isFavorit ? Icons.star : Icons.star_border,
                    color: isFavorit
                        ? theme.colorScheme.primary
                        : theme.colorScheme.onSurfaceVariant,
                  ),
                );
              },
            ),
            const Icon(Icons.chevron_right),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}