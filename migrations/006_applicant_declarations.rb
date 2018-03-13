Sequel.migration do
  up do
    create_table(:applicant_declarations) do
      primary_key :id, type: :Bignum

      String      :place
      String      :signature
      Date        :date

      foreign_key :customer_id, :customers, :on_delete=>:cascade, :type=>'varchar(255)'
      foreign_key :address_id, :addresses, :on_delete=>:cascade
      foreign_key :related_person_id, :related_persons, :on_delete=>:cascade

      DateTime    :created_at
      DateTime    :updated_at
    end
  end

  down do
    drop_table(:applicant_declarations)
  end
end
