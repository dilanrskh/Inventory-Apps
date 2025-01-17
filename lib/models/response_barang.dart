import 'dart:ffi';

class ResponseBarang {
    final String pesan;
    final bool sukses;
    final List<Barang>? barang;
    final Int? lastId;

    ResponseBarang({
        required this.pesan,
        required this.sukses,
        this.barang,
        this.lastId
    });

    factory ResponseBarang.fromJson(Map<String, dynamic> json) => ResponseBarang(
        pesan: json["pesan"],
        sukses: json["sukses"],
        barang: json["barang"] != null 
        ? List<Barang>.from(json["barang"].map((x) => Barang.fromJson(x))) : null,
        lastId: json['barang_id']
    );
}

class Barang {
    final String barangId;
    final String barangNama;
    final String barangJumlah;
    final String barangGambar;

    Barang({
        required this.barangId,
        required this.barangNama,
        required this.barangJumlah,
        required this.barangGambar,
    });

    factory Barang.fromJson(Map<String, dynamic> json) => Barang(
        barangId: json["barang_id"],
        barangNama: json["barang_nama"],
        barangJumlah: json["barang_jumlah"],
        barangGambar: json["barang_gambar"],
    );

}
