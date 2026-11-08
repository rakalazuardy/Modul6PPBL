import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/theme_cubit.dart';

class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, mode) {
        final isDark = mode == ThemeMode.dark;

        return IconButton(
          tooltip: isDark ? 'Mode Terang' : 'Mode Gelap',
          onPressed: () {
            context.read<ThemeCubit>().toggle();
          },
          icon: Icon(
            isDark ? Icons.light_mode : Icons.dark_mode,
          ),
        );
      },
    );
  }
}