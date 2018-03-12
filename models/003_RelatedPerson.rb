class RelatedPerson<Sequel::Model(DB[:related_persons])
  many_to_one :customer
  one_to_many :attestations
  one_to_many :addresses , class:Address
  one_to_many :applicant_declarations
end
