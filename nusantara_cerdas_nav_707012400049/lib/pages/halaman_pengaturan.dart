import 'package:flutter/material.dart';

import '../widgets/theme_toggle_button.dart';

class HalamanPengaturan extends StatelessWidget {
  const HalamanPengaturan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan Kota'),
      ),
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.palette_outlined),
            title: Text('Tema Aplikasi'),
            subtitle: Text('Ubah tampilan terang dan gelap'),
            trailing: ThemeToggleButton(),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.notifications_outlined),
            title: Text('Notifikasi'),
            subtitle: Text('Pengaturan pemberitahuan aplikasi'),
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: Text('Bahasa'),
            subtitle: Text('Bahasa Indonesia'),
          ),
        ],
      ),
    );
  }
}