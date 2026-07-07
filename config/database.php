<?php
// ============================================================
// config/database.php — Conexión a MySQL
// Compatible con XAMPP (local) y Railway (producción)
// ============================================================

// Railway usa variables de entorno; XAMPP usa valores por defecto
define('DB_HOST',    getenv('MYSQLHOST')     ?: 'localhost');
define('DB_USER',    getenv('MYSQLUSER')     ?: 'root');
define('DB_PASS',    getenv('MYSQLPASSWORD') ?: 'Gabo2025*');
define('DB_NAME',    getenv('MYSQLDATABASE') ?: 'tienda_deportiva');
define('DB_PORT',    getenv('MYSQLPORT')     ?: '3306');
define('DB_CHARSET', 'utf8mb4');

function getConnection(): PDO {
    static $pdo = null;
    if ($pdo === null) {
        $dsn = "mysql:host=" . DB_HOST . ";port=" . DB_PORT . ";dbname=" . DB_NAME . ";charset=" . DB_CHARSET;
        $options = [
            PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            PDO::ATTR_EMULATE_PREPARES   => false,
        ];
        try {
            $pdo = new PDO($dsn, DB_USER, DB_PASS, $options);
        } catch (PDOException $e) {
            die('<div style="font-family:Arial;color:#c0392b;padding:20px;">
                 <h2>Error de conexión</h2><p>' . $e->getMessage() . '</p></div>');
        }
    }
    return $pdo;
}
