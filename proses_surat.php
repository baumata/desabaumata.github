<?php
session_start();
if (!isset($_SESSION['admin'])) {
    header('Location: login.php'); // Redirect jika belum login
    exit();
}

include 'koneksi.php';

// Ambil data admin yang sedang login
$username = $_SESSION['admin'];
$query = "SELECT * FROM admin WHERE username='$username'";
$result = mysqli_query($koneksi, $query);
$user = mysqli_fetch_assoc($result);

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id_surat = intval($_POST['id_surat']);
    $nomor_surat = htmlspecialchars($_POST['nomor_surat']);
    $lampiran = htmlspecialchars($_POST['lampiran']);
    $perihal = htmlspecialchars($_POST['perihal']);
    $kepada = htmlspecialchars($_POST['kepada']);
    $tanggal_acara = htmlspecialchars($_POST['tanggal_acara']);
    $waktu = htmlspecialchars($_POST['waktu']);
    $tempat = htmlspecialchars($_POST['tempat']);
    $isi_surat = htmlspecialchars($_POST['isi_surat']);

    // Simpan ke database
    $query_insert = "INSERT INTO surat_keluar (id_surat, nomor_surat, lampiran, perihal, kepada, tanggal_acara, waktu, tempat, isi_surat) 
                     VALUES ('$id_surat', '$nomor_surat', '$lampiran', '$perihal', '$kepada', '$tanggal_acara', '$waktu', '$tempat', '$isi_surat')";

    if (mysqli_query($koneksi, $query_insert)) {
        $id_terakhir = mysqli_insert_id($koneksi);
        header("Location: cetak_surat.php?id=$id_terakhir");
        exit();
    } else {
        echo "<script>alert('Terjadi kesalahan saat menyimpan surat!'); window.location='layanan_surat.php';</script>";
        exit();
    }
}

?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Proses Surat - Administrasi Kependudukan</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body>
    <div class="wrapper">
        <!-- Sidebar -->
        <nav id="sidebar">
            <div class="sidebar-header">
                <h3><i class="fa fa-home"></i> Baumata Pusat</h3>
                <p><?php echo htmlspecialchars($user['username']); ?></p>
            </div>
            <ul class="list-unstyled components">
                <li><a href="index.php"><i class="fa fa-home"></i> Home</a></li>
                <li><a href="penduduk.php"><i class="fa fa-users"></i> Kependudukan</a></li>
                <li><a href="statistik.php"><i class="fa fa-chart-bar"></i> Statistik</a></li>
                <li><a href="layanan_surat.php" class="active"><i class="fa fa-file-alt"></i> Layanan Surat</a></li>
                <li><a href="#"><i class="fa fa-cogs"></i> Pengaturan</a></li>
                <li><a href="logout.php" class="text-danger"><i class="fa fa-sign-out-alt"></i> Logout</a></li>
            </ul>
        </nav>

        <!-- Main Content -->
        <div id="content">
            <nav class="navbar navbar-expand-lg navbar-light bg-light px-4">
                <h3>Proses Surat Keterangan Tidak Mampu</h3>
            </nav>

            <div class="container mt-4">
                <div class="alert alert-success">
                    <h4>Surat berhasil diproses!</h4>
                    <p>Silakan klik tombol di bawah untuk mencetak surat.</p>
                    <a href="cetak_surat.php?id=<?php echo $id_terakhir; ?>" class="btn btn-primary"><i class="fa fa-print"></i> Cetak Surat</a>
                    <a href="layanan_surat.php" class="btn btn-secondary"><i class="fa fa-arrow-left"></i> Kembali ke Layanan Surat</a>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
