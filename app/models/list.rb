class List < ActiveRecord::Base
  has_many :items

  def sorted_items
    self.items.order('created_at DESC')
  end
end
