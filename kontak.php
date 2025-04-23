<?php
// Ganti ini dengan email tujuan
$to = "baumatapusatkpg@gmail.com";

// Aktifkan error reporting untuk debugging
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Ambil data dari form
    $name = strip_tags(trim($_POST["name"]));
    $email = filter_var(trim($_POST["email"]), FILTER_SANITIZE_EMAIL);
    $subject = trim($_POST["subject"]);
    $message = trim($_POST["message"]);

    // Validasi
    if (empty($name) || !filter_var($email, FILTER_VALIDATE_EMAIL) || empty($subject) || empty($message)) {
        http_response_code(400);
        echo "Mohon isi semua data dengan benar.";
        exit;
    }

    // Buat isi email
    $email_content = "Nama: $name\n";
    $email_content .= "Email: $email\n";
    $email_content .= "Subjek: $subject\n\n";
    $email_content .= "Pesan:\n$message\n";

    // Header email
    $email_headers = "From: $email";

    // Cek apakah fungsi mail() bisa mengirim
    if (@mail($to, $subject, $email_content, $email_headers)) {
        // Jika berhasil mengirim email
        http_response_code(200);
        echo "Pesan berhasil dikirim.";
    } else {
        // Jika gagal, simpan pesan ke file untuk debugging
        $error_message = "Mail function failed! Please check the mail server configuration.\n";
        file_put_contents('pesan_debug.txt', $error_message . $email_content); // Simpan pesan untuk debug
        http_response_code(500);
        echo "Maaf, pesan gagal dikirim. Cek file pesan_debug.txt untuk detail.";
    }
} else {
    http_response_code(403);
    echo "Permintaan tidak valid.";
}
?>
