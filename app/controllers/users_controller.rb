class UsersController < ApplicationController
  def index
    @cards = if current_user.admin_role
                Worker.all
             else
                Worker.where(department: current_user.department)
             end
    respond_to do |format|
      format.html
      format.pdf do
        pdf = ReportPdf.new(@cards)
        send_data pdf.render, filename: "SalaryReport", type: "application/pdf", disposition: "inline"
      end
    end
  end
end
