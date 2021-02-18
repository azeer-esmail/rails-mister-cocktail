class Ingredient < ApplicationRecord
  has_many :doses
  validates :name, presence: true, uniqueness: true
  # before_destroy :check_for_doses

  # def check_for_doses
  #   self.doses.count == 0
  # end
end
