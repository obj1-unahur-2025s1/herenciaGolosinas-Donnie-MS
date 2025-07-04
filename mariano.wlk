import golosinas.*
/*
Bañar Golosina
Hacer que Mariano entienda el mensaje baniar(unaGolosina). 
El método construye una nueva golosina bañada y la agrega a la colección de las golosinas que compró Mariano.

Pensar, haciendo un diagrama de objetos, qué pasa si:

la golosina ya era parte de la colección.
se baña una golosina ya bañada.
*/
object mariano {
	const golosinas = []
	method baniar(unaGolosina) {
		var golosinaBaniada = new GolosinaBaniada(golosinaInterior = unaGolosina)
		golosinas.add(golosinaBaniada)
	}
	method comprar(_golosina) { golosinas.add(_golosina) }
	
	method desechar (_golosina) { golosinas.remove(_golosina) }
	
	method golosinas() { return golosinas }
	method primerGolosina() { return golosinas.first() }
	method ultimaGolosina() { return golosinas.last() }
	
	method pesoGolosinas() { 
		return golosinas.sum({ golo => golo.peso() })
	}
	
	method probarGolosinas() {
		golosinas.forEach( {_golosina => _golosina.mordisco() } )
	}
	
	method golosinaMasPesada() { 
		return golosinas.max({ golo => golo.peso() })
	}
	
	method hayGolosinaSinTACC() {
		return golosinas.any({ _golosina => _golosina.libreGluten()}) 
	}
	
	method preciosCuidados() {
		return golosinas.all({ _golosina => _golosina.precio() < 10}) 
	}
	
	
	
	method golosinaDeSabor(_sabor) {
		return golosinas.find({ golosina => golosina.sabor() == _sabor })
	}
	
	method golosinasDeSabor(_sabor) {
		return golosinas.filter({ golosina => golosina.sabor() == _sabor })
	}
	
	method sabores() {
		return golosinas.map({ golosina => golosina.sabor() }).asSet()
	}



	method golosinaMasCara() {
		return golosinas.max( { _golosina => _golosina.precio() } )
	}

	method golosinasFaltantes(golosinasDeseadas) {
		return golosinasDeseadas.difference(golosinas)	
	}


	method saboresFaltantes(_saboresDeseados) {
		return _saboresDeseados.filter({_saborDeseado => ! self.tieneGolosinaDeSabor(_saborDeseado)})	
	}
	
	method tieneGolosinaDeSabor(_sabor) {
		return golosinas.any({_golosina => _golosina.sabor() == _sabor})
	}
}