Sequel.migration do
  up do
    create_table(:related_persons) do
      primary_key :id, type: :Bignum
      String      :kyc_number_of_related_person
      String      :type
      String      :name_prefix, null: false, size: 3
      String      :first_name, null:false, size:11
      String      :middle_name, size:11
      String      :last_name, null:false, size:11

      TrueClass   :is_delete_request, default:false

      foreign_key :customer_id, :customers, :on_delete=>:cascade, :type=>'varchar(255)'

      DateTime    :created_at
      DateTime    :updated_at
    end
  end

  down do
    drop_table(:related_persons)
  end
end
