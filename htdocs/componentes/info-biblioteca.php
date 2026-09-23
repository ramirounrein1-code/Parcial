<?php
/**
 * componentes/info-biblioteca.php
 * Bloque "Información de la biblioteca" (horario, ubicación, contacto)
 * que se repetía igual en Perfil.php y Perfilprofesor.php. El ítem de
 * "Contacto" ahora es un enlace de verdad a contacto.php, en vez de
 * texto suelto.
 */
?>
<section class="perfil-biblioteca">
    <h2 class="perfil-biblioteca__titulo">Información de la biblioteca</h2>
    <ul class="perfil-biblioteca__lista">
        <li class="perfil-biblioteca__item">
            <svg viewBox="0 0 24 24" aria-hidden="true">
                <ellipse cx="12" cy="12" rx="8.5" ry="8.5" />
                <polyline points="12,7.5 12,12 15.5,14" />
            </svg>
            <div>
                <p class="perfil-biblioteca__dato">Lunes a viernes, 8:00 a 18:00</p>
                <p class="perfil-biblioteca__etiqueta">Horario de atención</p>
            </div>
        </li>
        <li class="perfil-biblioteca__item">
            <svg viewBox="0 0 24 24" aria-hidden="true">
                <polygon points="12,3 21,9 21,21 3,21 3,9" />
                <polyline points="9,21 9,13 15,13 15,21" />
            </svg>
            <div>
                <p class="perfil-biblioteca__dato">Edificio central, planta baja</p>
                <p class="perfil-biblioteca__etiqueta">Ubicación</p>
            </div>
        </li>
        <li>
            <a href="contacto.php" class="perfil-biblioteca__item perfil-biblioteca__item--enlace">
                <svg viewBox="0 0 24 24" aria-hidden="true">
                    <polygon points="3,5 21,5 21,19 3,19" />
                    <polyline points="3,6 12,13 21,6" />
                </svg>
                <div>
                    <p class="perfil-biblioteca__dato">biblioteca@rincondelsaber.edu.ar</p>
                    <p class="perfil-biblioteca__etiqueta">Contacto · enviar un mensaje</p>
                </div>
                <svg class="perfil-menu__flecha" viewBox="0 0 24 24" aria-hidden="true">
                    <polyline points="9,4 15,12 9,20" />
                </svg>
            </a>
        </li>
    </ul>
</section>
