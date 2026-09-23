<?php
/**
 * componentes/encabezado-volver.php
 * Encabezado con botón "volver" + título centrado. Antes cada pantalla
 * repetía el mismo <svg> de flecha y su propio <script> para engancharle
 * el click (ver js/comun.js, que ahora lo hace una sola vez para toda
 * la app a partir del atributo data-volver).
 *
 * Variables:
 *   $tituloEncabezado    (string) Texto del <h1>.
 *   $volverHref          (string) A dónde va el botón "volver".
 *                        Por defecto 'index.php'.
 *   $mostrarBotonVolver  (bool)  Si es false, no dibuja el botón y deja
 *                        un relleno invisible en su lugar para que el
 *                        título siga centrado (lo usa PerfilProfesor.php,
 *                        que no tiene a dónde "volver" dentro del panel
 *                        docente).
 */
$volverHref = $volverHref ?? 'index.php';
$mostrarBotonVolver = $mostrarBotonVolver ?? true;
?>
<header class="encabezado-detalle">
    <?php if ($mostrarBotonVolver): ?>
        <button type="button" class="boton-volver" data-volver="<?= htmlspecialchars($volverHref) ?>" aria-label="Volver">
            <svg viewBox="0 0 24 24" aria-hidden="true">
                <polyline points="15,4 9,12 15,20" />
            </svg>
        </button>
    <?php else: ?>
        <span class="encabezado-detalle__relleno" aria-hidden="true"></span>
    <?php endif; ?>
    <h1><?= htmlspecialchars($tituloEncabezado ?? '') ?></h1>
    <span class="encabezado-detalle__relleno" aria-hidden="true"></span>
</header>
