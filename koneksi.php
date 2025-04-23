<?php
$host = "localhost"; // Sesuaikan dengan host database
$user = "root"; // Sesuaikan dengan username database
$password = ""; // Kosongkan jika tidak ada password
$database = "baumata"; // Ganti dengan nama database Anda

$conn = mysqli_connect($host, $user, $password, $database);

if (!$conn) {
    die("Koneksi gagal: " . mysqli_connect_error());
}
?>
