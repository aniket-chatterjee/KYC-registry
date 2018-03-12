class Document<Sequel::Model(DB[:documents])
  many_to_one :customer
  many_to_one :address, class:Address
end
