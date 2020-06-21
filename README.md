# README

## Setup

```
rails db:create
rails db:migrate
rails db:seed
```

## Model Creation Order and Class Modifications
```
rails g model organization type:string name:string
rails g model dealership --parent=Organization
rails g model OriginalEquipmentManufacturer --parent=Organization

rails g model trailer name:string length:decimal organization:references:index
rails g model part name:string part_no:string organization:references:index

class Organization < ApplicationRecord
  has_many :trailers
  has_many :parts
end

rails g model product organization:references:index sellable:references{polymorphic}:index

class Organization < ApplicationRecord
  has_many :trailers
  has_many :parts
  has_many :products
end

rails g model location name:string
rails g model inventory organization:references:index sellable:references{polymorphic}:index location:references:index 
rails g model manufacturing organization:references:index sellable:references{polymorphic}:index location:references:index 

class Organization < ApplicationRecord
  has_many :trailers
  has_many :parts
  has_many :products
  has_many :inventories
  has_many :manufacturings
end

class Product < ApplicationRecord
  belongs_to :organization
  belongs_to :sellable, polymorphic: true

  scope :trailers, -> { where(sellable_type: 'Trailer') }
  scope :parts , -> { where(sellable_type: 'Part') }

  def inventory_count
    organization.inventories.where(sellable: self.sellable).count
  end
end
```

## Usage (Dealership products/inventories and OEM products/manufactorings) 

```
d = Dealership.find_by(name: 'Big Tex Sales')
m = OriginalEquipmentManufacturer.find_by(name: 'Big Tex')

# List organizaitons with type and product counts
Organization.all.map{|o| [o.name, o.type, o.products.count] }

d.products
d.products.trailers 
d.products.parts 

d.inventories 
d.inventories.trailers
d.inventories.parts

m.manufacturings
m.manufacturings.trailers 
m.manufacturings.parts

# List dealership products with inventory count 
d.products.map{|p| [p.sellable.name, p.inventory_count]}
```
