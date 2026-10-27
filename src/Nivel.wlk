import Enemigo.*
import wollok.game.*

class Nivel {
     var nivelAnterior
     var nivelSiguiente
     
     method nivelAnterior() = nivelAnterior
     method nivelSiguiente() = nivelSiguiente

     method nivelAnterior(nuevoNivelAnterior) {
         nivelAnterior = nuevoNivelAnterior
     }

     method nivelSiguiente(nuevoNivelSiguiente) {
         nivelSiguiente = nuevoNivelSiguiente
     }
     const cantidadEnemigosRonda
     const tickAparicionEnemigos
     const image
     const position = game.origin()
     const enemigosPosibles = [{=> new LoboSuelto()}, {=> new CorderoAtado()}, {=> new BarbaAzul()}] //con esto al hacer apply() 
     //con el anyOne se crea una nueva instancia de enemigo
     method enemigosPosibles()= enemigosPosibles
     method tickAparicionEnemigos() = tickAparicionEnemigos
     method cantidadEnemigosRonda() = cantidadEnemigosRonda
     method image()= image
     method position() = position
}
