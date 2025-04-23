<?php
include 'koneksi.php'; // Pastikan koneksi ke database

if (isset($_POST['submit'])) {
    $nama = mysqli_real_escape_string($conn, $_POST['nama']);
    $umur = mysqli_real_escape_string($conn, $_POST['umur']);
    $jenis_kelamin = mysqli_real_escape_string($conn, $_POST['jenis_kelamin']);
    $pekerjaan = mysqli_real_escape_string($conn, $_POST['pekerjaan']);
    $agama = mysqli_real_escape_string($conn, $_POST['agama']);
    $alamat = mysqli_real_escape_string($conn, $_POST['alamat']);
    $maksud = mysqli_real_escape_string($conn, $_POST['maksud']);
    $tanggal_surat = date("Y-m-d");

    $query = "INSERT INTO sktm (nama, umur, jenis_kelamin, pekerjaan, agama, alamat, maksud, tanggal_surat) 
              VALUES ('$nama', '$umur', '$jenis_kelamin', '$pekerjaan', '$agama', '$alamat', '$maksud', '$tanggal_surat')";

    if (mysqli_query($conn, $query)) {
        echo "<script>alert('Data berhasil disimpan!'); window.location.href='cetak_tidakmampu.php?id=" . mysqli_insert_id($conn) . "';</script>";
    } else {
        echo "Error: " . mysqli_error($conn); // Tampilkan error MySQL jika ada
    }
}
?>


<!DOCTYPE html>
<html>
<head>
    <title>Form Surat Keterangan Tidak Mampu</title>
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

        h2 {
            text-align: center;
            color: #333;
        }

        form {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 350px;
        }

        label {
            font-weight: bold;
            display: block;
            margin-top: 10px;
            color: #555;
        }

        input, textarea, select {
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
    <h2>Form Surat Keterangan Tidak Mampu</h2>
    <form method="POST">
        <label>Nomor Surat:</label>
        <input type="text" name="nomor_surat" required>

        <label>Nama:</label>
        <input type="text" name="nama" required>
        
        <label>Umur:</label>
        <input type="number" name="umur" required>
        
        <label>Jenis Kelamin:</label>
        <select name="jenis_kelamin" required>
            <option value="">-- Pilih --</option>
            <option value="Laki-laki">Laki-laki</option>
            <option value="Perempuan">Perempuan</option>
        </select>
        
        <label>Pekerjaan:</label>
        <input type="text" name="pekerjaan" required>
        
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
        
        <label>Alamat:</label>
        <textarea name="alamat" required></textarea>
        
        <label>Maksud:</label>
        <textarea name="maksud" required></textarea>
        
        <button type="submit" name="submit">Simpan dan Cetak</button>
    </form>
</body>
</html>