# encoding: UTF-8
module ApplicationHelper
  def full_title(title)
    base = '人大附中2013届出国生录取结果统计系统'
    title.empty? ? base : title + ' | ' + base
  end
end
