<?php
/**
 * Cursos.php
 * Lista fija de cursos para los que un profesor puede recomendar un libro.
 * Es una lista fija (1ro a 4to) en vez de salir de una consulta a la
 * tabla `estudiante`, para que el desplegable de "Recomendar libro"
 * siempre tenga opciones aunque todavía no haya alumnos cargados en
 * algún curso.
 *
 * Para sumar más cursos (por ejemplo con división, "1ro A", "1ro B",
 * etc.) alcanza con agregarlos acá; se ven automáticamente en
 * Detalle.php y se aceptan en Recomendarlibro.php sin tocar nada más.
 */
$CURSOS = ['1ro', '2do', '3ro', '4to'];