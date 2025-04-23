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

    // Query untuk menghapus data berdasarkan id
    $query = "DELETE FROM data_penduduk WHERE id = '$id'";

    // Eksekusi query
    if (mysqli_query($koneksi, $query)) {
        echo "<script>alert('Data berhasil dihapus!');</script>";
        header('Location: penduduk.php');
        exit();
    } else {
        echo "Kesalahan: " . mysqli_error($koneksi);
    }
} else {
    echo "ID tidak tersedia!";
    exit();
}
