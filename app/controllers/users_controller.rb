class UsersController < ApplicationController
  def index
    @cards = if current_user.admin_role
                Worker.all
             else
                Worker.where(department: current_user.department)
             end
  end
end
