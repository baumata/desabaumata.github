<?php
include 'koneksi.php'; 

if (!isset($_GET['id'])) {
    echo "<script>alert('ID tidak ditemukan!'); window.location.href='index.php';</script>";
    exit();
}

$id = intval($_GET['id']);
$query = "SELECT * FROM beda_nama WHERE id = '$id'";
$result = mysqli_query($conn, $query);

if (mysqli_num_rows($result) == 0) {
    echo "<script>alert('Data tidak ditemukan!'); window.location.href='index.php';</script>";
    exit();
}

$data = mysqli_fetch_assoc($result);
$tanggal = date('d F Y');
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Surat Keterangan Beda Nama</title>
    <style>
        body {
            font-family: "Times New Roman", Times, serif;
            margin: 20px;
            color: black;
        }

        .container {
            width: 100%;
            text-align: center;
        }

        h2 {
            text-transform: uppercase;
            text-decoration: underline;
            font-size: 16px;
        }

        .header img {
            width: 60px;
            position: absolute;
            left: 30px;
            top: 20px;
        }

        .header {
            text-align: center;
            margin-bottom: 5px;
        }

        .content {
            text-align: justify;
            font-size: 14px;
        }

        .signature {
            margin-top: 20px;
            font-size: 14px;
        }

        .signature .right {
            float: right;
            text-align: center;
            display: inline-block;
        }

        .clearfix {
            clear: both;
        }

        hr {
            border: 0.5px solid black;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <img src="logo.png" alt="Logo Kabupaten Kupang">
            <h3>PEMERINTAH KABUPATEN KUPANG</h3>
            <h3>KECAMATAN TAEBENU</h3>
            <h3>DESA BAUMATA</h3>
            <p>Jalan Taebenu KM 13 Baumata</p>
            <hr>
        </div>

        <h2>SURAT KETERANGAN BEDA NAMA</h2>
        <p>Nomor: 474.5 / 001/DBM/2025</p>

        <div class="content">
            <p>Yang bertanda tangan di bawah ini:</p>
            <p><strong>Nama:</strong> Melkisedek Naben</p>
            <p><strong>Jabatan:</strong> Plt Kepala Desa Baumata</p>

            <p>Dengan ini menerangkan bahwa:</p>
            <p><strong>Nama:</strong> <?php echo $data['nama']; ?></p>
            <p><strong>Jenis Kelamin:</strong> <?php echo $data['jenis_kelamin']; ?></p>
            <p><strong>Umur:</strong> <?php echo $data['umur']; ?> Tahun</p>
            <p><strong>Agama:</strong> <?php echo $data['agama']; ?></p>
            <p><strong>Pekerjaan:</strong> <?php echo $data['pekerjaan']; ?></p>
            <p><strong>Alamat:</strong> <?php echo $data['alamat']; ?></p>

            <p>Berdasarkan dokumen resmi seperti E-KTP, Akta Nikah, SK Janda, dan Data Taspen, tercatat sebagai <strong><?php echo $data['nama_dokumen']; ?></strong>, namun dalam dokumen NPWP tercatat sebagai <strong><?php echo $data['nama_salah']; ?></strong>. Keduanya adalah orang yang sama sesuai dengan alamat di atas.</p>
            <p>Demikian surat ini dibuat untuk digunakan sebagaimana mestinya.</p>
        </div>

        <div class="signature">
            <div class="right">
                <p>Baumata, <?php echo $tanggal; ?></p>
                <p>An. Kepala Desa Baumata</p>
                <p>Plt Sekretaris Desa</p>
                <p><strong>Melkisedek Naben</strong></p>
            </div>
            <div class="clearfix"></div>
        </div>
    </div> 
</body>
</html>
