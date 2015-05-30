class User < ActiveRecord::Base
	ac_field :name

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :dishes
  has_many :residences

  def show
  @user = User.find(params[:id])
end
end	