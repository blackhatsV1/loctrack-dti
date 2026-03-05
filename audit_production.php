<?php

$host = 'mysql-dti-loctrac-jayroldtabalina-wv-investment-economic-profil.j.aivencloud.com';
$port = '10583';
$db   = 'defaultdb';
$user = 'avnadmin';
$pass = getenv('DB_PASSWORD_AIVEN') ?: ''; // Use env variable or manual input for future reference
$charset = 'utf8mb4';

$dsn = "mysql:host=$host;port=$port;dbname=$db;charset=$charset";
$options = [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    PDO::ATTR_EMULATE_PREPARES   => false,
];

try {
     $pdo = new PDO($dsn, $user, $pass, $options);
} catch (\PDOException $e) {
     die("Connection failed: " . $e->getMessage());
}

echo "--- Production Audit Report ---\n";

// 1. Total Users Count (is_admin = 0)
$stmt = $pdo->query("SELECT COUNT(*) FROM users WHERE name != 'Master Admin' AND email NOT LIKE 'admin%'");
$count = $stmt->fetchColumn();
echo "Total Non-Admin Users: $count\n";

// 2. Total Users Count with is_admin flag
$stmt = $pdo->query("SELECT COUNT(*) FROM users WHERE is_admin = 0");
$countIsAdminZero = $stmt->fetchColumn();
echo "Users with is_admin = 0: $countIsAdminZero\n";

// 3. Admin Users
$stmt = $pdo->query("SELECT id, name, email FROM users WHERE is_admin = 1 OR email LIKE 'admin%'");
$admins = $stmt->fetchAll();
echo "Admin Users found: " . count($admins) . "\n";
foreach ($admins as $admin) {
    echo "  - {$admin['name']} ({$admin['email']})\n";
}

// 4. List all Non-Admin Users for comparison
$stmt = $pdo->query("SELECT name, email FROM users WHERE name != 'Master Admin' AND email NOT LIKE 'admin%' ORDER BY name ASC");
$users = $stmt->fetchAll();
echo "Listing all " . count($users) . " Non-Admin Users:\n";

$outputFile = 'production_users_list.txt';
$fh = fopen($outputFile, 'w');
foreach ($users as $user) {
    fwrite($fh, "{$user['name']}|{$user['email']}\n");
}
fclose($fh);

echo "Detailed user list saved to $outputFile\n";

// 5. Check for active processes
echo "\n--- Active Processes ---\n";
$stmt = $pdo->query("SHOW PROCESSLIST");
$processes = $stmt->fetchAll();
foreach ($processes as $proc) {
    echo "ID: {$proc['Id']} | User: {$proc['User']} | Host: {$proc['Host']} | DB: {$proc['db']} | Command: {$proc['Command']} | Time: {$proc['Time']} | State: {$proc['State']} | Info: " . (strlen($proc['Info']) > 50 ? substr($proc['Info'], 0, 50) . "..." : $proc['Info']) . "\n";
}
