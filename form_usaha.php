<?php
include 'koneksi.php'; // Pastikan koneksi ke database

if (isset($_POST['submit'])) {
    $nama = $_POST['nama'];
    $jabatan = $_POST['jabatan'];
    $nama_usaha = $_POST['nama_usaha'];
    $umur = $_POST['umur'];
    $pekerjaan = $_POST['pekerjaan'];
    $alamat = $_POST['alamat'];
    $tanggal = date("Y-m-d");
    
    $query = "INSERT INTO usaha (nama, jabatan, nama_usaha, umur, pekerjaan, alamat, tanggal) 
              VALUES ('$nama', '$jabatan', '$nama_usaha', '$umur', '$pekerjaan', '$alamat', '$tanggal')";
    
    if (mysqli_query($conn, $query)) {
        echo "<script>alert('Data berhasil disimpan!'); window.location.href='cetak_usaha.php?id=" . mysqli_insert_id($conn) . "';</script>";
    } else {
        echo "<script>alert('Gagal menyimpan data!');</script>";
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Form Surat Keterangan Usaha</title>
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
    <h2>Form Pengajuan Surat Keterangan Usaha</h2>
    <form method="POST">
        <label>Nomor Surat:</label>
        <input type="text" name="nomor_surat" required>
        
        <label>Nama:</label>
        <input type="text" name="nama" required><br>
        
        <label>Jabatan:</label>
        <input type="text" name="jabatan" required><br>
        
        <label>Nama Usaha:</label>
        <input type="text" name="nama_usaha" required><br>
        
        <label>Umur:</label>
        <input type="number" name="umur" required><br>
        
        <label>Pekerjaan:</label>
        <input type="text" name="pekerjaan" required><br>
        
        <label>Alamat:</label>
        <textarea name="alamat" required></textarea><br>
        
        <button type="submit" name="submit">Simpan dan Cetak</button>
    </form>
</body>
</html>
