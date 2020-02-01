class Tech < ApplicationRecord
  belongs_to :stack_type
  has_and_belongs_to_many :stacks
end
