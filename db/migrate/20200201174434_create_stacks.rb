class CreateStacks < ActiveRecord::Migration[6.0]
  def change
    create_table :stacks do |t|
      t.references :project, null: false, foreign_key: true
      t.references :stack_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
