class PagesController < ApplicationController
	before_action :superadmin_only, :except => :about
	
	def about
	end

	def dashboard
		@posts = Post.all
		@users = User.all
	end

	private

  def superadmin_only
    unless current_user.superadmin?
      redirect_to root_path, :alert => "Access denied."
    end
  end

end
