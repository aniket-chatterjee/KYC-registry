class Attestation<Sequel::Model(DB[:attestations])
  mount_uploader :signature, SignatureUploader
  mount_uploader :stamp, SignatureUploader
  many_to_one :customer
  many_to_one :related_person

end
