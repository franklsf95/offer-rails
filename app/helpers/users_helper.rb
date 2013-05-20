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

  def class_from_id(i)
    return "高三 #{i} 班"      if i >= 1 and i <= 14
    return "ICC S3C#{i - 20}" if i > 20 and i <= 25
  end
end
