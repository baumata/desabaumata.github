<?php
session_start();
if (!isset($_SESSION['admin'])) {
    header('Location: login.php'); // Redirect jika belum login
    exit();
}

include 'koneksi.php'; // Pastikan koneksi ke database sudah tersedia

// Ambil semua data surat
$query = "SELECT * FROM surat ORDER BY tanggal_cetak DESC";
$result = mysqli_query($conn, $query);

// Update status surat menjadi 'tercetak'
$update_query = "UPDATE surat SET status = 'tercetak', tanggal_cetak = NOW() WHERE id = '$id'";
mysqli_query($conn, $update_query);

if (!$result) {
    die("Query error: " . mysqli_error($conn));
}
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Daftar Surat - Administrasi Kependudukan</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2 class="mb-4">Daftar Surat</h2>

        <table class="table table-bordered">
    <thead>
        <tr>
            <th>No</th>
            <th>Nama Pemohon</th>
            <th>Jenis Surat</th>
            <th>Status</th>
            <th>Aksi</th>
        </tr>
    </thead>
    <tbody>
        <?php 
        $no = 1;
        $query = "SELECT * FROM surat ORDER BY tanggal_cetak DESC";
        $result = mysqli_query($conn, $query);
        while ($row = mysqli_fetch_assoc($result)) : ?>
        <tr>
            <td><?php echo $no++; ?></td>
            <td><?php echo htmlspecialchars($row['nama_pemohon']); ?></td>
            <td><?php echo htmlspecialchars($row['jenis_surat']); ?></td>
            <td><?php echo htmlspecialchars($row['status']); ?></td>
            <td>
                <?php if ($row['status'] != 'tercetak') : ?>
                    <a href="cetak_surat.php?id=<?php echo $row['id']; ?>" class="btn btn-primary">Cetak</a>
                <?php else : ?>
                    <span class="badge bg-success">Sudah Dicetak</span>
                <?php endif; ?>
            </td>
        </tr>
        <?php endwhile; ?>
    </tbody>
</table>


        <a href="index.php" class="btn btn-secondary">Kembali ke Dashboard</a>
    </div>
</body>
</html>
