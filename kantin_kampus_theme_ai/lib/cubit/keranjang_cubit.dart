import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/produk.dart';

class KeranjangCubit extends Cubit<List<ItemKeranjang>> {
  KeranjangCubit() : super([]);

  void tambahProduk(Produk produk) {
    final index = state.indexWhere(
      (item) => item.produk.id == produk.id,
    );

    if (index != -1) {
      final daftarBaru = List<ItemKeranjang>.from(state);

      daftarBaru[index] = daftarBaru[index].copyWith(
        jumlah: daftarBaru[index].jumlah + 1,
      );

      emit(daftarBaru);
    } else {
      emit([
        ...state,
        ItemKeranjang(produk: produk, jumlah: 1),
      ]);
    }
  }

  void kurangiProduk(String produkId) {
    final index = state.indexWhere(
      (item) => item.produk.id == produkId,
    );

    if (index == -1) return;

    final daftarBaru = List<ItemKeranjang>.from(state);
    final item = daftarBaru[index];

    if (item.jumlah > 1) {
      daftarBaru[index] = item.copyWith(
        jumlah: item.jumlah - 1,
      );
    } else {
      daftarBaru.removeAt(index);
    }

    emit(daftarBaru);
  }

  void hapusSemua() {
    emit([]);
  }

  int get totalItem {
    return state.fold(
      0,
      (total, item) => total + item.jumlah,
    );
  }

  int get totalHarga {
    return state.fold(
      0,
      (total, item) => total + item.subtotal,
    );
  }
}