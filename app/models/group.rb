class Group < ActiveRecord::Base
  belongs_to :user, required: true
  has_many :attends, dependent: :destroy
  has_many :attendees, through: :attends, source: :user


  before_save :downcase

  validates :name, presence: true, length: {minimum: 6}
  validates :description, presence: true, length: {minimum: 11}

  def downcase
       self.name.downcase!

  end
end
