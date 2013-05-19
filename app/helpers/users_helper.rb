#encoding: UTF-8
module UsersHelper
  def class_collection
    arr = Array.new
    (1..14).each do |i|
      arr.push k: "高三 #{i} 班", v: i
    end
    (1..5).each do |i|
      arr.push k: "ICC S3C#{i}", v: i + 20
    end
    arr
  end
end
