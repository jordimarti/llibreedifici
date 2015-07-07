module SetSistemes
	def set_sistemes
	  @edifici = Edifici.find(params[:edifici_id])
	  @fonamentacio = Fonamentacio.find(@edifici.fonamentacio.id)
	  @estructura = Estructura.find(@edifici.estructura.id)
	  @tancaments_vertical = TancamentsVertical.find(@edifici.tancaments_vertical.id)
	  @coberta = Coberta.find(@edifici.coberta.id)
	end
end