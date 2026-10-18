import juego.juego
import personaje.Personaje
import Powerup.*

object administracionEntidades {
  const enemigos = []
  var cantidadEnemigosDerrotados = 0
  var cantidadEnemigosAñadidos = 0
  
  //los enemigos se mueven cada 1 segundo
  const tickMovimientoEnemigos = game.tick(1000, {self.moverEnemigos()}, false)
  //cada 100 milisegundos se mueven las balas disparadas por el personaje
  const tickMovimientoBalas= game.tick(100, {self.moverBalas()}, false)

  method personaje() = juego.personaje()
  method nivelActual() = juego.nivelActual()

  //Metodos para los tests
  method cantidadEnemigosAñadidos() = cantidadEnemigosAñadidos
  method getCantidadEnemigos() = enemigos.size()
  method enemigos() = enemigos
  
  method reiniciarContador() {
    cantidadEnemigosAñadidos = 0
  }

  method moverEnemigos() {
    enemigos.forEach({enemigo => enemigo.moverse(self.personaje())})
  }

  method añadirEnemigo() {
	  if(cantidadEnemigosAñadidos < self.nivelActual().cantidadEnemigosRonda()) { 
		
      // se crea una instancia del enemigo aleatorio de la lista de posibles enemigos
      const nuevoEnemigo = self.nivelActual().enemigosPosibles().anyOne().apply()
      nuevoEnemigo.generarPosInicial()
      enemigos.add(nuevoEnemigo)
      game.addVisual(nuevoEnemigo)

      game.onCollideDo(nuevoEnemigo, {objeto => objeto.chocarConElEnemigo(nuevoEnemigo)})
      cantidadEnemigosAñadidos+=1

	  }else {
		  game.removeTickEvent("crearEnemigos")
	  }
  }

  method eliminarEnemigo(enemigo) {
    enemigos.remove(enemigo)
    cantidadEnemigosDerrotados += 1
    if(cantidadEnemigosDerrotados == self.nivelActual().cantidadEnemigosRonda()) {
      cantidadEnemigosDerrotados = 0
      cantidadEnemigosAñadidos = 0
      juego.terminarNivel()
    }
  }

  method moverBalas() {
	self.personaje().balas().forEach({bala => bala.mover()})
  }

  method eliminarBala(bala) {
	self.personaje().balas().remove(bala)
  }

  method iniciarTicks() {
    tickMovimientoBalas.start()
    tickMovimientoEnemigos.start()		
  }

  method frenarTicks() {
    tickMovimientoBalas.stop()
    tickMovimientoEnemigos.stop()
  }

  method eliminarTicks() {
    game.removeTickEvent("crearEnemigos")
    game.removeTickEvent("crearPowerUps")
  }

  const powerUpsPosibles = [
    { => new PuaDeGuitarra() }, 
    { => new Lentes() }
  ]

  method añadirPowerUp() {
    const nuevoPowerUp = powerUpsPosibles.anyOne().apply()
      
    nuevoPowerUp.generarPosInicial()
    game.addVisual(nuevoPowerUp)
      
    game.onCollideDo(nuevoPowerUp, { objeto => nuevoPowerUp.serAgarradoPor(objeto) })
    
  }

  method reiniciar() {
    enemigos.clear()
    cantidadEnemigosDerrotados = 0
    cantidadEnemigosAñadidos = 0
  }

}