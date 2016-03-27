class Rate < ActiveRecord::Base
  belongs_to :shop
  has_many :filters, dependent: :destroy

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }

  accepts_nested_attributes_for :filters

  def to_hash
    {
      service_name: name,
      service_code: name.underscore,
      total_price: price,
      currency: 'CAD'
    }
  end
end