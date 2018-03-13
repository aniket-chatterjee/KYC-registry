class ApplicantDelcaration<Sequel::Model(DB[:applicant_declarations])
  mount_uploader :signature, SignatureUploader
  many_to_one :customer
  many_to_one :address , class:Address
  many_to_one :related_person
end
