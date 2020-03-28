class WorkersController < ApplicationController
  def show
    @worker = Worker.find(params[:id])
    authorize! :manage, @worker
    @cards = @worker.cards.where('DAY BETWEEN ? AND ?',
      Date.current.beginning_of_month,
      Date.current.end_of_month)
  end
end
