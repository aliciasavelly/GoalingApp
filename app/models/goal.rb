class Goal < ActiveRecord::Base
  STATI = ["completed", "ongoing", "on hold"]
  SETTINGS = ["private", "public"]
  after_initialize :set_defaults, unless: :persisted?
  validates :title, :user_id, :status, :privacy_setting, presence: true
  validates :privacy_setting, inclusion: {in: SETTINGS}
  validates :status, inclusion: {in: STATI}

  belongs_to :user

  def set_defaults
    self.privacy_setting  ||= "private"
    self.status ||= "ongoing"
  end

end
