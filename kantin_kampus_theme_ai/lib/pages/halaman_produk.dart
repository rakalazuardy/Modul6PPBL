import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/keranjang_cubit.dart';
import '../models/produk.dart';
import '../widgets/product_card.dart';
import '../widgets/theme_toggle_button.dart';

class HalamanProduk extends StatelessWidget {
  HalamanProduk({super.key});

  final List<Produk> daftarProduk = const [
    Produk(
      id: '1',
      nama: 'Nasi Goreng',
      harga: 15000,
    ),
    Produk(
      id: '2',
      nama: 'Es Teh Manis',
      harga: 5000,
    ),
    Produk(
      id: '3',
      nama: 'Ayam Geprek',
      harga: 18000,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kantin Kampus'),
        actions: const [
          ThemeToggleButton(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Menu Kantin',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 4),
            Text(
              'Pilih makanan dan minuman favoritmu.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                itemCount: daftarProduk.length,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.68,
                ),
                itemBuilder: (context, index) {
                  final produk = daftarProduk[index];

                  return ProductCard(
                    produk: produk,
                    onTambah: () {
                      context
                          .read<KeranjangCubit>()
                          .tambahProduk(produk);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            '${produk.nama} ditambahkan ke keranjang',
                          ),
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}