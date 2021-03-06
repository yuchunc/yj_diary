class Member < ActiveRecord::Base
  extend OmniauthCallbacks

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable, :omniauthable,
         omniauth_providers: [:facebook]

  has_many :posts


end
