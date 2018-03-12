class Customer<Sequel::Model(DB[:customers])
  many_to_one :country, class:Country
  one_to_many :related_persons
  one_to_many :attestations
  one_to_many :addresses, class:Address
  one_to_many :applicant_declarations
  one_to_many :documents
end
Customer.plugin :uuid, :field=>:id
