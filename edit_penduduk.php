<?php
session_start();
if (!isset($_SESSION['admin'])) {
    header('Location: login.php');
    exit();
}

include 'koneksi.php';

// Ambil ID penduduk dari parameter URL
if (!isset($_GET['id']) || empty($_GET['id'])) {
    die("ID Penduduk tidak ditemukan!");
}

$id = $_GET['id'];
$query = "SELECT * FROM penduduk WHERE id = '$id'";
$result = mysqli_query($koneksi, $query);
$penduduk = mysqli_fetch_assoc($result);

if (!$penduduk) {
    die("Data penduduk tidak ditemukan!");
}

// Proses update data jika form dikirim
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nik = $_POST['nik'];
    $nama = $_POST['nama'];
    $jenis_kelamin = $_POST['jenis_kelamin'];
    $dusun = $_POST['dusun'];
    $rt = $_POST['rt'];
    $alamat = $_POST['alamat'];
    $usia = $_POST['usia'];

    $updateQuery = "UPDATE penduduk SET 
        nik='$nik', 
        nama='$nama', 
        jenis_kelamin='$jenis_kelamin', 
        dusun='$dusun', 
        rt='$rt', 
        alamat='$alamat', 
        usia='$usia' 
        WHERE id='$id'";

    if (mysqli_query($koneksi, $updateQuery)) {
        echo "<script>alert('Data berhasil diperbarui!'); window.location='penduduk.php';</script>";
    } else {
        echo "<script>alert('Gagal memperbarui data!');</script>";
    }
}

?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Penduduk - Administrasi Kependudukan</title>
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
                <p><?php echo htmlspecialchars($_SESSION['admin']); ?></p>
            </div>
            <ul class="list-unstyled components">
                <li><a href="index.php"><i class="fa fa-home"></i> Home</a></li>
                <li><a href="penduduk.php"><i class="fa fa-users"></i> Kependudukan</a></li>
                <li><a href="#"><i class="fa fa-chart-bar"></i> Statistik</a></li>
                <li><a href="#"><i class="fa fa-file-alt"></i> Layanan Surat</a></li>
                <li><a href="#"><i class="fa fa-cogs"></i> Pengaturan</a></li>
                <li><a href="logout.php" class="text-danger"><i class="fa fa-sign-out-alt"></i> Logout</a></li>
            </ul>
        </nav>

        <!-- Main Content -->
        <div id="content">
            <nav class="navbar navbar-expand-lg navbar-light bg-light px-4">
                <h3>Edit Data Penduduk</h3>
            </nav>

            <div class="container mt-4">
                <div class="card">
                    <div class="card-header bg-light">
                        <h5 class="mb-0"><i class="fa fa-edit"></i> Form Edit Penduduk</h5>
                    </div>
                    <div class="card-body">
                        <form action="" method="POST">
                            <div class="mb-3">
                                <label class="form-label">NIK</label>
                                <input type="text" class="form-control" name="nik" value="<?php echo htmlspecialchars($penduduk['nik']); ?>" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Nama</label>
                                <input type="text" class="form-control" name="nama" value="<?php echo htmlspecialchars($penduduk['nama']); ?>" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Jenis Kelamin</label>
                                <select class="form-control" name="jenis_kelamin" required>
                                    <option value="Laki-laki" <?php if ($penduduk['jenis_kelamin'] == "Laki-laki") echo "selected"; ?>>Laki-laki</option>
                                    <option value="Perempuan" <?php if ($penduduk['jenis_kelamin'] == "Perempuan") echo "selected"; ?>>Perempuan</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Dusun</label>
                                <input type="text" class="form-control" name="dusun" value="<?php echo htmlspecialchars($penduduk['dusun']); ?>" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">RT</label>
                                <input type="text" class="form-control" name="rt" value="<?php echo htmlspecialchars($penduduk['rt']); ?>" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Alamat</label>
                                <input type="text" class="form-control" name="alamat" value="<?php echo htmlspecialchars($penduduk['alamat']); ?>" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Usia</label>
                                <input type="number" class="form-control" name="usia" value="<?php echo htmlspecialchars($penduduk['usia']); ?>" required>
                            </div>
                            <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i> Simpan</button>
                            <a href="penduduk.php" class="btn btn-secondary"><i class="fa fa-arrow-left"></i> Kembali</a>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
