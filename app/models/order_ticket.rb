class OrderTicket < ActiveRecord::Base
  has_many :menu_items
  belongs_to :parties
end
