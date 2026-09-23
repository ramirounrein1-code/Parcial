<?php
/**
 * componentes/nav-inferior.php
 * Barra de navegación inferior fija. Antes estaba duplicada (con sus
 * 4 <li> y el if/else de "Reservas o Recomendaciones" / "Perfil o
 * Perfil de profesor") en 7 archivos distintos.
 *
 * Variables que tiene que definir la página ANTES del require:
 *   $navActivo         (string) Cuál ítem va marcado como activo:
 *                      'inicio' | 'catalogo' | 'reservas' | 'perfil'.
 *                      ('reservas' también cubre "Recomendaciones",
 *                      que ocupa el mismo lugar cuando hay un profesor
 *                      logueado.)
 *   $haySesionProfesor (bool) Ya suele estar definida en la página;
 *                      decide si el 3er y 4to ítem apuntan a las
 *                      pantallas de profesor o de alumno.
 */
$navActivo = $navActivo ?? '';
$haySesionProfesor = $haySesionProfesor ?? false;

function navClase(string $item, string $activo): string
{
    return 'navegacion-inferior__item' . ($item === $activo ? ' navegacion-inferior__item--activo' : '');
}
?>
<nav class="navegacion-inferior" aria-label="Navegación principal">
    <ul>
        <li><a href="index.php" class="<?= navClase('inicio', $navActivo) ?>"><svg viewBox="0 0 24 24">
                    <polyline points="3,11 7.5,7.5 12,4 16.5,7.5 21,11" />
                    <polyline points="5,10 5,15 5,20 12,20 19,20 19,15 19,10" />
                </svg><span>Inicio</span></a></li>
        <li><a href="catalogo.php" class="<?= navClase('catalogo', $navActivo) ?>"><svg viewBox="0 0 24 24">
                    <polygon points="3,3 10,3 10,10 3,10" />
                    <polygon points="14,3 21,3 21,10 14,10" />
                    <polygon points="3,14 10,14 10,21 3,21" />
                    <polygon points="14,14 21,14 21,21 14,21" />
                </svg><span>Catálogo</span></a></li>
        <?php if ($haySesionProfesor): ?>
            <li><a href="Recomendar.php" class="<?= navClase('reservas', $navActivo) ?>"><svg viewBox="0 0 24 24">
                        <polygon points="12,3 14.12,9.09 20.56,9.22 15.42,13.11 17.29,19.28 12,15.6 6.71,19.28 8.58,13.11 3.44,9.22 9.88,9.09" />
                    </svg><span>Recomendaciones</span></a></li>
        <?php else: ?>
            <li><a href="Reservas.php" class="<?= navClase('reservas', $navActivo) ?>"><svg viewBox="0 0 24 24">
                        <polygon points="6,3 12,3 18,3 18,12 18,21 15,19 12,17 9,19 6,21" />
                    </svg><span>Reservas</span></a></li>
        <?php endif; ?>
        <?php if ($haySesionProfesor): ?>
            <li><a href="Perfilprofesor.php" class="<?= navClase('perfil', $navActivo) ?>"><svg viewBox="0 0 24 24">
                        <ellipse cx="12" cy="8" rx="4" ry="4" />
                        <polyline
                            points="4,21 4.35,20.08 4.76,19.25 5.22,18.51 5.72,17.84 6.26,17.26 6.83,16.75 7.44,16.31 8.06,15.94 8.71,15.64 9.36,15.4 10.03,15.22 10.69,15.1 11.35,15.02 12,15 12.65,15.02 13.31,15.1 13.97,15.22 14.64,15.4 15.29,15.64 15.94,15.94 16.56,16.31 17.17,16.75 17.74,17.26 18.28,17.84 18.78,18.51 19.24,19.25 19.65,20.08 20,21" />
                    </svg><span>Perfil</span></a></li>
        <?php else: ?>
            <li><a href="Perfil.php" class="<?= navClase('perfil', $navActivo) ?>"><svg viewBox="0 0 24 24">
                        <ellipse cx="12" cy="8" rx="4" ry="4" />
                        <polyline
                            points="4,21 4.35,20.08 4.76,19.25 5.22,18.51 5.72,17.84 6.26,17.26 6.83,16.75 7.44,16.31 8.06,15.94 8.71,15.64 9.36,15.4 10.03,15.22 10.69,15.1 11.35,15.02 12,15 12.65,15.02 13.31,15.1 13.97,15.22 14.64,15.4 15.29,15.64 15.94,15.94 16.56,16.31 17.17,16.75 17.74,17.26 18.28,17.84 18.78,18.51 19.24,19.25 19.65,20.08 20,21" />
                    </svg><span>Perfil</span></a></li>
        <?php endif; ?>
    </ul>
</nav>
