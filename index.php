<?php 
session_start();
if (!isset($_SESSION['admin'])) {
    header('Location: login.php');
    exit();
}

include 'koneksi.php';

// Pastikan koneksi sukses
if (!$conn) {
    die("Koneksi database gagal: " . mysqli_connect_error());
}

// Ambil data admin dengan prepared statement
$username = $_SESSION['admin'];
$query = "SELECT * FROM admin WHERE username = ?";
$stmt = mysqli_prepare($conn, $query);
mysqli_stmt_bind_param($stmt, "s", $username);
mysqli_stmt_execute($stmt);
$result = mysqli_stmt_get_result($stmt);
$user = mysqli_fetch_assoc($result);

if (!$user) {
    echo "User tidak ditemukan.";
    exit();
}

// Ambil statistik penduduk
$statQuery = "SELECT 
                    COUNT(DISTINCT dusun) AS total_dusun, 
                    COUNT(DISTINCT rt) AS total_rt, 
                    COUNT(id) AS total_penduduk 
                FROM data_penduduk";
$statResult = mysqli_query($conn, $statQuery);
$stats = mysqli_fetch_assoc($statResult) ?: ['total_dusun' => 0, 'total_rt' => 0, 'total_penduduk' => 0];

// Menghitung jumlah total surat tercetak dari semua tabel surat
$suratQuery = "
    SELECT COUNT(*) as total FROM surat_domisili WHERE status = 'tercetak'
    UNION ALL
    SELECT COUNT(*) FROM beda_nama WHERE status = 'tercetak'
    UNION ALL
    SELECT COUNT(*) FROM beda_nik WHERE status = 'tercetak'
    UNION ALL
    SELECT COUNT(*) FROM kematian WHERE status = 'tercetak'
    UNION ALL
    SELECT COUNT(*) FROM sktm WHERE status = 'tercetak'
    UNION ALL
    SELECT COUNT(*) FROM usaha WHERE status = 'tercetak'
";

$suratResult = mysqli_query($conn, $suratQuery);
$total_surat = 0;

while ($row = mysqli_fetch_assoc($suratResult)) {
    $total_surat += $row['total']; // Menjumlahkan semua hasil COUNT
}

?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Administrasi Kependudukan</title>
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
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
    /* Ensure the map image is responsive */
    .map-container {
            text-align: center;
            margin-top: 20px;
        }
        .map-container img {
            max-width: 100%;
            height: auto;
            border-radius: 8px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        }
</style>
</head>
<body>
    <div class="wrapper d-flex">
        <!-- Sidebar -->
        <nav id="sidebar" class="col-md-3 col-lg-2">
            <div class="sidebar-header text-center">
                <h3><i class="fa fa-home"></i> BAUMATA PUSAT</h3>
                <p class="text-white"><?php echo htmlspecialchars($user['username']); ?></p>
            </div>
            <ul class="list-unstyled components">
                <li><a href="index.php"><i class="fa fa-home"></i> Beranda</a></li>
                <li><a href="penduduk.php"><i class="fa fa-users"></i> Kependudukan</a></li>
                <li><a href="ek.php"><i class="fa fa-file-alt"></i> file penduduk</a></li>
                <li><a href="statistik.php"><i class="fa fa-chart-bar"></i> Statistik</a></li>
                <li><a href="layanan_surat.php"><i class="fa fa-file-alt"></i> Layanan Surat</a></li>
                
                <li><a href="surat_tercetak.php"><i class="fa fa-file-alt"></i> Surat Tercetak</a></li>
                <li><a href="logout.php" class="text-danger"><i class="fa fa-sign-out-alt"></i> Keluar</a></li>
            </ul>
        </nav>

        <!-- Toggle Button -->
        <button id="toggle-btn"><i class="fa fa-bars"></i></button>

        <!-- Main Content -->
        <div id="content" class="col-md-9 col-lg-10">
            <nav class="navbar navbar-expand-lg navbar-light bg-light px-4">
                <h3>Dashboard</h3>
            </nav>

            <div class="container mt-4">
                <div class="alert alert-success" role="alert">
                    <i class="fa fa-bullhorn"></i> <strong>Selamat Datang di Sistem Administrasi Desa!</strong> Baumata Pusat. <a href="detail.php">Lihat Detail</a>
                </div>

                <!-- Statistics -->
                <div class="row">
    <div class="col-md-3 mb-3">
        <div class="card text-white bg-primary shadow-sm">
            <div class="card-body text-center">
                <h5 class="card-title"><i class="fa fa-map-marker-alt"></i> Wilayah Dusun</h5>
                <h2 class="fw-bold"><?php echo $stats['total_dusun']; ?></h2>
                <a href="statistik.php" class="btn btn-light btn-sm mt-2">Selengkapnya</a>
            </div>
        </div>
    </div>
    <div class="col-md-3 mb-3">
        <div class="card text-white bg-info shadow-sm">
            <div class="card-body text-center">
                <h5 class="card-title"><i class="fa fa-user"></i> RT</h5>
                <h2 class="fw-bold"><?php echo $stats['total_rt']; ?></h2>
                <a href="statistik.php" class="btn btn-light btn-sm mt-2">Selengkapnya</a>
            </div>
        </div>
    </div>
    <div class="col-md-3 mb-3">
        <div class="card text-white bg-success shadow-sm">
            <div class="card-body text-center">
                <h5 class="card-title"><i class="fa fa-users"></i> Penduduk</h5>
                <h2 class="fw-bold"><?php echo $stats['total_penduduk']; ?></h2>
                <a href="statistik.php" class="btn btn-light btn-sm mt-2">Selengkapnya</a>
            </div>
        </div>
    </div>
    <div class="col-md-3 mb-3">
        <div class="card text-white bg-warning shadow-sm">
            <div class="card-body text-center">
                <h5 class="card-title"><i class="fa fa-file"></i> Surat Tercetak</h5>
                <h2 class="fw-bold"><?php echo $total_surat; ?></h2>
                <a href="surat_tercetak.php" class="btn btn-light btn-sm mt-2">Selengkapnya</a>
            </div>
        </div>
    </div>
</div>


                </div>
                <!-- End Statistics -->

                <!-- Map Section -->
                <div class="map-container">
                    <h4 class="text-center"></h4>
                    <img src="PETA DESA BAUMATA.jpg" alt="Peta Desa Baumata Pusat">
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- JavaScript to toggle sidebar visibility -->
    <script>
        document.getElementById('toggle-btn').addEventListener('click', function() {
            const sidebar = document.getElementById('sidebar');
            const content = document.getElementById('content');
            sidebar.classList.toggle('collapsed');
            content.classList.toggle('collapsed');
        });
    </script>
</body>
</html>
