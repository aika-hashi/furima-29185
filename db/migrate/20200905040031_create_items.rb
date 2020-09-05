class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
     t.string     :image        , null: false
     t.string     :title        , null: false
     t.text       :text         , null: false
     t.integer    :category_id  , null: false
     t.integer    :condition_id , null: false
     t.integer    :charge_id    , null: false
     t.integer    :area_id      , null: false
     t.integer    :day_id       , null: false
     t.string     :price        , null: false
     t.string     :fee        
     t.string     :profit       
     t.timestamps
    end
  end
end
