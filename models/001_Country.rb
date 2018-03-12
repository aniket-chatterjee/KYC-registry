
class Country<Sequel::Model(DB[:countries])
    one_to_many :customers
    one_to_many :addresses, class:Address
end
