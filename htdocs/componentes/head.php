<?php
/**
 * componentes/head.php
 * <head> común a toda la app: metadatos, tipografías y hojas de estilo.
 * Antes esto estaba pegado (copiado y pegado) en las 13 páginas del
 * sitio, así que un cambio acá (por ejemplo agregar animaciones.css,
 * o el viewport-fit=cover que faltaba para el notch/Dynamic Island de
 * los iPhone con pantalla recortada) había que hacerlo 13 veces.
 *
 * Variables que puede definir la página ANTES del require:
 *   $titulo         (string) Texto que va antes de "· Rincón del Saber".
 *                   Si se omite, el <title> queda solo "Rincón del Saber".
 *   $cssExtra       (array)  Hojas de estilo propias de la página, además
 *                   de las dos base (style.css y Detalle.css, que usan
 *                   todas las pantallas). Ej: ['Perfil.css']
 *   $sinAnimaciones (bool)   Si es true, no se carga Animaciones.css.
 *                   Se usa en Perfil.php, Perfilprofesor.php, Login.php
 *                   y Loginprofesor.php: son pantallas de datos/formularios
 *                   donde no queremos ningún movimiento, a pedido.
 */
$titulo = $titulo ?? '';
$cssExtra = $cssExtra ?? [];
$sinAnimaciones = $sinAnimaciones ?? false;
?>
<head>
    <meta charset="UTF-8">
    <!-- viewport-fit=cover: deja que el fondo llegue hasta abajo/arriba
         de pantallas con notch o Dynamic Island (iPhone 14 Pro Max y
         similares) para que podamos acomodar nosotros el contenido con
         env(safe-area-inset-*) en vez de dejar una franja blanca fea. -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, viewport-fit=cover">
    <meta name="theme-color" content="#F5F3EE">
    <title><?= $titulo !== '' ? htmlspecialchars($titulo) . ' · ' : '' ?>Rincón del Saber</title>
    <link rel="icon" type="image/svg+xml" href="favicon.svg">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Zalando+Sans:wght@400;500;600;700&family=Arimo:wght@400;500;600;700&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="Detalle.css">
    <?php if (!$sinAnimaciones): ?>
        <link rel="stylesheet" href="Animaciones.css">
    <?php endif; ?>
    <?php foreach ($cssExtra as $hoja): ?>
        <link rel="stylesheet" href="<?= htmlspecialchars($hoja) ?>">
    <?php endforeach; ?>
</head>
