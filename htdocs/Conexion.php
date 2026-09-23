<?php
/* ============================================
   conexion.php - CONEXIÓN A BASE DE DATOS
   Local XAMPP + Hosting InfinityFree
   ============================================ */

if ($_SERVER["HTTP_HOST"] === "localhost" || $_SERVER["HTTP_HOST"] === "127.0.0.1") {
    $host = "localhost";
    $base_datos = "mi-mejor-amigo";
    $usuario = "root";
    $contrasena = "";
} else {
    $host = "";
    $base_datos = "";
    $usuario = "";
    $contrasena = "";
}
try {
    $conexion = new PDO(
        "mysql:host=$host;dbname=$base_datos;charset=utf8mb4",
        $usuario,
        $contrasena
    );
    $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $error) {
    die("Error de conexión: " . $error->getMessage());
}
?>
