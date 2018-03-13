Sequel.migration do
  up do
    create_table(:attestations) do
      primary_key :id, type: :Bignum

      Date        :date
      String      :emp_name
      String      :emp_code
      String      :emp_designation
      String      :institution_name
      String      :institution_code
      String      :emp_branch
      String      :signature
      String      :stamp

      foreign_key :customer_id, :customers, :on_delete=>:cascade, :type=>'varchar(255)'
      foreign_key :related_person_id, :related_persons, :on_delete=>:cascade

      DateTime    :created_at
      DateTime    :updated_at
    end
  end

  down do
    drop_table(:attestations)
  end
end
