class Product < ApplicationRecord
  belongs_to :organization
  belongs_to :sellable, polymorphic: true

  scope :trailers, -> { where(sellable_type: 'Trailer') }
  scope :parts , -> { where(sellable_type: 'Part') }

  def inventory_count
    organization.inventories.where(sellable: self.sellable).count
  end
end
