class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
         # :recoverable, :rememberable, :trackable, :validatable
  devise :database_authenticatable, :registerable, :rememberable#, :recoverable, :trackable, :validatable

  def email_name
    email.split('@')[0]
  end

  def runs_tournament?(tournament)
    id == tournament.user_id
  end
end
