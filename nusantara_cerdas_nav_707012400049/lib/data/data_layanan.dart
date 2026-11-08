import '../models/layanan.dart';

class DataLayanan {
  static const List<Layanan> semuaLayanan = [
    // KATEGORI PERIZINAN
    Layanan(
      id: 'P001',
      nama: 'Perizinan Usaha',
      kategori: 'Perizinan',
      dinas: 'Dinas Penanaman Modal dan PTSP',
      jam: 'Senin - Jumat, 08.00 - 15.00',
      keterangan:
          'Layanan pengajuan izin usaha bagi masyarakat '
          'yang ingin mendirikan atau mengembangkan usaha.',
    ),
    Layanan(
      id: 'P002',
      nama: 'Izin Mendirikan Bangunan',
      kategori: 'Perizinan',
      dinas: 'Dinas Pekerjaan Umum',
      jam: 'Senin - Jumat, 08.00 - 15.00',
      keterangan:
          'Layanan pengajuan persetujuan bangunan gedung '
          'untuk kebutuhan pembangunan masyarakat.',
    ),
    Layanan(
      id: 'P003',
      nama: 'Surat Keterangan Domisili',
      kategori: 'Perizinan',
      dinas: 'Dinas Kependudukan dan Pencatatan Sipil',
      jam: 'Senin - Jumat, 08.00 - 15.00',
      keterangan:
          'Layanan penerbitan surat keterangan domisili '
          'untuk kebutuhan administrasi warga.',
    ),

    // KATEGORI KESEHATAN
    Layanan(
      id: 'K001',
      nama: 'Pendaftaran Puskesmas',
      kategori: 'Kesehatan',
      dinas: 'Dinas Kesehatan',
      jam: 'Senin - Sabtu, 07.00 - 14.00',
      keterangan:
          'Layanan pendaftaran kunjungan kesehatan '
          'masyarakat ke fasilitas puskesmas.',
    ),
    Layanan(
      id: 'K002',
      nama: 'Konsultasi Kesehatan',
      kategori: 'Kesehatan',
      dinas: 'Dinas Kesehatan',
      jam: 'Senin - Jumat, 08.00 - 14.00',
      keterangan:
          'Layanan konsultasi kesehatan untuk membantu '
          'masyarakat memperoleh informasi medis awal.',
    ),
    Layanan(
      id: 'K003',
      nama: 'Layanan Ambulans',
      kategori: 'Kesehatan',
      dinas: 'Dinas Kesehatan',
      jam: 'Setiap hari, 24 jam',
      keterangan:
          'Layanan bantuan transportasi medis darurat '
          'bagi masyarakat yang membutuhkan.',
    ),

    // KATEGORI TRANSPORTASI
    Layanan(
      id: 'T001',
      nama: 'Pengaduan Jalan Rusak',
      kategori: 'Transportasi',
      dinas: 'Dinas Perhubungan',
      jam: 'Senin - Jumat, 08.00 - 15.00',
      keterangan:
          'Layanan pelaporan kondisi jalan rusak '
          'yang mengganggu aktivitas masyarakat.',
    ),
    Layanan(
      id: 'T002',
      nama: 'Informasi Transportasi Umum',
      kategori: 'Transportasi',
      dinas: 'Dinas Perhubungan',
      jam: 'Senin - Jumat, 08.00 - 16.00',
      keterangan:
          'Layanan informasi rute, jadwal, dan fasilitas '
          'transportasi umum di wilayah kota.',
    ),
    Layanan(
      id: 'T003',
      nama: 'Pengaduan Kemacetan',
      kategori: 'Transportasi',
      dinas: 'Dinas Perhubungan',
      jam: 'Setiap hari, 24 jam',
      keterangan:
          'Layanan pelaporan kemacetan dan gangguan '
          'lalu lintas di wilayah kota.',
    ),
  ];

  static List<Layanan> berdasarkanKategori(String kategori) {
    return semuaLayanan
        .where((layanan) => layanan.kategori == kategori)
        .toList();
  }

  static Layanan? berdasarkanId(String id) {
    try {
      return semuaLayanan.firstWhere(
        (layanan) => layanan.id == id,
      );
    } catch (_) {
      return null;
    }
  }
}