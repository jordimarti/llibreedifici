module CheckUser
	def check_user_edifici
	  @edifici = Edifici.find(params[:edifici_id]) 
	  if current_user.id != @edifici.user_id
	  	redirect_to home_permisos_path
    end
	end
end