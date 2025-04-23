<?php
include 'koneksi.php'; // Pastikan koneksi ke database

if (!isset($_GET['id'])) {
    echo "<script>alert('ID tidak ditemukan!'); window.location.href='index.php';</script>";
    exit();
}

$id = $_GET['id'];
$query = "SELECT * FROM usaha WHERE id = '$id'";
$result = mysqli_query($conn, $query);

if (mysqli_num_rows($result) == 0) {
    echo "<script>alert('Data tidak ditemukan!'); window.location.href='index.php';</script>";
    exit();
}

$data = mysqli_fetch_assoc($result);
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Surat Keterangan Usaha</title>
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
        }

        .header {
            text-align: center;
            margin-bottom: 20px;
        }

        .header img {
            width: 80px;
            height: auto;
            position: absolute;
            left: 50px;
        }

        .header h3, .header p {
            margin: 0;
        }

        .content {
            text-align: justify;
            margin-top: 20px;
        }

        .signature {
            text-align: right;
            margin-top: 50px;
        }

        .signature .left {
            float: left;
            text-align: left;
        }

        .signature .right {
            float: right;
            text-align: center;
        }

        .clearfix {
            clear: both;
        }

        .footer {
            text-align: left;
            margin-top: 50px;
        }

        button {
            margin-top: 20px;
            padding: 10px 15px;
            font-size: 16px;
            cursor: pointer;
        }

        hr {
            border: 1px solid black;
        }
    </style>
</head>
<body>
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
        <h2>SURAT KETERANGAN USAHA</h2>

        <!-- Isi Surat -->
        <div class="content">
            <p>Yang bertanda tangan di bawah ini:</p>
            <p><strong>Nama:</strong> Melkisedek Naben</p>
            <p><strong>Jabatan:</strong> Plt Sekretaris Desa Baumata</p>

            <p>Dengan ini menerangkan bahwa:</p>
            <p><strong>Nama:</strong> <?php echo $data['nama']; ?></p>
            <p><strong>Umur:</strong> <?php echo $data['umur']; ?> Tahun</p>
            <p><strong>Pekerjaan:</strong> <?php echo $data['pekerjaan']; ?></p>
            <p><strong>Alamat:</strong> <?php echo $data['alamat']; ?></p>

            <p>Dijelaskan bahwa yang bersangkutan adalah warga Desa Baumata, Kecamatan Taebenu, yang beralamat seperti tersebut di atas. Dan yang bersangkutan mempunyai usaha <strong><?php echo $data['nama_usaha']; ?></strong>.</p>

            <p>Demikian Surat Keterangan ini kami buat untuk dipergunakan sebagaimana mestinya.</p>
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
