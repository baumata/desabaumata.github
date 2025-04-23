<?php
session_start();
if (!isset($_SESSION['admin'])) {
    header('Location: login.php');
    exit();
}

include 'koneksi.php'; // Pastikan koneksi tersedia

// Query untuk mengambil semua jenis surat tercetak
$query = "
    SELECT id, nama, 'Surat Domisili' AS jenis_surat, tanggal AS tanggal_cetak FROM surat_domisili
    UNION
    SELECT id, nama, 'Surat Beda Nama' AS jenis_surat, tanggal AS tanggal_cetak FROM beda_nama
    UNION
    SELECT id, nama, 'Surat Beda NIK' AS jenis_surat, tanggal AS tanggal_cetak FROM beda_nik
    UNION
    SELECT id, nama, 'Surat Kematian' AS jenis_surat, tanggal_surat AS tanggal_cetak FROM kematian
    UNION
    SELECT id, nama, 'Surat SKTM' AS jenis_surat, tanggal_surat AS tanggal_cetak FROM sktm
    UNION
    SELECT id, nama, 'Surat Usaha' AS jenis_surat, tanggal AS tanggal_cetak FROM usaha
    ORDER BY tanggal_cetak DESC";



$result = mysqli_query($conn, $query);
if (!$result) {
    die("Query error: " . mysqli_error($conn));
}
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Surat Tercetak</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
    font-family: Arial, sans-serif;
    background-color: #add6b6;
    margin: 0;
    padding: 0;
}

.container {
    background: #ffffff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    max-width: 800px;
    margin: 50px auto;
}

h2 {
    text-align: center;
    color: #333;
    margin-bottom: 20px;
    font-family: 'Poppins', sans-serif;
    font-size: 28px;
    font-weight: bold;
    letter-spacing: 1px;
}

.table {
    background: #ffffff;
}

.table th {
    background: #007bff;
    color: white;
    text-align: center;
}

.table td, .table th {
    text-align: center;
    vertical-align: middle;
}

.btn-primary {
    display: block;
    width: fit-content;
    margin: 20px auto;
    background: #007bff;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    transition: background 0.3s;
}

.btn-primary:hover {
    background: #0056b3;
}
</style>
</head>
<body>
    <div class="container mt-5">
        <h2 class="mb-4">Daftar Surat yang Telah Tercetak</h2>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Nama Pemohon</th>
                    <th>Jenis Surat</th>
                    <th>Tanggal Cetak</th>
                </tr>
            </thead>
            <tbody>
                <?php $no = 1; while ($row = mysqli_fetch_assoc($result)) : ?>
                <tr>
                    <td><?php echo $no++; ?></td>
                    <td><?php echo htmlspecialchars($row['nama']); ?></td>
                    <td><?php echo htmlspecialchars($row['jenis_surat']); ?></td>
                    <td><?php echo htmlspecialchars($row['tanggal_cetak']); ?></td>

                </tr>
                <?php endwhile; ?>
            </tbody>
        </table>
        <a href="index.php" class="btn btn-primary">Kembali ke Dashboard</a>
    </div>
</body>
</html>
