class Stack < ApplicationRecord
  belongs_to :project
  belongs_to :stack_type
  has_and_belongs_to_many :techs
end
