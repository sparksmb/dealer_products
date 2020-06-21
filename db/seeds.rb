m = OriginalEquipmentManufacturer.find_or_create_by(name: 'Big Tex')
d = Dealership.find_or_create_by(name: 'Big Tex Sales')
d2 = Dealership.find_or_create_by(name: "Steve's Trailers")

t = Trailer.find_or_create_by(name: 'Big XT 1', length: 30, organization: m)
p = Part.find_or_create_by(name: 'XT Toolbox XL', part_no: 'PN1234', organization: m)
t2 = Trailer.find_or_create_by(name: 'PJ 1', length: 22.5, organization: d2)
t3 = Trailer.find_or_create_by(name: 'Big XT 2', length: 35, organization: m)

Product.find_or_create_by(organization: m, sellable: t)
Product.find_or_create_by(organization: m, sellable: t3)
Product.find_or_create_by(organization: m, sellable: p)
Product.find_or_create_by(organization: d, sellable: t)
Product.find_or_create_by(organization: d, sellable: p)
Product.find_or_create_by(organization: d2, sellable: t2)

if d.inventories.empty?
  p = d.products.trailers.first
  l = Location.find_or_create_by(name: 'Lot A')
  3.times { Inventory.create(organization: d, sellable: p.sellable, location: l) }

  p = d.products.parts.first
  l = Location.find_or_create_by(name: 'Parts Bin A')
  3.times { Inventory.create(organization: d, sellable: p.sellable, location: l) }
end

if m.manufacturings.empty?
  p = m.products.trailers.first
  l = Location.find_or_create_by(name: 'Plant A')
  3.times { Manufacturing.create(organization: m, sellable: p.sellable, location: l) }
end
