<?php
session_start();
if (!isset($_SESSION['admin'])) {
    header('Location: login.php'); // Redirect jika belum login
    exit();
}

include 'koneksi.php';

// Periksa apakah koneksi ke database berhasil
if (!$conn) {
    die("Koneksi gagal: " . mysqli_connect_error());
}

// Ambil data admin yang sedang login
$username = $_SESSION['admin'];
$query = "SELECT * FROM admin WHERE username='$username'";
$result = mysqli_query($conn, $query); // Gantilah $koneksi menjadi $conn
$user = mysqli_fetch_assoc($result);

// Ambil daftar surat dari database
$query_surat = "SELECT * FROM dokumen_surat";
$result_surat = mysqli_query($conn, $query_surat); // Gantilah $koneksi menjadi $conn
?>


<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Buat Surat - Administrasi Kependudukan</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<style>
    /* Sidebar Styling */
    #sidebar {
        height: 100%;
        background-color: #343a40;
        color: #fff;
        padding-top: 20px;
        position: fixed;
        top: 0;
        left: 0;
        bottom: 0;
        width: 250px;
        transition: transform 0.3s ease;
    }

    /* Header Sidebar */
    .sidebar-header {
        text-align: center;
        margin-bottom: 30px;
        position: relative; /* Set relative positioning for the active status icon */
    }

    .sidebar-header h3 {
        font-size: 1.8rem;
        color: #f8f9fa;
        font-weight: 700;
        text-transform: uppercase;
        letter-spacing: 2px;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        margin-bottom: 10px;
    }

    .sidebar-header p {
        font-size: 1.5rem; /* Perbesar ukuran font */
        color: #fff; /* Warna putih */
        font-family: 'Roboto', sans-serif;
        font-weight: 500;
        text-transform: capitalize;
        margin: 0;
    }

    #sidebar a {
        color: #bbb;
        font-size: 1.1rem;
        padding: 10px 20px;
        display: block;
        transition: 0.3s;
    }

    #sidebar a:hover {
        background-color: #495057;
        color: #f8f9fa;
    }

    /* Button to toggle the sidebar */
    #toggle-btn {
        position: absolute;
        top: 20px;
        left: 250px;
        z-index: 1000;
        background-color: #007bff;
        color: white;
        border: none;
        padding: 10px;
        cursor: pointer;
        border-radius: 5px;
    }

    /* Main Content Styling */
    #content {
        margin-left: 250px;
        transition: margin-left 0.3s ease;
    }

    /* When Sidebar is collapsed */
    #sidebar.collapsed {
        transform: translateX(-100%);
    }

    #content.collapsed {
        margin-left: 0;
    }

    /* Navbar Styling */
    nav.navbar {
        background-color: #f8f9fa;
        border-bottom: 2px solid #007bff;
        padding: 10px 20px;
    }

    nav.navbar h3 {
        font-size: 1.8rem;
        color: #007bff;
        font-weight: 600;
        letter-spacing: 1px;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    /* Statistik Card Styling */
    .card {
        border-radius: 8px;
    }

    .card .card-body {
        padding: 20px;
    }

    .card h2 {
        font-size: 2rem;
        font-weight: 700;
    }

    .card-title i {
        font-size: 1.5rem;
        margin-right: 10px;
    }

    .card.bg-primary { background-color: #007bff; }
    .card.bg-info { background-color: #17a2b8; }
    .card.bg-success { background-color: #28a745; }
    .card.bg-warning { background-color: #ffc107; }

    /* Alert Styling */
    .alert {
        font-size: 1.2rem;
        padding: 20px;
    }
</style>
<body>
    <div class="wrapper">
        <nav id="sidebar">
            <div class="sidebar-header">
                <h3><i class="fa fa-home"></i> Baumata Pusat</h3>
                <p><?php echo htmlspecialchars($user['username']); ?></p>
            </div>
            <ul class="list-unstyled components">
                <li><a href="index.php"><i class="fa fa-home"></i> Home</a></li>
                <li><a href="penduduk.php"><i class="fa fa-users"></i> Kependudukan</a></li>
                <li><a href="#"><i class="fa fa-chart-bar"></i> Statistik</a></li>
                <li class="active"><a href="layanan_surat.php"><i class="fa fa-file-alt"></i> Layanan Surat</a></li>
                <li><a href="#"><i class="fa fa-cogs"></i> Pengaturan</a></li>
                <li><a href="logout.php" class="text-danger"><i class="fa fa-sign-out-alt"></i> Logout</a></li>
            </ul>
        </nav>

        <div id="content">
            <nav class="navbar navbar-expand-lg navbar-light bg-light px-4">
                <h3>Layanan Surat</h3>
            </nav>

            <div class="container mt-4">
                <div class="alert alert-info" role="alert">
                    <i class="fa fa-info-circle"></i> Pilih jenis surat yang ingin dibuat atau dikelola.
                </div>

                <table class="table table-bordered table-hover">
                    <thead class="table-dark">
                        <tr>
                            <th>No</th>
                            <th>Jenis Surat</th>
                            <th>Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php $no = 1; while ($row = mysqli_fetch_assoc($result_surat)) : ?>
                        <tr>
                            <td><?php echo $no++; ?></td>
                            <td><?php echo htmlspecialchars($row['jenis_surat']); ?></td>
                            <td>
                                <?php if ($row['jenis_surat'] == 'Surat Keterangan Domisili') : ?>
                                    <a href="form_domisili.php?id=<?php echo $row['id']; ?>" class="btn btn-success btn-sm">
                                        <i class="fa fa-file"></i> Buat Surat
                                    </a>
                                <?php elseif ($row['jenis_surat'] == 'Surat Keterangan Tidak Mampu') : ?>
                                    <a href="form_tidakmampu.php?id=<?php echo $row['id']; ?>" class="btn btn-success btn-sm">
                                        <i class="fa fa-file"></i> Buat Surat
                                    </a>
                                <?php elseif ($row['jenis_surat'] == 'Surat Keterangan Usaha') : ?>
                                    <a href="form_usaha.php?id=<?php echo $row['id']; ?>" class="btn btn-success btn-sm">
                                        <i class="fa fa-file"></i> Buat Surat
                                    </a>
                                <?php endif; ?>
                                <a href="hapus_surat.php?id=<?php echo $row['id']; ?>" class="btn btn-danger btn-sm" onclick="return confirm('Hapus surat ini?');">
                                    <i class="fa fa-trash"></i> Hapus
                                </a>
                            </td>
                        </tr>
                        <?php endwhile; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
