Sequel.migration do
  up do
    create_table(:documents) do
      primary_key :id, type: :Bignum

      String      :document_type, null:false
      TrueClass   :is_identity_proof, default: false
      TrueClass   :is_address_proof,  default: false
      TrueClass   :is_local_address_proof,  default: false

      String      :passport_number
      Date        :passport_expiry_date
      String      :voter_id
      String      :driving_licence
      Date        :driving_licence_expiry_date
      String      :aadhaar_card
      String      :nrega_job_card
      String      :other_card_name
      String      :other_card_id
      String      :document

      foreign_key :customer_id, :customers, :on_delete=>:cascade, :type=>'varchar(255)'
      foreign_key :address_id, :addresses, :on_delete=>:cascade

      DateTime    :created_at
      DateTime    :updated_at
    end
  end

  down do
    drop_table(:documents)
  end
end
