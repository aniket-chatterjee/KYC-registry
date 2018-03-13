class Document<Sequel::Model(DB[:documents])
  mount_uploader :document, DocumentUploader
  many_to_one :customer
  many_to_one :address, class:Address
end
