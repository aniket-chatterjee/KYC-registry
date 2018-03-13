class Customer<Sequel::Model(DB[:customers])
  mount_uploader :photo, PhotoUploader
  mount_uploader :signature, SignatureUploader
  mount_uploader :pan_card_document, DocumentUploader
  many_to_one :country, class:Country
  many_to_one :jurisdiction_country, class:Country, key: :jurisdiction_country_id
  many_to_one :born_in_country, class:Country, key: :country_of_birth_id

  one_to_many :related_persons
  one_to_many :attestations
  one_to_many :addresses, class:Address
  one_to_many :applicant_declarations
  one_to_many :documents
  def self.createCustomer(params)

    customer_fields=["kyc_type",    "name_prefix",    "first_name",    "last_name",
    "father_spouse_name_prefix",    "father_spouse_first_name",    "father_spouse_last_name",
    "mother_name_prefix",    "mother_first_name",    "mother_last_name",
    "date_of_birth",    "gender",    "marital_status",    "country",    "residential_status",    "occupation_type",    "occupation_sector" ]
    customer_fields.each do |cf|
      p "#{cf} #{params[cf.to_sym]}"
      raise "#{cf} can not be empty" if !ValidationHelper.isFilled(params,cf)
    end
    kyc_num=SecureRandom.hex(14)
    customer=Customer.create({
        :kyc_number=>kyc_num,
        :kyc_type=>params[:kyc_type],
        :name_prefix=>params[:name_prefix],
        :first_name=>params[:first_name],
        :middle_name=>params[:middle_name],
        :last_name=>params[:last_name],
        :maiden_name_prefix=>params[:maiden_name_prefix],
        :maiden_first_name=>params[:maiden_first_name],
        :maiden_middle_name=>params[:maiden_middle_name],
        :maiden_last_name=>params[:maiden_last_name],
        :father_spouse_name_prefix=>params[:father_spouse_name_prefix],
        :father_spouse_first_name=>params[:father_spouse_first_name],
        :father_spouse_middle_name=>params[:father_spouse_middle_name],
        :father_spouse_last_name=>params[:father_spouse_last_name],
        :mother_name_prefix=>params[:mother_name_prefix],
        :mother_first_name=>params[:mother_first_name],
        :mother_middle_name=>params[:mother_middle_name],
        :mother_last_name=>params[:mother_last_name],
        :date_of_birth=>params[:date_of_birth],
        :gender=>params[:gender],
        :marital_status=>params[:marital_status],
        :residential_status=>params[:residential_status],
        :occupation_type=>params[:occupation_type],
        :occupation_sector=>params[:occupation_sector],
        :pan_number=>params[:pan_number],
        :email_id=>params[:email_id],
        :mobile=>params[:mobile],
        :telephone_off=>params[:telephone_off],
        :telephone_res=>params[:telephone_res],
        :is_fatca_crs=>params[:is_fatca_crs],
        :tax_identification_number=>params[:tax_identification_number],
        :place_city_of_birth=>params[:place_city_of_birth],
        :remarks=>params[:remarks],
        :is_delete_request=>params[:is_delete_request],
        :country_id=>params[:country_id],
        :country_of_birth_id=>params[:country_of_birth_id],
        :jurisdiction_country_id=>params[:jurisdiction_country_id]
      })
      customer.addDocument(params)
      customer
  end
  def addDocument(params)
      Document.create({
          :proof_of_identity_type=>params[:proof_of_identity_type],
          :passport_number=>params[:passport_number],
          :passport_expiry_date=>params[:passport_expiry_date],
          :voter_id_number=>params[:voter_id_number],
          :driving_licence_number=>params[:driving_licence_number],
          :driving_licence_expiry_date=>params[:driving_licence_expiry_date],
          :aadhaar_card_number=>params[:aadhaar_card_number],
          :nrega_job_card_number=>params[:nrega_job_card_number],
          :other_card_name=>params[:other_card_name],
          :other_card_number=>params[:other_card_number],
          :poi_doument=>params[:poi_doument]
          :customer_id=>id
        })

  end
  def addApplicantDeclaration(params)
      ApplicantDelcaration.create({
          :applicant_declaration_date=>params[:applicant_declaration_date],
          :applicant_declaration_place=>params[:applicant_declaration_place],
          :customer_id=>id
        })

  end
  def addAttestation(params)
      Attestation.create({
          :date=>params[:date],
          :emp_name=>params[:emp_name],
          :emp_code=>params[:emp_code],
          :emp_designation=>params[:emp_designation],
          :institution_name=>params[:institution_name],
          :institution_code=>params[:institution_code],
          :emp_branch=>params[:emp_branch],
          :customer_id=>id
        })
  end
  def addRelatedPerson(params)
      related_person=RelatedPerson.create({
          :type=>params[:related_person_type],
          :name_prefix=>params[:related_person_name_prefix],
          :first_name=>params[:related_person_first_name],
          :middle_name=>params[:related_person_middle_name],
          :last_name=>params[:related_person_last_name],
          :customer_id=>id
        })
      ducument=Document.create({
          :ducument_type=>params[:related_person_proof_of_identity_type],
          :passport_number=>params[:related_person_passport_number],
          :passport_expiry_date=>params[:related_person_passport_expiry_date],
          :voter_id_number=>params[:related_person_voter_id_number],
          :driving_licence_number=>params[:related_person_driving_licence_number],
          :driving_licence_expiry_date=>params[:related_person_driving_licence_expiry_date],
          :aadhaar_card_number=>params[:related_person_aadhaar_card_number],
          :nrega_job_card_number=>params[:related_person_nrega_job_card_number],
          :other_card_id=>params[:related_person_other_card_id],
          :other_card_number=>params[:related_person_other_card_number],
          :poi_doument=>params[:related_person_poi_doument],
          :customer_id=>id
        })

  end
  def addAddress(params)
    address=Address.create({
        :address_line1=>params[:address_line1],
        :address_line2=>params[:address_line2],
        :address_line3=>params[:address_line3],
        :city_town_village=>params[:city_town_village],
        :district=>params[:district],
        :zip_pin=>params[:zip_pin],
        :state_ut_code=>params[:state_ut_code],
        :state_ut=>params[:state_ut],
        :country_id=>params[:address_coutry],
        :customer_id=>id
      })
  end
end
Customer.plugin :uuid, :field=>:id
