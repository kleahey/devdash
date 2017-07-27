class Project < ApplicationRecord
  has_one :program
  has_many :tasks
end
