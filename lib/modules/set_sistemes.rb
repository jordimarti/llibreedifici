module SetSistemes
	def set_sistemes
	  @edifici = Edifici.find(params[:edifici_id])
	  @fonamentacio = Fonamentacio.find(@edifici.fonamentacio.id)
	  @estructura = Estructura.find(@edifici.estructura.id)
	  @tancaments_vertical = TancamentsVertical.find(@edifici.tancaments_vertical.id)
	  @coberta = Coberta.find(@edifici.coberta.id)
	  @particio = Particio.find(@edifici.particio.id)
	  @sanejament = Sanejament.find(@edifici.sanejament.id)
	  @aigua = Aigua.find(@edifici.aigua.id)
	  @electricitat = Electricitat.find(@edifici.electricitat.id)
	  @climatitzacio = Climatitzacio.find(@edifici.climatitzacio.id)
	  @ga = Ga.find(@edifici.ga.id)
	  @ventilacio = Ventilacio.find(@edifici.ventilacio.id)
	  @incendi = Incendi.find(@edifici.incendi.id)
	  @ascensor = Ascensor.find(@edifici.ascensor.id)
	  @telecomunicacio = Telecomunicacio.find(@edifici.telecomunicacio.id)
	  @especial = Especial.find(@edifici.especial.id)
	end
end