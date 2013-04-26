# encoding: UTF-8
module ApplicationHelper
  def full_title(title)
    base = '人大附中2013届出国生录取结果统计系统'
    title.empty? ? base : title + ' | ' + base
  end

  def to_csv(record)
    require 'csv'
    s = record.first.attributes.keys.to_csv
    record.each do |r|
      s += r.attributes.values.to_csv
    end
    s
  end
end
