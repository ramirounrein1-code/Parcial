<?php
/**
 * componentes/encabezado-logo.php
 * Encabezado con el logo de la biblioteca y, opcionalmente, el
 * indicador de sesión ("Invitado / Iniciar sesión", nombre del alumno,
 * o panel docente). Lo usan index.php y catalogo.php.
 *
 * Variables:
 *   $mostrarSesion      (bool) Si se dibuja el indicador de sesión a
 *                       la derecha. catalogo.php no lo mostraba antes,
 *                       así que por compatibilidad el default es true
 *                       pero cada página decide.
 *   $haySesion          (bool) Ya la define la página.
 *   $haySesionProfesor  (bool) Ya la define la página.
 */
$mostrarSesion = $mostrarSesion ?? true;
$haySesion = $haySesion ?? false;
$haySesionProfesor = $haySesionProfesor ?? false;
?>
<header class="encabezado">
    <a href="index.php" class="logotipo">
        <svg class="logotipo__icono" viewBox="0 0 48 48" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
            <polygon
                points="24,12 23.33,11.49 22.6,11.05 21.83,10.67 21.01,10.35 20.16,10.09 19.28,9.89 18.38,9.75 17.46,9.67 16.53,9.66 15.6,9.7 14.68,9.81 13.77,9.98 12.87,10.21 12,10.5 12,21.5 12,32.5 12.87,32.21 13.77,31.98 14.68,31.81 15.6,31.7 16.53,31.66 17.46,31.67 18.38,31.75 19.28,31.89 20.16,32.09 21.01,32.35 21.83,32.67 22.6,33.05 23.33,33.49 24,34 24.67,33.49 25.4,33.05 26.17,32.67 26.99,32.35 27.84,32.09 28.72,31.89 29.62,31.75 30.54,31.67 31.47,31.66 32.4,31.7 33.32,31.81 34.23,31.98 35.13,32.21 36,32.5 36,21.5 36,10.5 35.06,10.19 34.09,9.95 33.11,9.78 32.11,9.68 31.11,9.66 30.12,9.7 29.14,9.82 28.18,10 27.25,10.26 26.36,10.59 25.52,10.99 24.73,11.46 24,12" />
        </svg>
        <span class="logotipo__texto">Rincón<br>del Saber</span>
    </a>
    <?php if ($mostrarSesion): ?>
        <?php if ($haySesion): ?>
            <a href="Perfil.php" class="sesion-indicador">
                <span class="sesion-indicador__nombre"><?= htmlspecialchars($_SESSION['estudiante_nombre'] ?? '') ?></span>
                <span class="sesion-indicador__etiqueta">Ver perfil</span>
            </a>
        <?php elseif ($haySesionProfesor): ?>
            <a href="Recomendar.php" class="sesion-indicador">
                <span class="sesion-indicador__nombre"><?= htmlspecialchars($_SESSION['profesor_nombre'] ?? '') ?></span>
                <span class="sesion-indicador__etiqueta">Panel docente</span>
            </a>
        <?php else: ?>
            <a href="Login.php" class="sesion-indicador sesion-indicador--invitado">
                <span class="sesion-indicador__nombre">Invitado</span>
                <span class="sesion-indicador__etiqueta">Iniciar sesión</span>
            </a>
        <?php endif; ?>
    <?php endif; ?>
</header>
