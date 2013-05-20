module ApplicationHelper
  def full_title(title)
    base = OfferRails::Application.config.APP_TITLE
    title.empty? ? base : title + ' | ' + base
  end
end
