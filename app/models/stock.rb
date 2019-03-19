class Stock < ApplicationRecord
  belongs_to :user
  
  validates :code, presence: true, length: { is: 4 }
  validates :name, presence: true, length: { maximum: 255 }
  
  has_many :relationships
  has_many :watchers, through: :relationships, source: :user
end
