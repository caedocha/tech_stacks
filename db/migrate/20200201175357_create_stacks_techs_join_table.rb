class CreateStacksTechsJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :stacks, :techs
  end
end
