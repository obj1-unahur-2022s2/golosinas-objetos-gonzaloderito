import golosinas.*
object mariano {
	var golosinas = []
	var golosinasDesechadas = []
	
	method comprar(unaGolosina) {golosinas.add(unaGolosina)}
	method comprarVarias(lista) {golosinas.addAll(lista)}
	method vaciarBolsa() {golosinas.clear()}
	method desechar(unaGolosina) {golosinas.remove(unaGolosina) golosinasDesechadas.add(unaGolosina)}
	method cantidadDeGolosinas() = golosinas.size()
	method tieneLaGolosina(unaGolosina) = golosinas.contains(unaGolosina)
	method probarGolosinas() {
		golosinas.forEach({g => g.mordisco() console.printIn("peso :"g.gusto()+ "")})
	}
	method hayGolosinasSinTacc() =
				golosinas.any({g => g.libreGluten()})
	
	method hayGolosinasSinTaccConAll() =
				!golosinas.all({g => !g.libreGluten()})
	
	method preciosCuidados() = 
				golosinas.all{g => g.precio() <= 10}
	
	// con .any			
	//method preciosCuidados() = 
	//			!golosinas.any{g => g.precio() > 10}
	
	method golosinaDeUnSabor(unSabor) =
				golosinas.find({g => g.gusto() == unSabor})
				
	method golosinaDeSabor(unSabor) =
				golosinas.filter{g => g.gusto() == unSabor}
				
	method sabores() = golosinas.map({g => g.gusto()}).asSet() 

	method golosinaMasCara() = 
				golosinas.max({g => g.precio()})
				
	method precioGolosinaMasCara() = self.golosinaMasCara().precio()


	method pesoGolosina() = golosinas.sum({g => g.peso()})
	
	method golosinasFaltantes(golosinasDeseadas) =
				golosinasDeseadas.asSet().difference(golosinas.asSet())
				
	method golosinasFaltantes2(golosinasDeseadas) =
				golosinas.asSet().difference(golosinasDeseadas.asSet())
				
	method gustosFaltantes(gustosDeseados) =
				gustosDeseados.asSet().difference(self.sabores())
				
				
	method gastoEn(sabor) = self.golosinaDeSabor(sabor).sum({g => g.precio()})
	
	method precioGolosinaMasCaraDeUnSabor(sabor) =
				self.golosinaDeSabor(sabor).max({g => g.precio()}).precio()
	
	method cantidadGolosinasDeUnSabor(unSabor) = 
				self.golosinaDeSabor(unSabor).size()
				
	method saborMasPopular() = 
				self.sabores().max({sabor => self.cantidadGolosinasDeUnSabor(sabor)})
				
	method comproYDesecho(golosina)=
				golosinasDesechadas.contains(golosina)
			
				
				
				
	




}