class Todoitem < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :deadline, presence: true

  scope :incomplete, -> { where(completed: false) } # Scope for incomplete todos
  scope :completed, -> { where(completed: true) }
end
