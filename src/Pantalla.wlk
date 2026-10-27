import wollok.game.*
import personaje.*
import juego.juego
class Pantalla{
    var property position = game.origin()

    method image(){}

    method apretarEnter(){}
    method apretarR(){}
    method apretarDerecha(){}
    method apretarIzquierda(){}
    method apretarArriba(){}
    method apretarAbajo(){}
    method obtenerPersonajeActual() {}
}

object pantallaInicial inherits Pantalla{
    var property spriteMenu = "pantallaInicial0.png"
    override method image() = spriteMenu
    const personajes = [indio, skay, semilla, sergio, walter]
    var property personajeSeleccionado = 0

    override method apretarEnter (){
        game.removeVisual(self)
        juego.cambiarPersonaje(self.obtenerPersonajeActual())
        juego.pantalla()
        juego.iniciar()
    }

    method avanzarPersonaje() {
        personajeSeleccionado = personajeSeleccionado + 1
        if(personajeSeleccionado >= (personajes.size())){
            personajeSeleccionado = 0
        }

        spriteMenu = "pantallaInicial" + personajeSeleccionado + ".png"

    }
    override method apretarDerecha(){
        self.avanzarPersonaje()    
    }

    method retrocederPersonaje() {
        personajeSeleccionado = personajeSeleccionado - 1
        if(personajeSeleccionado < 0){
            personajeSeleccionado = (personajes.size() - 1)
        }

        spriteMenu = "pantallaInicial" + personajeSeleccionado + ".png"
    }

    override method apretarIzquierda(){
        self.retrocederPersonaje()
    }

    override method obtenerPersonajeActual() = personajes.get(personajeSeleccionado)
}

object gameOver inherits Pantalla{
    override method image() = "pantallaPerdido.png"
    override method apretarEnter() {
        game.removeVisual(self)
        juego.pantalla()
        juego.reiniciarDesdeNivel1()
        }

    override method apretarR() {
        game.removeVisual(self)
        game.addVisual(pantallaInicial)
        juego.pantalla(pantallaInicial)
        }


}

object pantallaWin inherits Pantalla{
    override method image() = "pantallaVictoria.png"
    override method apretarEnter() {
        game.removeVisual(self)
        game.addVisual(pantallaInicial)
        juego.pantalla(pantallaInicial)
    }
}

object pantallaFinRonda inherits Pantalla{
    override method image() = "pantallaFinRonda.png"
   
    override method apretarEnter() {
    game.removeVisual(self)
    juego.pantalla()
    juego.arrancarNuevoNivel()
    }
}