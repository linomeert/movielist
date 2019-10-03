class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_and_belongs_to_many :movie_lists
  has_many :user_ratings

  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :picture, presence: true
  validates :username, presence: true, uniqueness: true

  def self.search(s_email)
    if s_email
      s_email.downcase!
      where('LOWER(email) LIKE ?', "%#{s_email}%")
    else
      all
    end
  end
end
