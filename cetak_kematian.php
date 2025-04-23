<?php
include 'koneksi.php';

if (!isset($_GET['id'])) {
    die("ID tidak ditemukan.");
}

$id = $_GET['id'];
$query = "SELECT * FROM kematian WHERE id = '$id'";
$result = mysqli_query($conn, $query);

if (mysqli_num_rows($result) == 0) {
    die("Data tidak ditemukan.");
}

$data = mysqli_fetch_assoc($result);
?>

<!DOCTYPE html>
<html>
<head>
    <title>Surat Keterangan Kematian</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
            padding: 20px;
            border: 2px solid black;
            width: 800px;
        }
        .header {
            text-align: center;
            font-size: 18px;
            font-weight: bold;
        }
        .header img {
            width: 80px;
            height: auto;
            position: absolute;
            left: 50px;
        }
        .content {
            margin-top: 20px;
            font-size: 16px;
        }
        .signature {
            text-align: right;
            margin-top: 50px;
        }
    </style>
</head>
<body>
    <div class="header">
    <img src="logo.png" alt="Logo Kabupaten Kupang">
        PEMERINTAH KABUPATEN KUPANG<br>
        KECAMATAN TAEBENU<br>
        KEPALA DESA BAUMATA<br>
        Jalan Taebenu KM 13 Baumata
    </div>
    <hr>
    <div class="header" style="margin-top: 20px;">
        <h2>SURAT KETERANGAN KEMATIAN</h2>
        Nomor : 470 / 02 /SKK/DBM/2025
    </div>
    <div class="content">
        Yang bertanda tangan di bawah ini Kepala Desa Baumata, dengan ini menerangkan :<br><br>
        Nama : <b><?php echo $data['nama']; ?></b><br>
        Jenis Kelamin : <b><?php echo $data['jenis_kelamin']; ?></b><br>
        TTL / Umur : <b><?php echo $data['ttl'] . " / " . $data['umur']; ?></b><br>
        Agama : <b><?php echo $data['agama']; ?></b><br>
        Pekerjaan : <b><?php echo $data['pekerjaan']; ?></b><br>
        Alamat : <b><?php echo $data['alamat']; ?></b><br><br>
        Telah meninggal pada:<br>
        Pada Hari/Tgl : <b><?php echo $data['hari_tgl']; ?></b><br>
        Di : <b><?php echo $data['tempat']; ?></b><br>
        Karena : <b><?php echo $data['penyebab']; ?></b><br><br>
        Demikian Surat Keterangan Kematian ini kami buat untuk dipergunakan dimana perlu.
    </div>
    <div class="signature">
        Baumata, <?php echo date("d F Y"); ?><br>
        Kepala Desa Baumata<br><br><br><br>
        <b>(........................................)</b>
    </div>
</body>
</html>
