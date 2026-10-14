import Enemigo.*
import wollok.game.*

class Nivel {
     const cantidadEnemigosRonda
     const tickAparicionEnemigos
     const image
     const position = game.origin()
     const enemigosPosibles = [{=> new LoboSuelto()}] //con esto al hacer apply() 
     //con el anyOne se crea una nueva instancia de enemigo
     method enemigosPosibles()= enemigosPosibles
     method tickAparicionEnemigos() = tickAparicionEnemigos
     method cantidadEnemigosRonda() = cantidadEnemigosRonda
     method image()= image
     method position() = position
}
