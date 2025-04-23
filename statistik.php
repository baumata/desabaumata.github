<?php
session_start();
if (!isset($_SESSION['admin'])) {
    header('Location: login.php'); // Redirect jika belum login
    exit();
}

include 'koneksi.php';

// Ambil data admin yang sedang login
$username = mysqli_real_escape_string($conn, $_SESSION['admin']);
$query = "SELECT * FROM admin WHERE username='$username'";
$result = mysqli_query($conn, $query);
if (!$result) {
    die("Query Error: " . mysqli_error($conn));
}
$user = mysqli_fetch_assoc($result);

// Ambil data statistik dari tabel dusun dan penduduk
$queryDusun = "SELECT COUNT(*) AS total_dusun FROM dusun";
$resultDusun = mysqli_query($conn, $queryDusun);
$dusun = ($resultDusun) ? mysqli_fetch_assoc($resultDusun)['total_dusun'] : 0;

$queryRT = "SELECT COUNT(*) AS total_rt FROM rt";
$resultRT = mysqli_query($conn, $queryRT);
$rt = ($resultRT) ? mysqli_fetch_assoc($resultRT)['total_rt'] : 0;

$queryPenduduk = "SELECT COUNT(*) AS total_penduduk, 
                         COALESCE(SUM(CASE WHEN jenis_kelamin='L' THEN 1 ELSE 0 END), 0) AS laki, 
                         COALESCE(SUM(CASE WHEN jenis_kelamin='P' THEN 1 ELSE 0 END), 0) AS perempuan 
                  FROM data_penduduk";


$resultPenduduk = mysqli_query($conn, $queryPenduduk);
if ($resultPenduduk && mysqli_num_rows($resultPenduduk) > 0) {
    $data = mysqli_fetch_assoc($resultPenduduk);
    $penduduk = $data['total_penduduk'];
    $laki = $data['laki'];
    $perempuan = $data['perempuan'];
} else {
    $penduduk = $laki = $perempuan = 0;
}
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Statistik</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<style>
       /* General Styling */
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #add6b6;
}

        /* Sidebar Styling */
        #sidebar {
            height: 100vh;
            width: 250px;
            background-color: #2c3e50;
            color: #fff;
            position: fixed;
            transition: 0.3s;
            padding-top: 20px;
        }
        
        #sidebar a {
            color: #bbb;
            font-size: 1.2rem;
            padding: 12px 20px;
            display: block;
            transition: 0.3s;
        }
        
        #sidebar a:hover {
            background-color: #34495e;
            color: #f8f9fa;
        }
        
        /* Main Content Styling */
        #content {
            margin-left: 250px;
            padding: 20px;
            transition: 0.3s;
        }
        
        /* Navbar Styling */
.navbar {
    background-color: #f8f9fa; /* Warna latar belakang navbar */
    padding: 15px 20px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

/* Style untuk teks di Navbar */
.navbar h3 {
    color: #2c3e50;
    font-size: 1.8rem;
    font-weight: bold;
    margin: 0;
}

/* Tambahkan efek hover untuk estetika */
.navbar h3:hover {
    color: #34495e;
    transition: color 0.3s ease-in-out;
}


        
        /* Statistik Card Styling */
.card {
    border-radius: 10px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
    padding: 15px;
    background: white;
    width: 100%;
    max-width: 500px; /* Batasi ukuran max agar tidak terlalu besar */
}

.card:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 12px rgba(0, 0, 0, 0.15);
}

.card h2 {
    font-size: 2rem;
    font-weight: 700;
}

/* Chart Container Styling */
.chart-container {
    background: #fff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    text-align: center;
    margin-bottom: 15px; /* Kurangi jarak antar card */
    transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
    width: 100%;
    max-width: 450px; /* Batasi max-width */
}

canvas {
    max-width: 350px; /* Batasi ukuran chart agar tidak terlalu besar */
    height: auto;
}

/* Efek 3D saat hover */
.chart-container:hover {
    transform: scale(1.05);
    box-shadow: 0 10px 15px rgba(0, 0, 0, 0.2);
}

/* Style untuk Judul Diagram */
.chart-title {
    font-size: 1.4rem;
    font-weight: bold;
    margin-bottom: 15px;
    color: #2c3e50;
    text-transform: uppercase;
    letter-spacing: 1px;
}

/* Efek transisi halus saat grafik muncul */
canvas {
    transition: opacity 0.6s ease-in-out, transform 0.6s ease-in-out;
    opacity: 0.9;
}

/* Animasi masuk saat halaman dimuat */
@keyframes fadeInUp {
    from {
        opacity: 0;
        transform: translateY(20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

/* Terapkan animasi pada setiap diagram */
.chart-container canvas {
    animation: fadeInUp 0.8s ease-in-out;
}

/* Responsif */
@media (max-width: 768px) {
    .chart-container {
        padding: 15px;
    }

    .chart-title {
        font-size: 1.2rem;
    }
}


    </style>
<body>
    <div class="wrapper">
        <nav id="sidebar">
            <div class="sidebar-header">
            <h3><i class="fa fa-home"></i> BAUMATA PUSAT</h3>
                <p><?php echo htmlspecialchars($user['username']); ?></p>
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

        <div id="content">
            <nav class="navbar navbar-expand-lg navbar-light bg-light px-4">
                <h3>Dashboard Statistik</h3>
            </nav>

            <div class="container mt-4">
            <div class="row">
    <div class="col-md-6">
        <div class="chart-container">
            <h5 class="chart-title">Jumlah Dusun dan RT</h5>
            <canvas id="dusunRTChart"></canvas>
        </div>
    </div>

    <div class="col-md-6">
        <div class="chart-container">
        <h5 class="chart-title">Perbandingan Jenis Kelamin</h5>
            <canvas id="genderChart"></canvas>
        </div>
    </div>
</div>

<div class="row mt-4">
    <div class="col-md-6">
        <div class="chart-container">
        <h5 class="chart-title">Total Penduduk</h5>
            <canvas id="pendudukTrendChart"></canvas>
        </div>
    </div>
    <div class="col-md-6">
        <div class="chart-container">
        <h5 class="chart-title">Distribusi Penduduk</h5>
            <canvas id="pendudukDonutChart"></canvas>
        </div>
    </div>
</div>

<script>
    // Diagram Batang untuk Jumlah Dusun & RT
    var dusunRTCtx = document.getElementById('dusunRTChart').getContext('2d');
    new Chart(dusunRTCtx, {
        type: 'bar',
        data: {
            labels: ['Dusun', 'RT'],
            datasets: [{
                label: 'Jumlah',
                data: [<?php echo "$dusun, $rt"; ?>],
                backgroundColor: ['#3498db', '#e74c3c'],
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            scales: {
                y: { beginAtZero: true }
            }
        }
    });

    // Diagram Pie untuk Perbandingan Jenis Kelamin
    var genderCtx = document.getElementById('genderChart').getContext('2d');
    new Chart(genderCtx, {
        type: 'pie',
        data: {
            labels: ['Laki-laki', 'Perempuan'],
            datasets: [{
                data: [<?php echo "$laki, $perempuan"; ?>],
                backgroundColor: ['#f39c12', '#9b59b6']
            }]
        },
        options: {
            responsive: true
        }
    });

    // Diagram Garis untuk Simulasi Tren Total Penduduk
    var pendudukTrendCtx = document.getElementById('pendudukTrendChart').getContext('2d');
    new Chart(pendudukTrendCtx, {
        type: 'line',
        data: {
            labels: ['2021', '2022', '2023', '2024', '2025'],
            datasets: [{
                label: 'Jumlah Penduduk',
                data: [<?php echo "$penduduk-200, $penduduk-150, $penduduk-100, $penduduk-50, $penduduk"; ?>],
                borderColor: '#2ecc71',
                fill: false
            }]
        },
        options: {
            responsive: true,
            scales: {
                y: { beginAtZero: true }
            }
        }
    });

    // Diagram Donut untuk Distribusi Penduduk
    var pendudukDonutCtx = document.getElementById('pendudukDonutChart').getContext('2d');
    new Chart(pendudukDonutCtx, {
        type: 'doughnut',
        data: {
            labels: ['Laki-laki', 'Perempuan'],
            datasets: [{
                data: [<?php echo "$laki, $perempuan"; ?>],
                backgroundColor: ['#f39c12', '#9b59b6']
            }]
        },
        options: {
            responsive: true
        }
    });
</script>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
