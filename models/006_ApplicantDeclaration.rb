class ApplicantDelcaration<Sequel::Model(DB[:applicant_declarations])
  many_to_one :customer
  many_to_one :address , class:Address
  many_to_one :related_person
end
