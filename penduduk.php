<?php
session_start();
if (!isset($_SESSION['admin'])) {
    header('Location: login.php');
    exit();
}

include 'koneksi.php';

$username = $_SESSION['admin'];
$query = "SELECT * FROM admin WHERE username='$username'";
$result = mysqli_query($conn, $query);
$user = mysqli_fetch_assoc($result);

// Ambil data pencarian
$nama_lengkap = isset($_GET['nama_lengkap']) ? $_GET['nama_lengkap'] : '';
$dusun_filter = isset($_GET['dusun']) ? $_GET['dusun'] : '';
$rt_filter = isset($_GET['rt']) ? $_GET['rt'] : '';
$limit = isset($_GET['limit']) ? (int)$_GET['limit'] : 10;
$page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
$offset = ($page - 1) * $limit;

// Query data penduduk dengan filter
$queryPenduduk = "SELECT * FROM data_penduduk WHERE 1=1";
if (!empty($nama_lengkap)) {
    $queryPenduduk .= " AND nama_lengkap LIKE '%$nama_lengkap%'";
}
if (!empty($dusun_filter)) {
    $queryPenduduk .= " AND dusun = '$dusun_filter'";
}
if (!empty($rt_filter)) {
    $queryPenduduk .= " AND rt = '$rt_filter'";
}
$queryPenduduk .= " ORDER BY id DESC LIMIT $limit OFFSET $offset";
$resultPenduduk = mysqli_query($conn, $queryPenduduk);

// Query total data penduduk
$totalQuery = "SELECT COUNT(*) AS total FROM data_penduduk WHERE 1=1";
if (!empty($nama_lengkap)) {
    $totalQuery .= " AND nama_lengkap LIKE '%$nama_lengkap%'";
}
if (!empty($dusun_filter)) {
    $totalQuery .= " AND dusun = '$dusun_filter'";
}
if (!empty($rt_filter)) {
    $totalQuery .= " AND rt = '$rt_filter'";
}
$totalResult = mysqli_query($conn, $totalQuery);
$totalRow = mysqli_fetch_assoc($totalResult)['total'];
$totalPages = ceil($totalRow / $limit);
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Data Penduduk - Administrasi Kependudukan</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <style>
        h5 {
            color: black;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <!-- Tombol Kembali -->
        <a href="index.php" class="btn btn-secondary mb-3"><i class="fa fa-arrow-left"></i> Kembali ke Halaman Utama</a>
        
        <h2>Data Penduduk</h2>
        <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addDataModal">Tambah Data</button>
        
        <!-- Form Pencarian -->
        <form method="GET" action="penduduk.php" class="search-form mb-4">
            <div class="row">
                <div class="col-md-4 col-sm-6 col-12">
                    <input type="text" name="nama_lengkap" class="form-control" placeholder="Cari Nama Lengkap" value="<?php echo htmlspecialchars($nama_lengkap); ?>">
                </div>
                <!-- Dropdown Pilih Dusun -->
                <div class="col-md-2 col-sm-6 col-12">
    <select name="dusun" id="dusunSelect" class="form-control">
        <option value="">Pilih Dusun</option>
        <?php
        $dusunList = ["Dusun 1", "Dusun 2", "Dusun 3", "Dusun 4", "Dusun 5"];
        foreach ($dusunList as $dusun) {
            $selected = ($dusun == $dusun_filter) ? 'selected' : '';
            echo "<option value='$dusun' $selected>$dusun</option>";
        }
        ?>
    </select>
</div>


<!-- Dropdown Pilih RT -->
<div class="col-md-2 col-sm-6 col-12">
    <select name="rt" class="form-control">
        <option value="">Pilih RT</option>
        <?php
        for ($i = 1; $i <= 13; $i++) {
            $selected = ($i == $rt_filter) ? 'selected' : '';
            echo "<option value='$i' $selected>RT $i</option>";
        }
        ?>
    </select>
</div>

                <div class="col-md-2 col-sm-6 col-12">
                    <select name="limit" class="form-control">
                        <option value="10" <?php echo ($limit == 10) ? 'selected' : ''; ?>>10</option>
                        <option value="20" <?php echo ($limit == 20) ? 'selected' : ''; ?>>20</option>
                        <option value="30" <?php echo ($limit == 30) ? 'selected' : ''; ?>>30</option>
                        <option value="50" <?php echo ($limit == 50) ? 'selected' : ''; ?>>50</option>
                    </select>
                </div>
                <div class="col-md-2 col-sm-6 col-12">
                    <button type="submit" class="btn btn-primary w-100"><i class="fa fa-search"></i> Cari</button>
                </div>
            </div>
        </form>

        <!-- Tabel Data Penduduk -->
        <div class="card">
            <div class="card-header">
                <h5><i class="fa fa-users"></i> Daftar Penduduk</h5>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>Dusun</th>
                                <th>RT</th>
                                <th>Nama Lengkap</th>
                                <th>Tempat Tanggal Lahir</th>
                                <th>Jenis Kelamin</th>
                                <th>Agama</th>
                                <th>Pendidikan</th>
                                <th>Pekerjaan</th>
                                <th>Status Perkawinan</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $no = $offset + 1;
                            while ($row = mysqli_fetch_assoc($resultPenduduk)) {
                                echo "<tr>";
                                echo "<td>" . htmlspecialchars($row['dusun']) . "</td>";
                                echo "<td>" . htmlspecialchars($row['rt']) . "</td>";
                                echo "<td>" . htmlspecialchars($row['nama_lengkap']) . "</td>";
                                echo "<td>" . htmlspecialchars($row['ttl']) . "</td>";
                                echo "<td>" . htmlspecialchars($row['jenis_kelamin'] === 'L' ? 'Laki-Laki' : 'Perempuan') . "</td>";
                                echo "<td>" . htmlspecialchars($row['agama']) . "</td>";
                                echo "<td>" . htmlspecialchars($row['pendidikan']) . "</td>";
                                echo "<td>" . htmlspecialchars($row['pekerjaan']) . "</td>";
                                echo "<td>" . htmlspecialchars($row['status_perkawinan']) . "</td>";
                                echo "<td>
                                        <a href='view.php?id=" . $row['id'] . "' class='btn btn-info btn-sm'>Lihat</a>
                                        <a href='edit.php?id=" . $row['id'] . "' class='btn btn-warning btn-sm'>Edit</a>
                                        <a href='delete.php?id=" . $row['id'] . "' class='btn btn-danger btn-sm' onclick='return confirm(\"Apakah Anda yakin ingin menghapus data ini?\");'>Hapus</a>
                                      </td>";
                                echo "</tr>";
                            }
                            ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- Pagination -->
        <div class="pagination-container text-center">
            <nav aria-label="Page navigation example">
                <ul class="pagination">
                    <!-- Previous Page -->
                    <li class="page-item <?php echo ($page <= 1) ? 'disabled' : ''; ?>">
                        <a class="page-link" href="penduduk.php?page=<?php echo ($page - 1); ?>&nama_lengkap=<?php echo urlencode($nama_lengkap); ?>&dusun=<?php echo urlencode($dusun_filter); ?>&rt=<?php echo urlencode($rt_filter); ?>&limit=<?php echo $limit; ?>" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <!-- Page Numbers -->
                    <?php
                    $maxPagesToShow = 25; // Maximum number of page buttons to display before adding ellipsis
                    $startPage = max(1, $page - floor($maxPagesToShow / 2));
                    $endPage = min($totalPages, $page + floor($maxPagesToShow / 2));

                    // If the total number of pages is greater than $maxPagesToShow, show ellipses
                    if ($startPage > 1) {
                        echo "<li class='page-item'><a class='page-link' href='#'>...</a></li>";
                    }

                    for ($i = $startPage; $i <= $endPage; $i++) {
                        echo "<li class='page-item " . ($i == $page ? 'active' : '') . "'>";
                        echo "<a class='page-link' href='penduduk.php?page=$i&nama_lengkap=" . urlencode($nama_lengkap) . "&dusun=" . urlencode($dusun_filter) . "&rt=" . urlencode($rt_filter) . "&limit=$limit'>$i</a>";
                        echo "</li>";
                    }

                    if ($endPage < $totalPages) {
                        echo "<li class='page-item'><a class='page-link' href='#'>...</a></li>";
                    }
                    ?>
                    <!-- Next Page -->
                    <li class="page-item <?php echo ($page >= $totalPages) ? 'disabled' : ''; ?>">
                        <a class="page-link" href="penduduk.php?page=<?php echo ($page + 1); ?>&nama_lengkap=<?php echo urlencode($nama_lengkap); ?>&dusun=<?php echo urlencode($dusun_filter); ?>&rt=<?php echo urlencode($rt_filter); ?>&limit=<?php echo $limit; ?>" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>

        <!-- Modal untuk menambah data -->
        <div class="modal fade" id="addDataModal" tabindex="-1" aria-labelledby="addDataModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addDataModalLabel">Menambahkan Data Penduduk</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Tutup"></button>
                    </div>
                    <div class="modal-body">
                        <form method="POST" action="penduduk.php">
                            <!-- Form Tambah Data Penduduk -->
                            <div class="mb-3">
                                <label for="dusun" class="form-label">Dusun</label>
                                <input type="text" class="form-control" id="dusun" name="dusun" required>
                            </div>
                            <div class="mb-3">
                                <label for="rt" class="form-label">RT</label>
                                <input type="text" class="form-control" id="rt" name="rt" required>
                            </div>
                            <div class="mb-3">
                                <label for="nama_lengkap" class="form-label">Nama Lengkap</label>
                                <input type="text" class="form-control" id="nama_lengkap" name="nama_lengkap" required>
                            </div>
                            <div class="mb-3">
                                <label for="ttl" class="form-label">Tempat Tanggal Lahir</label>
                                <input type="text" class="form-control" id="ttl" name="ttl" required>
                            </div>
                            <div class="mb-3">
                                <label for="jenis_kelamin" class="form-label">Jenis Kelamin</label>
                                <select class="form-control" id="jenis_kelamin" name="jenis_kelamin" required>
                                    <option value="L">Laki-Laki</option>
                                    <option value="P">Perempuan</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="agama" class="form-label">Agama</label>
                                <input type="text" class="form-control" id="agama" name="agama" required>
                            </div>
                            <div class="mb-3">
                                <label for="pendidikan" class="form-label">Pendidikan</label>
                                <input type="text" class="form-control" id="pendidikan" name="pendidikan" required>
                            </div>
                            <div class="mb-3">
                                <label for="pekerjaan" class="form-label">Pekerjaan</label>
                                <input type="text" class="form-control" id="pekerjaan" name="pekerjaan" required>
                            </div>
                            <div class="mb-3">
                                <label for="status_perkawinan" class="form-label">Status Perkawinan</label>
                                <select class="form-control" id="status_perkawinan" name="status_perkawinan" required>
                                    <option value="Belum Menikah">Belum Menikah</option>
                                    <option value="Menikah">Menikah</option>
                                    <option value="Janda/Duda">Janda/Duda</option>
                                </select>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Tutup</button>
                                <button type="submit" class="btn btn-primary" name="submit_tambah">Tambah Data</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
