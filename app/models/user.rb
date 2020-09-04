class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname,:email,:password,:password_confirmation,:firstname, :familyname, :firstname_kana, :familyname_kana, :date,presence: true
end