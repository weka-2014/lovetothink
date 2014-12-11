class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #  :trackable, :rememberable, :recoverable,
  devise :database_authenticatable, :registerable, :validatable
end
