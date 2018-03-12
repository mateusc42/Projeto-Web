class RegistrationsController < Devise::RegistrationsController 

  def destroy
    if params[:type] == 'normal'
      resource.destroy
      Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
      set_flash_message :notice, :destroyed
      yield resource if block_given?
      respond_with_navigational(resource){ redirect_to after_sign_out_path_for(resource_name) }
    elsif params[:type] == 'forever'
      resource.really_destroy!
      flash[:notice] = "User deleted permanently successfully."
      redirect_to user_session_path
    elsif params[:type] == 'undelete'
      resource.restore(:recursive => true)
      flash[:notice] = "User successfully restored."
      redirect_to user_session_path
    end
  end 

end


