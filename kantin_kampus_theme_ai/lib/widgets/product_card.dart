import 'package:flutter/material.dart';
import '../models/produk.dart';
import 'primary_button.dart';

class ProductCard extends StatelessWidget {
  final Produk produk;
  final VoidCallback onTambah;

  const ProductCard({
    super.key,
    required this.produk,
    required this.onTambah,
  });

  String formatRupiah(int harga) {
    return 'Rp ${harga.toString().replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
      (match) => '${match[1]}.',
    )}';
  }

  @override
  Widget build(BuildContext context) {
    final warna = Theme.of(context).colorScheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: warna.primaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Icons.fastfood,
                size: 48,
                color: warna.onPrimaryContainer,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              produk.nama,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 4),
            Text(
              formatRupiah(produk.harga),
              style: TextStyle(
                color: warna.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            PrimaryButton(
              label: 'Tambah ke Keranjang',
              icon: Icons.add_shopping_cart,
              onPressed: onTambah,
            ),
          ],
        ),
      ),
    );
  }
}