
class Country<Sequel::Model(DB[:countries])
    one_to_many :customers
    one_to_many :jurisdiction_countries, class:Customer, key: :jurisdiction_country_id
    one_to_many :born_in_countries, class:Customer, key: :country_of_birth_id
    one_to_many :addresses, class:Address, key: :address_id

end
