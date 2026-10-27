import wollok.game.*
import personaje.*

object pantallaInicial{
    var property position = game.origin()
    var property spriteMenu = "pantallaInicial0.png"
    method image() = spriteMenu
    const personajes = [indio, skay, semilla, sergio, walter]
    var property personajeSeleccionado = 0

    method apretarEnter (unJuego){
        game.removeVisual(self)
        unJuego.cambiarPersonajeActual(self.obtenerPersonajeActual())
        unJuego.pantalla(unJuego)
        unJuego.iniciar()
    }

    method avanzarPersonaje() {
        personajeSeleccionado = personajeSeleccionado + 1
        if(personajeSeleccionado >= (personajes.size())){
            personajeSeleccionado = 0
        }

        spriteMenu = "pantallaInicial" + personajeSeleccionado + ".png"

    }

    method apretarDerecha(unJuego){
        self.avanzarPersonaje()    
        }

    method retrocederPersonaje() {
        personajeSeleccionado = personajeSeleccionado - 1
        if(personajeSeleccionado < 0){
            personajeSeleccionado = (personajes.size() - 1)
        }

        spriteMenu = "pantallaInicial" + personajeSeleccionado + ".png"
    }

    method apretarIzquierda(unJuego){
        self.retrocederPersonaje()
    }
    method apretarR(unJuego){}
    method apretarArriba(unJuego){}
    method apretarAbajo(unJuego){}
    method apretarW(unJuego){}
    method apretarA(unJuego){}
    method apretarS(unJuego){}
    method apretarD(unJuego){}

    method obtenerPersonajeActual() = personajes.get(personajeSeleccionado)
}

object gameOver{
    var property position = game.origin()
    method image() = "pantallaPerdido.png"
    method apretarEnter(unJuego) {
        game.removeVisual(self)
        unJuego.pantalla(unJuego)
        unJuego.reiniciar()
        }
    method apretarR(unJuego) {
        game.removeVisual(self)
        game.addVisual(pantallaInicial)
        unJuego.pantalla(pantallaInicial)
        }
    method apretarDerecha(unJuego){}
    method apretarIzquierda(unJuego){}
    method apretarArriba(unJuego){}
    method apretarAbajo(unJuego){}
    method apretarW(unJuego){}
    method apretarA(unJuego){}
    method apretarS(unJuego){}
    method apretarD(unJuego){}
}

object pantallaWin{
    var property position = game.origin()
    method image() = "pantallaVictoria.png"
    method apretarEnter(unJuego) {
        game.removeVisual(self)
        game.addVisual(pantallaInicial)
        unJuego.pantalla(pantallaInicial)
        }
    method apretarR(unJuego){}
    method apretarDerecha(unJuego){}
    method apretarIzquierda(unJuego){}
    method apretarArriba(unJuego){}
    method apretarAbajo(unJuego){}
    method apretarW(unJuego){}
    method apretarA(unJuego){}
    method apretarS(unJuego){}
    method apretarD(unJuego){}
}

object pantallaFinRonda {
    var property position = game.origin()
    method image() = "pantallaFinRonda.png"
    method apretarEnter(unJuego) {
    game.removeVisual(self)
    unJuego.pantalla(unJuego)
    unJuego.arrancarNuevoNivel()
    }
    method apretarR(unJuego){}
    method apretarDerecha(unJuego){}
    method apretarIzquierda(unJuego){}
    method apretarArriba(unJuego){}
    method apretarAbajo(unJuego){}
    method apretarW(unJuego){}
    method apretarA(unJuego){}
    method apretarS(unJuego){}
    method apretarD(unJuego){}
}