<?php

session_set_cookie_params(['path' => '/']);
session_start();

require 'Conexion.php';

$idLibro = isset($_POST['id_libro']) ? (int) $_POST['id_libro'] : 0;
$tipo = $_POST['tipo'] ?? '';

function volverADetalle(int $idLibro, array $parametros): void
{
    header('Location: Detalle.php?libro=' . $idLibro . '&' . http_build_query($parametros));
    exit;
}

if (!isset($_SESSION['estudiante_id'])) {
    volverADetalle($idLibro, ['error' => 'servidor']);
}

if ($idLibro <= 0 || !in_array($tipo, ['reserva', 'espera'], true)) {
    volverADetalle($idLibro, ['error' => 'libro_inexistente']);
}

$idEstudiante = (int) $_SESSION['estudiante_id'];

if ($tipo === 'reserva') {
    // Elimina el préstamo activo de este alumno para este libro (borrado real de la fila, no un cambio de estado).
    $borrarPrestamo = $conexion->prepare(
        'DELETE p FROM prestamo p
         JOIN ejemplar e ON e.id_ejemplar = p.Id_ejemplar
         WHERE e.id_libro = ? AND p.Id_estudiante = ? AND p.estado_prestamo = 1'
    );
    $borrarPrestamo->execute([$idLibro, $idEstudiante]);

    if ($borrarPrestamo->rowCount() === 0) {
        volverADetalle($idLibro, ['error' => 'nada_que_cancelar']);
    }

    volverADetalle($idLibro, ['ok' => 'cancelado']);
}

// tipo === 'espera': lo sacamos de la lista de espera.
$borrar = $conexion->prepare(
    'DELETE FROM lista_espera WHERE id_estudiante = ? AND id_libro = ?'
);
$borrar->execute([$idEstudiante, $idLibro]);

if ($borrar->rowCount() === 0) {
    volverADetalle($idLibro, ['error' => 'nada_que_cancelar']);
}

volverADetalle($idLibro, ['ok' => 'espera_cancelada']);
