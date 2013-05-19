require 'csv'

class Array
  def as_csv
    CSV.generate force_quotes: true do |csv|
      csv << self.first.attributes.keys
      self.each do |r|
        csv << r.attributes.values
      end
    end
  end
end

ActionController::Renderers.add :csv do |source, options|
  csv = source.respond_to?(:as_csv) ? source.as_csv : source
  self.content_type ||= Mime::CSV
  self.response_body = csv
end
