<?php
include 'koneksi.php'; // Pastikan koneksi ke database

if (isset($_GET['id'])) {
    $id = $_GET['id'];
    $query = "SELECT * FROM sktm WHERE id = $id";
    $result = mysqli_query($conn, $query);
    $data = mysqli_fetch_assoc($result);

    if (!$data) {
        die("Data tidak ditemukan");
    }
} else {
    die("ID tidak valid");
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Cetak Surat Keterangan Tidak Mampu</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
        }
        .header {
            text-align: center;
            font-weight: bold;
        }
        .header img {
            width: 130px;
            height: auto;
            position: absolute;
            left: 5px;
        }
        .content {
            margin-top: 20px;
        }
        .signature {
            margin-top: 50px;
            text-align: right;
        }
    </style>
</head>
<body onload="window.print()">
    <div class="header">
    <img src="logo.png" alt="Logo Kabupaten Kupang">
        <h2>PEMERINTAHAN KABUPATEN KUPANG</h2>
        <h3>KECAMATAN TAEBENU</h3>
        <h3>DESA BAUMATA</h3>
        <p>Jln. TAEBENU KM 13 DESA BAUMATA</p>
        <hr>
        <h3>SURAT KETERANGAN TIDAK MAMPU</h3>
        <p>Nomor: 420/ 006/ SKTM / DBM / 2025</p>
    </div>

    <div class="content">
        <p>Yang bertanda tangan di bawah ini:</p>
        <p>Nama: <b>Melkisedek Naben</b></p>
        <p>Jabatan: <b>Plt Sekretaris Desa Baumata</b></p>
        <p>Dengan ini menerangkan bahwa:</p>
        <p>Nama: <b><?= $data['nama']; ?></b></p>
        <p>Umur: <b><?= $data['umur']; ?> tahun</b></p>
        <p>Jenis Kelamin: <b><?= $data['jenis_kelamin']; ?></b></p>
        <p>Pekerjaan: <b><?= $data['pekerjaan']; ?></b></p>
        <p>Agama: <b><?= $data['agama']; ?></b></p>
        <p>Alamat: <b><?= $data['alamat']; ?></b></p>
        <p>Maksud: <b><?= $data['maksud']; ?></b></p>
        <p>Berhubung yang bersangkutan orang tuanya tergolong masyarakat kurang mampu (Miskin).</p>
        <p>Demikian Surat Keterangan Tidak Mampu ini kami buat untuk dipergunakan sebagaimana mestinya.</p>
    </div>

    <div class="signature">
        <p>Baumata, <?= date('d F Y'); ?></p>
        <p>An. Kepala Desa Baumata</p>
        <p>Plt. Sekretaris Desa Baumata</p>
        <br><br>
        <p><b>MELKISEDEK NABEN</b></p>
    </div>
</body>
</html>