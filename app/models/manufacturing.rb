class Manufacturing < ApplicationRecord
  belongs_to :organization
  belongs_to :sellable, polymorphic: true
  belongs_to :location

  scope :trailers, -> { where(sellable_type: 'Trailer') }
  scope :parts , -> { where(sellable_type: 'Part') }
end
