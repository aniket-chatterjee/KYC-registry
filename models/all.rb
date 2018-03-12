Sequel::Model.plugin :timestamps, force: true, update_on_create: true
class Country<Sequel::Model(DB[:countries])
end
class Customer<Sequel::Model(DB[:customers])
end
class RelatedPerson<Sequel::Model(DB[:related_persons])
end
class Attestation<Sequel::Model(DB[:attestations])
end
class Address<Sequel::Model(DB[:addresses])
end
class ApplicantDelcaration<Sequel::Model(DB[:applicant_declarations])
end
class Document<Sequel::Model(DB[:documents])
end
require_relative './001_Country.rb'
require_relative './002_Customer.rb'
require_relative './003_RelatedPerson.rb'
require_relative './004_Attestation.rb'
require_relative './005_Address.rb'
require_relative './006_ApplicantDeclaration.rb'
require_relative './007_Document.rb'
