import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritCubit extends Cubit<Set<String>> {
  FavoritCubit() : super(<String>{});

  void tandai(String namaLayanan) {
    final favoritBaru = Set<String>.from(state);

    favoritBaru.add(namaLayanan);

    emit(favoritBaru);
  }

  void batalTandai(String namaLayanan) {
    final favoritBaru = Set<String>.from(state);

    favoritBaru.remove(namaLayanan);

    emit(favoritBaru);
  }

  bool isFavorit(String namaLayanan) {
    return state.contains(namaLayanan);
  }

  void toggleFavorit(String namaLayanan) {
    if (isFavorit(namaLayanan)) {
      batalTandai(namaLayanan);
    } else {
      tandai(namaLayanan);
    }
  }
}