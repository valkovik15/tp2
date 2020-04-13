require 'prawn'
class ReportPdf < Prawn::Document
  def initialize(workers)
    super(top_margin: 70)
    worker_information = []
    workers.each do |worker|
      cards = worker.cards.where('DAY BETWEEN ? AND ?',
        Date.current.beginning_of_month,
        Date.current.end_of_month).order(:day)
        cards.each do |card|
          worker_information << [ worker.full_name,  I18n.l(card.day, format: :short), card.worktime.to_s+' hour(s)' ]
        end
        worker_information << [ "Total salary for #{worker.full_name}",  month_string, worker.current_salary.to_f ]
    end
    table worker_information
  end

  private

  def month_string
    "#{Date.today.strftime("%B")}"
  end
end
