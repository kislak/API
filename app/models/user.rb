class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable # , :confirmable

  has_many :transactions, through: :accounts
  has_many :roles
  has_many :accounts, through: :roles
end
