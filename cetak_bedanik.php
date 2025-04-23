<?php
include 'koneksi.php'; // Pastikan koneksi database sudah tersedia

// Ambil ID dari URL
$id = isset($_GET['id']) ? intval($_GET['id']) : 0;

// Ambil data dari database
$query = "SELECT * FROM beda_nik WHERE id = ?";
$stmt = mysqli_prepare($conn, $query);
mysqli_stmt_bind_param($stmt, "i", $id);
mysqli_stmt_execute($stmt);
$result = mysqli_stmt_get_result($stmt);
$data = mysqli_fetch_assoc($result);
mysqli_stmt_close($stmt);

// Jika data tidak ditemukan
if (!$data) {
    echo "<script>alert('Data tidak ditemukan!'); window.close();</script>";
    exit();
}
?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cetak Surat Keterangan Beda NIK</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
        }
        .header {
            text-align: center;
            font-size: 18px;
            font-weight: bold;
        }
        .content {
            margin-top: 20px;
            font-size: 16px;
        }
        .signature {
            margin-top: 50px;
            text-align: right;
        }
    </style>
</head>
<body>
    <div class="header">
        <p>PEMERINTAH KABUPATEN KUPANG</p>
        <p>KECAMATAN TAEBENU</p>
        <p>DESA BAUMATA</p>
        <p>Jalan Taebenu KM 13 Baumata</p>
        <hr>
        <p>SURAT KETERANGAN BEDA NIK</p>
        <p>Nomor: 474.5 / 001/DBM/2025</p>
    </div>
    <div class="content">
        <p>Yang bertanda tangan di bawah ini:</p>
        <p>Nama: <strong>Melkisedek Naben</strong></p>
        <p>Jabatan: <strong>Plt Kepala Desa Baumata</strong></p>
        <p>Dengan ini menerangkan bahwa:</p>
        <p>Nama: <strong><?php echo htmlspecialchars($data['nama']); ?></strong></p>
        <p>Jenis Kelamin: <strong><?php echo htmlspecialchars($data['jenis_kelamin']); ?></strong></p>
        <p>Umur: <strong><?php echo htmlspecialchars($data['umur']); ?></strong></p>
        <p>Agama: <strong><?php echo htmlspecialchars($data['agama']); ?></strong></p>
        <p>Pekerjaan: <strong><?php echo htmlspecialchars($data['pekerjaan']); ?></strong></p>
        <p>Alamat: <strong><?php echo htmlspecialchars($data['alamat']); ?></strong></p>
        <p>
            Benar adalah warga Desa Baumata, Kecamatan Taebenu dan berdasarkan yang tercetak dalam dokumen E-KTP,
            Kartu Keluarga adalah <strong><?php echo htmlspecialchars($data['nama']); ?></strong> (NIK: <strong><?php echo htmlspecialchars($data['nik_benar']); ?></strong>)
            sedangkan yang tercantum dalam undangan PKH adalah <strong><?php echo htmlspecialchars($data['nama']); ?></strong> (NIK: <strong><?php echo htmlspecialchars($data['nik_salah']); ?></strong>)
            yang salah. Yang benar adalah yang tercantum dalam KTP, dan kedua nama tersebut merupakan orang yang sama.
        </p>
        <p>Demikian surat keterangan ini dibuat untuk dipergunakan di mana perlu.</p>
    </div>
    <div class="signature">
        <p>Baumata, <?php echo date('d F Y'); ?></p>
        <p>An. Kepala Desa Baumata</p>
        <p>Plt. Sekretaris Desa</p>
        <br><br>
        <p><strong>Melkisedek Naben</strong></p>
    </div>
    <script>
        window.print(); // Otomatis membuka dialog cetak
    </script>
</body>
</html>
