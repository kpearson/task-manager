class Task < ActiveRecord::Base
  belongs_to :list
  validates_presence_of :list
  scope :incomplete, -> { where(complete: false) }
  scope :complete, -> { where(complete: true) }
end
