# == Schema Information
# Schema version: 20110423082615
#
# Table name: messages
#
#  id              :integer(4)      not null, primary key
#  lilyid          :string(255)
#  stock_number    :string(255)
#  nominate_reason :text
#  price_nominate  :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class Message < ActiveRecord::Base
  attr_accessible :lilyid,:stock_number,:nominate_reason,:price_nominate
  validates :lilyid,:presence=>true

end
