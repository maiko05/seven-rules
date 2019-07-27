class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :rules, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_rules, through: :likes, source: :rule
  
  def already_liked?(rule)
    self.likes.exists?(rule_id: rule.id)
  end
end
