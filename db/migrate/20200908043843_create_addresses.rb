class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      #t.references :order          , foreign_key: true   
      t.string     :addressnum     , null: false
      t.integer    :area_id        , null: false
      t.string     :city           , null: false
      t.string     :housenum       , null: false
      t.string     :building       , null: false
      t.string     :phonenum       , null: false
      t.timestamps
    end
  end
end
