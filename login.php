<?php
session_start();
include 'koneksi.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = $_POST['username'];
    $password = $_POST['password'];

    // Menggunakan prepared statement untuk keamanan
    $query = "SELECT * FROM admin WHERE username = ?";
    $stmt = mysqli_prepare($conn, $query);
    mysqli_stmt_bind_param($stmt, "s", $username);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);
    $row = mysqli_fetch_assoc($result);

    if ($row) {
        // Verifikasi password yang di-hash
        if (password_verify($password, $row['password'])) {
            $_SESSION['admin'] = $username;
            header('Location: index.php'); // Redirect ke halaman utama
            exit();
        } else {
            $error = "Password salah!";
        }
    } else {
        $error = "Akun belum terdaftar! Silakan daftar terlebih dahulu.";
    }
}
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Administrasi Kependudukan</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="login-wrapper">
        <div class="login-container">
            <img src="logooooo.png" alt="Logo" width="100"> <!-- Logo menggantikan tulisan Login -->
            <?php if (isset($error)) { echo "<p class='error-message'>$error</p>"; } ?>
            <form method="POST">
                <input type="text" name="username" placeholder="Username" required>
                <input type="password" name="password" placeholder="Password" required>
                <button type="submit">Masuk</button>
            </form>
            <p>Belum punya akun? <a href="register.php">Daftar di sini</a></p>
        </div>
    </div>
</body>
</html>
