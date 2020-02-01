class CreateTechs < ActiveRecord::Migration[6.0]
  def change
    create_table :techs do |t|
      t.string :name
      t.string :logo
      t.text :description
      t.references :stack_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
