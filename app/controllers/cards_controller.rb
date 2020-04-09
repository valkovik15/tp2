class CardsController < ApplicationController
  
  def new
    @card = Card.new(worker_id: params[:worker_id])
    authorize! :manage, Worker.find(@card.worker_id)
  end

  def create
   @card = Card.new(card_params.merge(worker_id: params[:worker_id]))
   authorize! :manage, Worker.find(@card.worker_id)
   if @card.save
    flash[:notice] = 'Card successfully created'
    redirect_to worker_path(params[:worker_id])
   else
    flash[:error] = @card.errors.full_messages.join('. ') 
    redirect_to new_worker_card_path(params[:worker_id])
   end
  end

  def edit
    @card = Card.find_by(id: params[:id])
    authorize! :manage, Worker.find(@card.worker_id)
  end

  def update
    @card = Card.find_by(id: params[:id])
    authorize! :manage, Worker.find(@card.worker_id)
    if @card.update(card_params)
      flash[:notice] = 'Card successfully updated'
      redirect_to worker_path(params[:worker_id])
     else
      flash[:error] = @card.errors.full_messages.join('. ') 
      redirect_to edit_worker_card_path(params[:worker_id])
     end
  end

  private

  def card_params
    params.require(:card).permit(:day, :worktime)
  end
  
end
