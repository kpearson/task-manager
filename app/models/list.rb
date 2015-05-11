class List < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user
  has_many :tasks, dependent: :destroy
  # scope :unarchived, -> { where(archived: false) }
  scope :unarchived, ->(user = nil) { where(archived: false, user: user) }
  scope :archived, ->(user) { where(archived: true, user: user) }


  def incomplete_tasks
    tasks.incomplete
  end

  def complete_tasks
    tasks.complete
  end
end

