import Enemigo.*

class Nivel {
     const cantidadEnemigosRonda
     const tickAparicionEnemigos
     const fondo
     const enemigosPosibles = [{=> new LoboSuelto()}] //con esto al hacer apply() 
     //con el anyOne se crea una nueva instancia de enemigo
     method enemigosPosibles()= enemigosPosibles
     method tickAparicionEnemigos() = tickAparicionEnemigos
     method cantidadEnemigosRonda() = cantidadEnemigosRonda
     method fondo()= fondo
}
