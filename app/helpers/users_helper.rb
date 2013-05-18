#encoding: UTF-8
module UsersHelper
  def class_collection
    arr = Array.new
    (1..14).each do |i|
      arr.push label: "高三 #{i} 班", value: i
    end
    (1..5).each do |i|
      arr.push label: "ICC S3C#{i}", value: i + 20
    end
    arr
  end
end
