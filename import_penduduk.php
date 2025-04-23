<?php
session_start();
if (!isset($_SESSION['admin'])) {
    header('Location: login.php');
    exit();
}

include 'koneksi.php';
require 'vendor/autoload.php'; // Pastikan PhpSpreadsheet terinstal

use PhpOffice\PhpSpreadsheet\IOFactory;

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_FILES['file_excel'])) {
    $file = $_FILES['file_excel']['tmp_name'];
    
    $spreadsheet = IOFactory::load($file);
    $worksheet = $spreadsheet->getActiveSheet();
    $rows = $worksheet->toArray();
    
    // Lewati header, mulai dari baris kedua
    foreach (array_slice($rows, 1) as $row) {
        $dusun = $row[0];
        $rt = $row[1];
        $nik = $row[2];
        $nama = $row[3];
        $jenis_kelamin = $row[4];
        $alamat = $row[5];
        $usia = $row[6];
        
        $query = "INSERT INTO penduduk (dusun, rt, nik, nama, jenis_kelamin, alamat, usia) VALUES (?, ?, ?, ?, ?, ?, ?)";
        $stmt = mysqli_prepare($koneksi, $query);
        mysqli_stmt_bind_param($stmt, "sissssi", $dusun, $rt, $nik, $nama, $jenis_kelamin, $alamat, $usia);
        mysqli_stmt_execute($stmt);
    }
    
    $_SESSION['success'] = "Data berhasil diimpor!";
    header('Location: penduduk.php');
    exit();
}
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Import Data Penduduk</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2>Import Data Penduduk</h2>
        <?php if (isset($_SESSION['success'])): ?>
            <div class="alert alert-success"> <?= $_SESSION['success']; unset($_SESSION['success']); ?> </div>
        <?php endif; ?>
        <form action="import_penduduk.php" method="post" enctype="multipart/form-data">
            <div class="mb-3">
                <label for="file_excel" class="form-label">Pilih File Excel</label>
                <input type="file" class="form-control" name="file_excel" required>
            </div>
            <button type="submit" class="btn btn-primary">Import</button>
        </form>
        <a href="penduduk.php" class="btn btn-secondary mt-3">Kembali</a>
    </div>
</body>
</html>
