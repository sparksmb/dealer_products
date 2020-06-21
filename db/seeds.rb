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


