require 'sequel'

Sequel.migration do
  up do
    create_table(:posts) do
      primary_key :id, type: :Bignum
      String :user, null: false
      String :message, null: false
      Time :created_at, null: false
      Time :valid_to, null: true
    end
  end

  down do
    drop_table(:posts)
  end
end
