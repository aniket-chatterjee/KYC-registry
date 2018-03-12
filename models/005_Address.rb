class Address<Sequel::Model(DB[:addresses])
  many_to_one :country, class:Country
  many_to_one :customer
  many_to_one :related_person
  one_to_many :documents
  one_to_many :applicant_declarations
end
