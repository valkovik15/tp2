class WorkersController < ApplicationController
  def show
    @worker = Worker.find(params[:id])
    authorize! :manage, @worker
    @cards = @worker.cards.where('DAY BETWEEN ? AND ?',
      Date.current.beginning_of_month,
      Date.current.end_of_month).order(:day)
  end

  def edit
    @worker = Worker.find_by(id: params[:id])
    authorize! :manage, @worker
  end

  def update
    @worker = Worker.find_by(id: params[:id])
    authorize! :manage, @worker
    if @worker.update(worker_params)
      flash[:notice] = 'Card successfully updated'
      redirect_to worker_path(params[:id])
     else
      flash[:error] = @worker.errors.full_messages.join('. ') 
      redirect_to edit_worker_card_path(params[:worker_id])
     end
  end

  private

  def worker_params
    params.require(:worker).permit(:way_of_payment)
  end
end
