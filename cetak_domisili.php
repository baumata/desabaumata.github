<?php
include 'koneksi.php'; // Pastikan koneksi ke database

if (!isset($_GET['id'])) {
    echo "<script>alert('ID tidak ditemukan!'); window.location.href='form_domisili.php';</script>";
    exit;
}

$id = $_GET['id'];
$query = "SELECT * FROM surat_domisili WHERE id = '$id'";
$result = mysqli_query($conn, $query);
$data = mysqli_fetch_assoc($result);

if (!$data) {
    echo "<script>alert('Data tidak ditemukan!'); window.location.href='form_domisili.php';</script>";
    exit;
}

// ✅ Perbarui status surat menjadi "tercetak"
mysqli_query($conn, "UPDATE surat_domisili SET status='tercetak', tanggal_cetak=NOW() WHERE id='$id'");

?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Surat Keterangan Domisili</title>
    <style>
        body {
            font-family: "Times New Roman", Times, serif;
            margin: 50px;
            padding: 0;
            background: white;
            color: black;
        }

        .container {
            width: 100%;
            margin: auto;
            padding: 20px;
            text-align: center;
        }

        h2 {
            text-transform: uppercase;
            text-decoration: underline;
            font-size: 18px;
        }

        header {
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            margin-bottom: 20px;
            position: relative;
        }

        .header img {
            width: 80px;
            height: auto;
            position: absolute;
            left: 40px;
            top: 60px;
        }

        .header h3, .header p {
            margin: 0;
            font-size: 16px;
        }

        .nomor-surat {
            margin-top: 20px;
            text-align: center;
            font-weight: bold;
            font-size: 16px;
        }

        .content {
            text-align: justify;
            margin-top: 20px;
            line-height: 1.6;
            font-size: 16px;
        }

        .data-section {
            margin-left: 40px;
            font-size: 14px;
        }

        .signature {
            margin-top: 50px;
            font-size: 14px;
            font-weight: bold;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .signature .left {
            text-align: left;
        }

        .signature .right {
            text-align: right;
            margin-right: 0;
            width: 100%;
        }

        .clearfix {
            clear: both;
        }

        hr {
            border: 1px solid black;
        }
    </style>
</head>
<body onload="window.print(); setTimeout(() => window.close(), 2000);">
    <div class="container">
        <!-- Header Surat -->
        <div class="header">
            <img src="logo.png" alt="Logo Kabupaten Kupang">
            <h3>PEMERINTAH KABUPATEN KUPANG</h3>
            <h3>KECAMATAN TAEBENU</h3>
            <h3>DESA BAUMATA</h3>
            <p>Jalan Taebenu KM 13 Baumata</p>
            <hr>
        </div>

        <!-- Judul Surat -->
        <h2>SURAT KETERANGAN DOMISILI</h2>
        <div class="nomor-surat">
            Nomor: 474.5 /007 /SKP/DBM/2025
        </div>

        <!-- Isi Surat -->
        <div class="content">
            <p>Yang bertanda tangan di bawah ini:</p>
            <div class="data-section">
                <p>Nama: <strong>Melkisedek Naben</strong></p>
                <p>Jabatan: <strong>Plt Sekretaris Desa Baumata</strong></p>
            </div>

            <p>Dengan ini menerangkan bahwa:</p>
            <div class="data-section">
                <p>Nama: <strong><?php echo htmlspecialchars($data['nama']); ?></strong></p>
                <p>Jenis Kelamin: <strong><?php echo htmlspecialchars($data['jenis_kelamin']); ?></strong></p>
                <p>Tempat, Tanggal Lahir / Umur: <strong><?php echo htmlspecialchars($data['ttl_umur']); ?></strong></p>
                <p>Agama: <strong><?php echo htmlspecialchars($data['agama']); ?></strong></p>
                <p>Pekerjaan: <strong><?php echo htmlspecialchars($data['pekerjaan']); ?></strong></p>
                <p>Alamat: <strong><?php echo htmlspecialchars($data['alamat']); ?></strong></p>
            </div>

            <p>Benar bahwa yang bersangkutan adalah warga Desa Baumata, Kecamatan Taebenu dan berdomisili pada alamat tersebut di atas.</p>
            <p>Demikian Surat Keterangan Domisili ini dibuat untuk dipergunakan sebagaimana mestinya.</p>
        </div>

        <!-- Tanda Tangan -->
        <div class="signature">
            <div class="left">
                <p>Paraf Hirarki:</p>
                <p>Sekretaris</p>
                <p>Pembuat</p>
            </div>

            <div class="right">
                <p>Baumata, <?php echo date('d F Y'); ?></p>
                <p>An. Kepala Desa Baumata</p>
                <p>Plt Sekretaris Desa</p>
                <br><br>
                <p><strong>Melkisedek Naben</strong></p>
            </div>
            <div class="clearfix"></div>
        </div>

    </div>
</body>
</html>
