import wollok.game.*
import personaje.*

object pantallaInicial{
    var property position = game.origin()
    var property spriteMenu = "pantallaInicial0.png"
    method image() = spriteMenu
    const personajes = [indio, skay]
    var property personajeSeleccionado = 0

    method avanzarPersonaje() {
        personajeSeleccionado = personajeSeleccionado + 1
        if(personajeSeleccionado >= (personajes.size())){
            personajeSeleccionado = 0
        }

        spriteMenu = "pantallaInicial" + personajeSeleccionado + ".png"

    }
    method retrocederPersonaje() {
        personajeSeleccionado = personajeSeleccionado - 1
        if(personajeSeleccionado < 0){
            personajeSeleccionado = (personajes.size() - 1)
        }

        spriteMenu = "pantallaInicial" + personajeSeleccionado + ".png"
    }

    method obtenerPersonajeActual() = personajes.get(personajeSeleccionado)
}

object gameOver{
    var property position = game.origin()
    method image() = "game_over.png"
}

object pantallaWin{
    var property position = game.origin()
    method image() = "pantalla_win.png"
}