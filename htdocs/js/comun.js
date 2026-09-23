/**
 * js/comun.js
 * Comportamiento compartido por (casi) toda la app. Antes cada pantalla
 * tenía su propia copia de este mismo código pegada al final del HTML;
 * ahora vive acá una sola vez.
 *
 *  1) Botón "volver": cualquier elemento con [data-volver="algo.php"]
 *     navega ahí al hacer click (lo pinta componentes/encabezado-volver.php).
 *
 *  2) Pantallas "app-shell" (el <main> tiene [data-shell-fijo]): la
 *     página en sí no se desliza, solo lo hace el bloque interno con su
 *     propio overflow-y:auto (la descripción del libro, el perfil, el
 *     formulario de login...). Fijamos html/body para evitar el
 *     "rebote" de goma elástica de iOS Safari al arrastrar el dedo.
 *     Si aun así el contenido no entrara entero (una descripción muy
 *     larga, letra grande de accesibilidad, etc.), el propio bloque
 *     principal puede scrollear un poco más como red de seguridad
 *     (ver la regla `overflow-y: auto` en Detalle.css/Perfil.css/Auth.css):
 *     así nunca queda nada inalcanzable, que era el bug original.
 *
 *  3) Refresco al volver del bfcache: si el usuario vuelve a una de
 *     estas pantallas con el botón "atrás" del navegador, el HTML
 *     cacheado puede mostrar datos viejos (una reserva que ya se
 *     canceló desde otra pestaña, por ejemplo). Recargamos para traer
 *     el estado real.
 */
(function () {
    document.addEventListener('DOMContentLoaded', function () {
        var botonVolver = document.querySelector('[data-volver]');
        if (botonVolver) {
            botonVolver.addEventListener('click', function () {
                window.location.href = botonVolver.getAttribute('data-volver');
            });
        }

        var shellFijo = document.querySelector('[data-shell-fijo]');
        if (shellFijo) {
            var raiz = document.documentElement;
            raiz.style.overflow = 'hidden';
            raiz.style.height = '100%';
            document.body.style.overflow = 'hidden';
            document.body.style.position = 'fixed';
            document.body.style.height = '100%';
            document.body.style.width = '100%';
        }
    });

    window.addEventListener('pageshow', function (evento) {
        if (evento.persisted) {
            window.location.reload();
        }
    });
})();
