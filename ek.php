<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload, Analyze, and Display Excel Data with Merged Headers</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.1/xlsx.full.min.js"></script>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #add6b6;
        }

        h1 {
            text-align: center;
            font-size: 2.5em;
            color: #333;
            margin-top: 30px;
        }

        .container {
            width: 85%;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
        }

        input[type="file"],
        button {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            margin-bottom: 20px;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #45a049;
        }

        input[type="file"] {
            font-size: 16px;
        }

        /* Table Styles */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            table-layout: fixed;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border: 1px solid #ddd;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        td {
            background-color: #f9f9f9;
        }

        /* Editable cells */
        td.editable {
            cursor: pointer;
        }

        td.editable:focus {
            background-color: #e8f5e9;
        }

        .buttons {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .filter {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Upload, Analyze, and Display Excel Data with Merged Headers</h1>

        <!-- File Upload -->
        <input type="file" id="upload" accept=".xlsx, .xls" />

        <!-- Sheet Dropdown for sheet selection -->
        <select id="sheetSelect">
            <option value="">Select a sheet</option>
        </select>

        <!-- Filter Section -->
        <div class="filter">
            <input type="text" id="searchDusun" placeholder="Search Dusun" onkeyup="filterTable()" />
        </div>

        <!-- Table to display Excel data -->
        <div id="excelDataContainer"></div>

        <!-- Buttons for Delete File and Back to Index -->
        <div class="buttons">
            <button id="deleteFileBtn" style="display: none;">Delete File</button>
            <button onclick="window.location.href='index.php'">Back to Index</button>
        </div>
    </div>

    <script>
        let workbook = null;

        // Handle file upload
        document.getElementById('upload').addEventListener('change', function(e) {
            const file = e.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    const data = new Uint8Array(e.target.result);
                    workbook = XLSX.read(data, { type: 'array' });

                    // Populate sheet selection dropdown
                    populateSheetSelect(workbook);

                    // Automatically load the first sheet
                    if (workbook.SheetNames.length > 0) {
                        displaySheet(workbook, workbook.SheetNames[0]);
                    }

                    // Show the Delete File button
                    document.getElementById('deleteFileBtn').style.display = 'inline-block';
                };
                reader.readAsArrayBuffer(file);
            }
        });

        // Populate sheet selection dropdown
        function populateSheetSelect(workbook) {
            const sheetSelect = document.getElementById('sheetSelect');
            sheetSelect.innerHTML = '<option value="">Select a sheet</option>';
            workbook.SheetNames.forEach(sheetName => {
                const option = document.createElement('option');
                option.value = sheetName;
                option.textContent = sheetName;
                sheetSelect.appendChild(option);
            });
        }

        // Display sheet data as a table
        document.getElementById('sheetSelect').addEventListener('change', function(e) {
            const selectedSheetName = e.target.value;
            if (selectedSheetName) {
                displaySheet(workbook, selectedSheetName);
            }
        });

        // Display the sheet data in an HTML table
        function displaySheet(workbook, sheetName) {
            const container = document.getElementById('excelDataContainer');
            container.innerHTML = ''; // Clear previous data

            const sheet = workbook.Sheets[sheetName];
            const jsonData = XLSX.utils.sheet_to_json(sheet, { header: 1 });

            // Create the table and append to the container
            const table = document.createElement('table');
            container.appendChild(table);

            // Create the header row with merged cells
            const thead = table.createTHead();
            const headerRow = thead.insertRow();

            // Get the merged cells info
            const mergeCells = sheet['!merges'];

            // Loop through the header cells and apply merges
            jsonData[0].forEach((cell, index) => {
                const th = document.createElement('th');
                th.textContent = cell || 'Unnamed';
                
                // Check if the current cell is part of a merged region
                mergeCells.forEach(merge => {
                    if (merge.s.c === index && merge.s.r === 0) {
                        // Merge cells
                        th.rowSpan = merge.e.r - merge.s.r + 1;
                        th.colSpan = merge.e.c - merge.s.c + 1;
                    }
                });

                headerRow.appendChild(th);
            });

            // Create the body of the table
            const tbody = table.createTBody();
            jsonData.slice(1).forEach((row, rowIndex) => {
                const tr = tbody.insertRow();
                row.forEach((cell, cellIndex) => {
                    const td = document.createElement('td');
                    td.textContent = cell || ''; // Keep empty cells as empty
                    td.classList.add('editable');
                    td.contentEditable = true;
                    td.addEventListener('input', function() {
                        updateCellData(workbook, sheetName, rowIndex + 1, cellIndex, td.textContent);
                    });
                    tr.appendChild(td);
                });
            });
        }

        // Update the cell data when it's edited
        function updateCellData(workbook, sheetName, rowIndex, cellIndex, newValue) {
            const sheet = workbook.Sheets[sheetName];
            const cellAddress = XLSX.utils.encode_cell({ r: rowIndex, c: cellIndex });
            sheet[cellAddress] = { v: newValue };
            saveToLocalStorage(workbook);
        }

        // Save data to localStorage to retain it after page reload
        function saveToLocalStorage(workbook) {
            const data = XLSX.write(workbook, { bookType: 'xlsx', type: 'array' });
            localStorage.setItem('excelData', JSON.stringify(Array.from(new Uint8Array(data))));
        }

        // Load data from localStorage if available
        function loadFromLocalStorage() {
            const storedData = localStorage.getItem('excelData');
            if (storedData) {
                const data = new Uint8Array(JSON.parse(storedData));
                workbook = XLSX.read(data, { type: 'array' });
                populateSheetSelect(workbook);
                displaySheet(workbook, workbook.SheetNames[0]);
            }
        }

        // Load from localStorage on page load
        window.onload = loadFromLocalStorage;

        // Delete file (clear everything)
        document.getElementById('deleteFileBtn').addEventListener('click', function() {
            workbook = null;
            document.getElementById('excelDataContainer').innerHTML = '';
            document.getElementById('sheetSelect').innerHTML = '<option value="">Select a sheet</option>';
            localStorage.removeItem('excelData');
            document.getElementById('deleteFileBtn').style.display = 'none';
            document.getElementById('upload').value = ''; // Clear the file input
        });

        // Filter table based on Dusun
        function filterTable() {
            const searchValue = document.getElementById('searchDusun').value.toLowerCase();
            const rows = document.querySelectorAll('table tbody tr');
            rows.forEach(row => {
                const dusunCell = row.cells[0]; // Assuming the first column is Dusun
                if (dusunCell && dusunCell.textContent.toLowerCase().includes(searchValue)) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });
        }
    </script>
</body>
</html>
