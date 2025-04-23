<?php  
include 'koneksi.php'; // Pastikan koneksi ke database sudah ada

if (!$conn) {
    die("Koneksi gagal: " . mysqli_connect_error());
}

if (isset($_POST['submit'])) {
    $nama = mysqli_real_escape_string($conn, $_POST['nama']);
    $jenis_kelamin = mysqli_real_escape_string($conn, $_POST['jenis_kelamin']);
    $umur = intval($_POST['umur']);
    $agama = mysqli_real_escape_string($conn, $_POST['agama']);
    $pekerjaan = mysqli_real_escape_string($conn, $_POST['pekerjaan']);
    $alamat = mysqli_real_escape_string($conn, $_POST['alamat']);
    $nama_dokumen = mysqli_real_escape_string($conn, $_POST['nama_dokumen']);
    $nama_salah = mysqli_real_escape_string($conn, $_POST['nama_salah']);
    $tanggal = date("Y-m-d");

    // Menggunakan Prepared Statement untuk keamanan
    $query = "INSERT INTO beda_nama (nama, jenis_kelamin, umur, agama, pekerjaan, alamat, nama_dokumen, nama_salah, tanggal) 
              VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
    $stmt = mysqli_prepare($conn, $query);
    mysqli_stmt_bind_param($stmt, "ssissssss", $nama, $jenis_kelamin, $umur, $agama, $pekerjaan, $alamat, $nama_dokumen, $nama_salah, $tanggal);
    
    if (mysqli_stmt_execute($stmt)) {
        $last_id = mysqli_insert_id($conn);
        echo "<script>alert('Data berhasil disimpan!'); window.location.href='cetak_bedanama.php?id=$last_id';</script>";
    } else {
        echo "<script>alert('Gagal menyimpan data!');</script>";
    }
    
    mysqli_stmt_close($stmt);
}
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form Surat Keterangan Beda Nama</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center">Form Pengajuan Surat Keterangan Beda Nama</h2>
        <form method="POST" action="">
            <label>Nomor Surat:</label>
            <input type="text" name="nomor_surat" required>

            <label>Nama:</label>
            <input type="text" name="nama" required class="form-control">

            <label>Jenis Kelamin:</label>
            <select name="jenis_kelamin" required class="form-control">
                <option value="">-- Pilih --</option>
                <option value="Laki-laki">Laki-laki</option>
                <option value="Perempuan">Perempuan</option>
            </select>

            <label>Umur:</label>
            <input type="number" name="umur" required min="1" class="form-control">

            <label>Agama:</label>
            <select name="agama" required>
                <option value="">-- Pilih --</option>
                <option value="Kristen protestan">Kristen Protestan</option>
                <option value="Katolik">Katolik</option>
                <option value="Islam">Islam</option>
                <option value="Hindu">Hindu</option>
                <option value="Buddha">Buddha</option>
                <option value="Konghucu">Konghucu</option>
            </select>

            <label>Pekerjaan:</label>
            <input type="text" name="pekerjaan" required class="form-control">

            <label>Alamat:</label>
            <textarea name="alamat" required class="form-control"></textarea>

            <label>Nama yang Benar (sesuai KTP, Akta, dll):</label>
            <input type="text" name="nama_dokumen" required class="form-control">

            <label>Nama yang Salah (tercetak di dokumen lain):</label>
            <input type="text" name="nama_salah" required class="form-control">

            <button type="submit" name="submit" class="btn btn-success mt-3">Simpan dan Cetak</button>
        </form>
    </div>
</body>
</html>