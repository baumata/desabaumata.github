<?php
session_start();
include 'koneksi.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = $_POST['username'];
    $password = $_POST['password'];
    
    // Cek apakah username sudah terdaftar
    $check_query = "SELECT * FROM admin WHERE username='$username'";
    $check_result = mysqli_query($koneksi, $check_query);
    
    if (mysqli_num_rows($check_result) > 0) {
        echo "Username sudah digunakan, silakan pilih username lain.";
    } else {
        // Hash password sebelum disimpan ke database
        $hashed_password = password_hash($password, PASSWORD_DEFAULT);
        $insert_query = "INSERT INTO admin (username, password) VALUES ('$username', '$hashed_password')";
        
        if (mysqli_query($koneksi, $insert_query)) {
            echo "Pendaftaran berhasil. Silakan <a href='login.php'>login</a>.";
        } else {
            echo "Terjadi kesalahan, coba lagi.";
        }
    }
}
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - Administrasi Kependudukan</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="register-wrapper">
    <div class="register-container">
        <h2>Register</h2>
        <form method="POST">
            <input type="text" name="username" placeholder="Username" required>
            <input type="password" name="password" placeholder="Password" required>
            <input type="password" name="confirm_password" placeholder="Confirm Password" required>
            <button type="submit">Register</button>
        </form>
        <p>Sudah punya akun? <a href="login.php">Login</a></p>
    </div>
</div>
</body>
</html>
