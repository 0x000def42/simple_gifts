class SetupDatabase < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
    end

    create_table :gifts do |t|
      t.string :access_hash
      t.string :name
      t.string :description
      t.string :content
      t.datetime :occurrence_at
      t.references :autor, index: true, foreign_key: {to_table: :users}
      t.references :recepient, index: true, foreign_key: {to_table: :users}
    end
  end
end
