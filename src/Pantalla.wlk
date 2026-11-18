import wollok.game.*
import personaje.*
import juego.juego

class Pantalla{
    var property position = game.origin()

    method image()
    method musica()

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
    const musica = "menuInicial.mp3"
    override method image() = spriteMenu
    const personajes = [indio, skay, semilla, sergio, walter]
    var property personajeSeleccionado = 0

    override method musica() = musica

    override method apretarEnter (){
        game.removeVisual(self)
        game.addVisual(pantallaControles)
        juego.pantalla(pantallaControles)
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

object pantallaControles inherits Pantalla {
    override method image() = "pantallaControles.png"
   

    override method apretarEnter() {
        game.removeVisual(self)
        juego.cambiarPersonaje(pantallaInicial.obtenerPersonajeActual())
        juego.iniciar()
        }

    const musica = "menuInicial.mp3"
    override method musica() = musica
}

object gameOver inherits Pantalla{
    var cancionPosible = ["perdido1.mp3", "perdido2.mp3"];
    const musica = cancionPosible.anyOne()

    override method image() = "pantallaPerdido.png"

    override method apretarR() {
        game.removeVisual(self)
        juego.cambiarPersonaje(pantallaInicial.obtenerPersonajeActual())
        juego.reiniciarDesdeNivel1()
        }

    override method apretarEnter() {
        game.removeVisual(self)
        game.addVisual(pantallaInicial)
        juego.cambiarPantalla(pantallaInicial)
        }

    override method musica() = musica


}

object pantallaWin inherits Pantalla{
    const musica = "ganado1.mp3"
    override method image() = "pantallaVictoria.png"
    
    override method apretarEnter() {
        game.removeVisual(self)
        game.addVisual(pantallaInicial)
        juego.cambiarPantalla(pantallaInicial)
    }

    override method musica() = musica
}

object pantallaFinRonda inherits Pantalla{
    override method image() = "pantallaFinRonda.png"
    const musica = "salando.mp3"

   
    override method apretarEnter() {
    game.removeVisual(self)
    juego.cambiarPersonaje(pantallaInicial.obtenerPersonajeActual())
    juego.arrancarNuevoNivel()
    }

    override method musica() = musica
}
