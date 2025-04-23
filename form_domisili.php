<?php
include 'koneksi.php'; // Pastikan koneksi ke database

// Jika tombol submit ditekan
if (isset($_POST['submit'])) {
    $nomor_surat = $_POST['nomor_surat'];
    $nama = $_POST['nama'];
    $jenis_kelamin = $_POST['jenis_kelamin'];
    $ttl_umur = $_POST['ttl_umur'];
    $agama = $_POST['agama'];
    $pekerjaan = $_POST['pekerjaan'];
    $alamat = $_POST['alamat'];
    $tanggal = date("Y-m-d");

    // Cek apakah semua data terisi
    if (empty($nomor_surat) || empty($nama) || empty($jenis_kelamin) || empty($ttl_umur) || empty($agama) || empty($pekerjaan) || empty($alamat)) {
        die("<script>alert('Harap isi semua data!'); window.history.back();</script>");
    }

    // Menggunakan Prepared Statement
    $stmt = $conn->prepare("INSERT INTO surat_domisili (nomor_surat, nama, jenis_kelamin, ttl_umur, agama, pekerjaan, alamat, tanggal) 
                            VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("ssssssss", $nomor_surat, $nama, $jenis_kelamin, $ttl_umur, $agama, $pekerjaan, $alamat, $tanggal);

    // Eksekusi query dan cek hasilnya
    if ($stmt->execute()) {
        echo "<script>alert('Data berhasil disimpan!'); window.location.href='cetak_domisili.php?id=" . $conn->insert_id . "';</script>";
    } else {
        echo "<script>alert('Gagal menyimpan data! Error: " . $stmt->error . "');</script>";
    }

    $stmt->close();
}
?>


<!DOCTYPE html>
<html>
<head>
    <title>Form Surat Keterangan Domisili</title>
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
    <h2>Form Pengajuan Surat Keterangan Domisili</h2>
    <form method="POST">
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

        <label>TTL / Umur:</label>
        <input type="text" name="ttl_umur" required>

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

        <button type="submit" name="submit">Simpan dan Cetak</button>
    </form>
</body>
</html>
