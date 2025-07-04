/*
 * Los sabores
 */
object frutilla { }
object chocolate { }
object vainilla { }
object naranja { }
object limon { }


/*
 * Golosinas
 */
class Bombon {
	var peso = 15
	
	method precio() { return 5 }
	method peso() { return peso }
	method mordisco() { peso = peso * 0.8 - 1 }
	method sabor() { return frutilla }
	method libreGluten() { return true }
}

class BombonesDuros inherits Bombon {
	override method mordisco() {peso = peso - 1}
	method gradoDeDureza() {
		var dureza = 1
		if (peso >= 8 and peso <= 12) {
			dureza = 2
		}
		else if (peso > 12) {
			dureza = 3
		}
		return dureza
	}
}

class Alfajor {
	var peso = 15
	
	method precio() { return 12 }
	method peso() { return peso }
	method mordisco() { peso = peso * 0.8 }
	method sabor() { return chocolate }
	method libreGluten() { return false }
}

class Caramelo {
	var peso = 5
	var property sabor = frutilla
	method precio() { return 12 }
	method peso() { return peso }
	method mordisco() { peso = peso - 1 }
	method libreGluten() { return true }
}

class CarameloRelleno inherits Caramelo{
	override method precio() = 13
	override method mordisco() {
		super()
		sabor = chocolate
	}
}

class Chupetin {
	var peso = 7
	
	method precio() { return 2 }
	method peso() { return peso }
	method mordisco() { 
		if (peso >= 2) {
			peso = peso * 0.9
		}
	}
	method sabor() { return naranja }
	method libreGluten() { return true }
}

class Oblea {
	var peso = 250
	
	method precio() { return 5 }
	method peso() { return peso }
	method mordisco() {
		if (peso >= 70) {
			// el peso pasa a ser la mitad
			peso = peso * 0.5
		} else { 
			// pierde el 25% del peso
			peso = peso - (peso * 0.25)
		}
	}	
	method sabor() { return vainilla }
	method libreGluten() { return false }
}

class ObleasCrocantes inherits Oblea {
	var cantMordiscos = 0
	override method mordisco() {
		super()
		if (cantMordiscos <= 3) {
			peso -= 3
			cantMordiscos += 3
		}
	}
	method estaDebil() = cantMordiscos > 3
}


class Chocolatin {
	// hay que acordarse de *dos* cosas, el peso inicial y el peso actual
	// el precio se calcula a partir del precio inicial
	// el mordisco afecta al peso actual
	var pesoInicial
	var comido = 0
	
	method pesoInicial(unPeso) { pesoInicial = unPeso }
	method precio() { return pesoInicial * 0.50 }
	method peso() { return (pesoInicial - comido).max(0) }
	method mordisco() { comido = comido + 2 }
	method sabor() { return chocolate }
	method libreGluten() { return false }

}
class ChocolatinVip inherits Chocolatin {
	var estaEnHeladera = false
	method guardarEnHeladera() {estaEnHeladera = true}
	method sacarDeHeladera() {estaEnHeladera = false}
	method humedad() {
		var humedad = 0
		if (estaEnHeladera) {
			humedad = 0.randomUpTo(1)
		}
		return humedad
	}
	override method peso() = super() + self.humedad()
}
class ChocolatinesPremium inherits ChocolatinVip {
	override method humedad() {
		return super() / 2
	}
}

class GolosinaBaniada {
	var golosinaInterior
	var pesoBanio = 4
	
	method golosinaInterior(unaGolosina) { golosinaInterior = unaGolosina }
	method precio() { return golosinaInterior.precio() + 2 }
	method peso() { return golosinaInterior.peso() + pesoBanio }
	method mordisco() {
		golosinaInterior.mordisco()
		pesoBanio = (pesoBanio - 2).max(0) 
	}	
	method sabor() { return golosinaInterior.sabor() }
	method libreGluten() { return golosinaInterior.libreGluten() }	
}


class Tuttifrutti {
	var libreDeGluten
	const sabores = [frutilla, chocolate, naranja]
	var saborActual = 0
	
	method mordisco() { saborActual += 1 }	
	method sabor() { return sabores.get(saborActual % 3) }	

	method precio() { return (if(self.libreGluten()) 7 else 10) }
	method peso() { return 5 }
	method libreGluten() { return libreDeGluten }	
	method libreGluten(valor) { libreDeGluten = valor }
}