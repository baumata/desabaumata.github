<?php
include 'koneksi.php'; // Pastikan koneksi ke database

if (isset($_POST['submit'])) {
    $nama = $_POST['nama'];
    $jenis_kelamin = $_POST['jenis_kelamin'];
    $ttl = $_POST['ttl'];
    $umur = $_POST['umur'];
    $agama = $_POST['agama'];
    $pekerjaan = $_POST['pekerjaan'];
    $alamat = $_POST['alamat'];
    $hari_tgl = $_POST['hari_tgl'];
    $tempat = $_POST['tempat'];
    $penyebab = $_POST['penyebab'];
    $tanggal_surat = date("Y-m-d");
    
    $query = "INSERT INTO kematian (nama, jenis_kelamin, ttl, umur, agama, pekerjaan, alamat, hari_tgl, tempat, penyebab, tanggal_surat) 
              VALUES ('$nama', '$jenis_kelamin', '$ttl', '$umur', '$agama', '$pekerjaan', '$alamat', '$hari_tgl', '$tempat', '$penyebab', '$tanggal_surat')";
    
    if (mysqli_query($conn, $query)) {
        echo "<script>alert('Data berhasil disimpan!'); window.location.href='cetak_kematian.php?id=" . mysqli_insert_id($conn) . "';</script>";
    } else {
        echo "<script>alert('Gagal menyimpan data!');</script>";
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Form Surat Keterangan Kematian</title>
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

        input, textarea {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
        }

        button {
            width: 100%;
            background: #dc3545;
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
            background: #c82333;
        }
    </style>
</head>
<body>
    <h2>Form Surat Keterangan Kematian</h2>
    <form method="POST">
        <label>Nomor Surat:</label>
        <input type="text" name="nomor_surat" required>
        
        <label>Nama:</label>
        <input type="text" name="nama" required><br>
        
        <label>Jenis Kelamin:</label>
            <select name="jenis_kelamin" required class="form-control">
                <option value="">-- Pilih --</option>
                <option value="Laki-laki">Laki-laki</option>
                <option value="Perempuan">Perempuan</option>
            </select>
        
        <label>Tempat, Tanggal Lahir:</label>
        <input type="text" name="ttl" required><br>
        
        <label>Umur:</label>
        <input type="number" name="umur" required><br>
        
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
        <input type="text" name="pekerjaan" required><br>
        
        <label>Alamat:</label>
        <textarea name="alamat" required></textarea><br>
        
        <label>Pada Hari/Tanggal:</label>
        <input type="text" name="hari_tgl" required><br>
        
        <label>Di:</label>
        <input type="text" name="tempat" required><br>
        
        <label>Karena:</label>
        <textarea name="penyebab" required></textarea><br>
        
        <button type="submit" name="submit">Simpan dan Cetak</button>
    </form>
</body>
</html>
