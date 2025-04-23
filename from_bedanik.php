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
    $nik_benar = mysqli_real_escape_string($conn, $_POST['nik_benar']);
    $nik_salah = mysqli_real_escape_string($conn, $_POST['nik_salah']);
    $tanggal = date("Y-m-d");

    // Validasi NIK (harus angka dan panjang 16 karakter)
    if (!preg_match('/^\d{16}$/', $nik_benar) || !preg_match('/^\d{16}$/', $nik_salah)) {
        echo "<script>alert('NIK harus terdiri dari 16 digit angka!'); window.history.back();</script>";
        exit();
    }

    // Menggunakan Prepared Statement untuk keamanan
    $query = "INSERT INTO beda_nik (nama, jenis_kelamin, umur, agama, pekerjaan, alamat, nik_benar, nik_salah, tanggal) 
              VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
    $stmt = mysqli_prepare($conn, $query);
    mysqli_stmt_bind_param($stmt, "ssissssss", $nama, $jenis_kelamin, $umur, $agama, $pekerjaan, $alamat, $nik_benar, $nik_salah, $tanggal);
    
    if (mysqli_stmt_execute($stmt)) {
        $last_id = mysqli_insert_id($conn);
        echo "<script>alert('Data berhasil disimpan!'); window.location.href='cetak_bedanik.php?id=$last_id';</script>";
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
    <title>Form Surat Keterangan Beda NIK</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            flex-direction: column;
        }
        .container {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        label {
            font-weight: bold;
            display: block;
            margin-top: 10px;
            color: #555;
        }
        input, select, textarea {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
        }
        button {
            width: 100%;
            background: #28a745;
            color: white;
            border: none;
            padding: 10px;
            margin-top: 15px;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s;
        }
        button:hover {
            background: #218838;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Form Pengajuan Surat Keterangan Beda NIK</h2>
        <form method="POST" action="">
            <label>Nomor Surat:</label>
            <input type="text" name="nomor_surat" required>

            <label>Nama:</label>
            <input type="text" name="nama" required>

            <label>Jenis Kelamin:</label>
            <select name="jenis_kelamin" required>
                <option value="">-- Pilih --</option>
                <option value="Laki-laki">Laki-laki</option>
                <option value="Perempuan">Perempuan</option>
            </select>

            <label>Umur:</label>
            <input type="number" name="umur" required min="1">

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
            <input type="text" name="pekerjaan" required>

            <label>Alamat:</label>
            <textarea name="alamat" required></textarea>

            <label>NIK Benar (sesuai KTP):</label>
            <input type="text" name="nik_benar" required maxlength="16" minlength="16">

            <label>NIK Salah (sesuai dokumen lain):</label>
            <input type="text" name="nik_salah" required maxlength="16" minlength="16">

            <button type="submit" name="submit">Simpan dan Cetak</button>
        </form>
    </div>
</body>
</html>
