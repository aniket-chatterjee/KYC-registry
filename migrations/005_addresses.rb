Sequel.migration do
  up do
    create_table(:addresses) do
      primary_key :id, type: :Bignum

      String      :line1, null:false
      String      :line2
      String      :line3
      String      :district
      String      :zip_pin
      String      :city_town_village
      String      :state_ut_code
      String      :state_ut
      String      :address_type
      TrueClass   :for_facta_crs, default:false


      foreign_key :country_id, :countries, :on_delete=>:cascade
      foreign_key :customer_id, :customers, :on_delete=>:cascade, :type=>'varchar(255)'
      foreign_key :related_person_id, :related_persons, :on_delete=>:cascade

      DateTime    :created_at
      DateTime    :updated_at
    end
  end

  down do
    drop_table(:addresses)
  end
end
