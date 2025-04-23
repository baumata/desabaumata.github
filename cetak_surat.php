<?php
session_start();
if (!isset($_SESSION['admin'])) {
    header('Location: login.php'); // Redirect jika belum login
    exit();
}

include 'koneksi.php';

// Ambil ID surat yang akan dicetak
$id = $_GET['id'];
$query = "SELECT * FROM surat WHERE id='$id'";
$result = mysqli_query($conn, $query);
$row = mysqli_fetch_assoc($result);

if (!$row) {
    die("Data tidak ditemukan!");
}

// Perbarui status surat menjadi "tercetak"
mysqli_query($conn, "UPDATE surat SET status='tercetak', tanggal_cetak=NOW() WHERE id='$id'");

?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Cetak Surat</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body onload="window.print()">
    <div class="container mt-5">
        <h2 class="text-center">Surat Resmi</h2>
        <hr>
        <p><strong>Nama Pemohon:</strong> <?php echo htmlspecialchars($row['nama_pemohon']); ?></p>
        <p><strong>Jenis Surat:</strong> <?php echo htmlspecialchars($row['jenis_surat']); ?></p>

        <?php 
        // Format surat berdasarkan jenisnya
        if ($row['jenis_surat'] == "Surat Keterangan") { ?>
            <div class="border p-3">
                <p>Yang bertanda tangan di bawah ini menyatakan bahwa:</p>
                <p><strong>Nama:</strong> <?php echo htmlspecialchars($row['nama_pemohon']); ?></p>
                <p>adalah warga yang bertempat tinggal di wilayah kami.</p>
            </div>

        <?php } elseif ($row['jenis_surat'] == "Surat Izin") { ?>
            <div class="border p-3">
                <p>Dengan ini diberikan izin kepada:</p>
                <p><strong>Nama:</strong> <?php echo htmlspecialchars($row['nama_pemohon']); ?></p>
                <p>untuk melakukan kegiatan sebagaimana yang tercantum dalam surat ini.</p>
            </div>

        <?php } elseif ($row['jenis_surat'] == "Surat Pernyataan") { ?>
            <div class="border p-3">
                <p>Saya yang bertanda tangan di bawah ini:</p>
                <p><strong>Nama:</strong> <?php echo htmlspecialchars($row['nama_pemohon']); ?></p>
                <p>dengan ini menyatakan bahwa:</p>
                <p><?php echo nl2br(htmlspecialchars($row['isi_surat'])); ?></p>
            </div>

        <?php } else { ?>
            <div class="border p-3">
                <p><?php echo nl2br(htmlspecialchars($row['isi_surat'])); ?></p>
            </div>
        <?php } ?>

        <p class="text-end mt-5"><strong>Tanggal Cetak:</strong> <?php echo date('d-m-Y'); ?></p>
        <script>
            setTimeout(() => { window.close(); }, 1000);
        </script>
    </div>
</body>
</html>
