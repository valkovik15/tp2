module ApplicationHelper
  def card_path(card)
    return "/workers/#{card.worker_id}/cards/#{card.id}"
  end
end
