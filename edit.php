<?php
session_start();
if (!isset($_SESSION['admin'])) {
    header('Location: login.php');
    exit();
}
include 'koneksi.php';

// Ambil id penduduk dari URL
if (isset($_GET['id'])) {
    $id = $_GET['id'];

    // Query untuk mengambil data berdasarkan id
    $query = "SELECT * FROM data_penduduk WHERE id = '$id'";
    $result = mysqli_query($koneksi, $query);
    $row = mysqli_fetch_assoc($result);

    if (!$row) {
        echo "Data tidak ditemukan!";
        exit();
    }
} else {
    echo "ID tidak tersedia!";
    exit();
}

// Proses update data
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['submit_update'])) {
    // Ambil data dari form
    $dusun = mysqli_real_escape_string($koneksi, $_POST['dusun']);
    $rt = mysqli_real_escape_string($koneksi, $_POST['rt']);
    $nama_lengkap = mysqli_real_escape_string($koneksi, $_POST['nama_lengkap']);
    $ttl = mysqli_real_escape_string($koneksi, $_POST['ttl']);
    $jenis_kelamin = mysqli_real_escape_string($koneksi, $_POST['jenis_kelamin']);
    $agama = mysqli_real_escape_string($koneksi, $_POST['agama']);
    $pendidikan = mysqli_real_escape_string($koneksi, $_POST['pendidikan']);
    $pekerjaan = mysqli_real_escape_string($koneksi, $_POST['pekerjaan']);
    $status_perkawinan = mysqli_real_escape_string($koneksi, $_POST['status_perkawinan']);

    // Query untuk update data
    $query = "UPDATE data_penduduk SET dusun = '$dusun', rt = '$rt', nama_lengkap = '$nama_lengkap', ttl = '$ttl', jenis_kelamin = '$jenis_kelamin', agama = '$agama', pendidikan = '$pendidikan', pekerjaan = '$pekerjaan', status_perkawinan = '$status_perkawinan' WHERE id = '$id'";

    // Eksekusi query
    if (mysqli_query($koneksi, $query)) {
        echo "<script>alert('Data berhasil diupdate!');</script>";
        header('Location: penduduk.php');
        exit();
    } else {
        echo "Kesalahan: " . mysqli_error($koneksi);
    }
}

?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Data Penduduk</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2>Edit Data Penduduk</h2>

        <form method="POST" action="edit.php?id=<?php echo $row['id']; ?>">
            <div class="mb-3">
                <label for="dusun" class="form-label">Dusun</label>
                <input type="text" class="form-control" id="dusun" name="dusun" value="<?php echo htmlspecialchars($row['dusun']); ?>" required>
            </div>
            <div class="mb-3">
                <label for="rt" class="form-label">RT</label>
                <input type="text" class="form-control" id="rt" name="rt" value="<?php echo htmlspecialchars($row['rt']); ?>" required>
            </div>
            <div class="mb-3">
                <label for="nama_lengkap" class="form-label">Nama Lengkap</label>
                <input type="text" class="form-control" id="nama_lengkap" name="nama_lengkap" value="<?php echo htmlspecialchars($row['nama_lengkap']); ?>" required>
            </div>
            <div class="mb-3">
                <label for="ttl" class="form-label">Tempat Tanggal Lahir</label>
                <input type="text" class="form-control" id="ttl" name="ttl" value="<?php echo htmlspecialchars($row['ttl']); ?>" required>
            </div>
            <div class="mb-3">
                <label for="jenis_kelamin" class="form-label">Jenis Kelamin</label>
                <select class="form-control" id="jenis_kelamin" name="jenis_kelamin" required>
                    <option value="L" <?php echo ($row['jenis_kelamin'] === 'L') ? 'selected' : ''; ?>>Laki-Laki</option>
                    <option value="P" <?php echo ($row['jenis_kelamin'] === 'P') ? 'selected' : ''; ?>>Perempuan</option>
                </select>
            </div>
            <div class="mb-3">
                <label for="agama" class="form-label">Agama</label>
                <input type="text" class="form-control" id="agama" name="agama" value="<?php echo htmlspecialchars($row['agama']); ?>" required>
            </div>
            <div class="mb-3">
                <label for="pendidikan" class="form-label">Pendidikan</label>
                <input type="text" class="form-control" id="pendidikan" name="pendidikan" value="<?php echo htmlspecialchars($row['pendidikan']); ?>" required>
            </div>
            <div class="mb-3">
                <label for="pekerjaan" class="form-label">Pekerjaan</label>
                <input type="text" class="form-control" id="pekerjaan" name="pekerjaan" value="<?php echo htmlspecialchars($row['pekerjaan']); ?>" required>
            </div>
            <div class="mb-3">
                <label for="status_perkawinan" class="form-label">Status Perkawinan</label>
                <select class="form-control" id="status_perkawinan" name="status_perkawinan" required>
                    <option value="Belum Menikah" <?php echo ($row['status_perkawinan'] === 'Belum Menikah') ? 'selected' : ''; ?>>Belum Menikah</option>
                    <option value="Menikah" <?php echo ($row['status_perkawinan'] === 'Menikah') ? 'selected' : ''; ?>>Menikah</option>
                    <option value="Janda/Duda" <?php echo ($row['status_perkawinan'] === 'Janda/Duda') ? 'selected' : ''; ?>>Janda/Duda</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary" name="submit_update">Update Data</button>
            <a href="penduduk.php" class="btn btn-secondary">Batal</a>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
