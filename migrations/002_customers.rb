Sequel.migration do
  up do
    create_table(:customers) do
        String      :id, primary_key:true
        String      :kyc_number, null: false, unique:true

        String      :kyc_type, null: false

        String      :name_prefix, null: false, size: 3
        String      :first_name, null:false, size:11
        String      :middle_name, size:11
        String      :last_name, null:false, size:11

        String      :maiden_name_prefix, size:3
        String      :maiden_first_name, size:11
        String      :maiden_middle_name, size:11
        String      :maiden_last_name, size:11

        String      :father_spouse_name_prefix, null:false, size:3
        String      :father_spouse_first_name, null:false, size:11
        String      :father_spouse_middle_name, size:11
        String      :father_spouse_last_name, null:false, size:11

        String      :mother_name_prefix, null:false, size:3
        String      :mother_first_name, null:false, size:11
        String      :mother_middle_name, size:11
        String      :mother_last_name, null:false, size:11

        Date        :date_of_birth, null:false
        String      :gender, null:false, size:12
        String      :marital_status, null:false
        String      :residential_status, null:false
        String      :occupation_type, null:false
        String      :occupation_sector, null:false
        String      :pan_number
        String      :email_id
        String      :mobile
        String      :telephone_off
        String      :telephone_res
        TrueClass   :is_fatca_crs, default:false
        String      :tax_identification_number
        String      :place_city_of_birth
        String      :remarks
        String      :photo
        String      :signature
        String      :pan_card_document

        TrueClass   :is_delete_request, default:false

        foreign_key :country_id, :countries, :on_delete=>:set_null
        foreign_key :country_of_birth_id, :countries,  :on_delete=>:set_null
        foreign_key :jurisdiction_country_id, :countries, :on_delete=>:set_null

        DateTime    :created_at
        DateTime    :updated_at
    end
  end

  down do
    drop_table(:customers)
  end
end
