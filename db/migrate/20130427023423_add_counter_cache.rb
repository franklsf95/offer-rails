class AddCounterCache < ActiveRecord::Migration
  def change
    add_column :people, :offers_count, :integer
    add_column :schools, :offers_count, :integer
    Person.all.each do |p|
      Person.update_counters p.id, offers_count: p.offers.count
    end
    School.all.each do |s|
      School.update_counters s.id, offers_count: s.offers.count
    end
  end
end
