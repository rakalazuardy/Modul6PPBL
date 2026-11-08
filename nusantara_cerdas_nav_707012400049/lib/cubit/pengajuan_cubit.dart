import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/layanan.dart';

class PengajuanCubit extends Cubit<List<Layanan>> {
  PengajuanCubit() : super([]);

  void tambahPengajuan(Layanan layanan) {
    final sudahAda = state.any(
      (item) => item.id == layanan.id,
    );

    if (sudahAda) return;

    emit([
      ...state,
      layanan,
    ]);
  }

  void hapusPengajuan(String id) {
    final daftarBaru = state
        .where((layanan) => layanan.id != id)
        .toList();

    emit(daftarBaru);
  }

  void kosongkanPengajuan() {
    emit([]);
  }

  int get totalPengajuan => state.length;

  bool sudahDiajukan(String id) {
    return state.any((layanan) => layanan.id == id);
  }
}