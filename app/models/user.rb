class User < ActiveRecord::Base
	ac_field :name

  def self.current_user
    Thread.current[:current_user]
  end

  def self.current_user=(usr)
    Thread.current[:current_user] = usr
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :dishes
  has_many :residences

  def show
  	@user = User.find(params[:id])
  end

  def self.koala(auth, current_user_id)
    access_token = auth['token']
    facebook = Koala::Facebook::API.new(access_token)
    @obj = facebook.get_object("me?fields=name,picture,photos.limit(10).fields(id,picture)")
    @user = User.find(current_user_id)
    @user.update_attributes!(:fb_hd_profile_picture => 'https://graph.facebook.com/' + @obj["id"] + '/picture?type=large')
    @obj
  end

end	