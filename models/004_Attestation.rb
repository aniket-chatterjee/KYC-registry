class Attestation<Sequel::Model(DB[:attestations])
  many_to_one :customer
  many_to_one :related_person

end
