class User < ActiveRecord::Base
#	ac_field :name
  acts_as_messageable
  acts_as_mappable :default_units => :miles,
                 :default_formula => :sphere,
                 :distance_field_name => :distance,
                 :lat_column_name => :lat_f,
                 :lng_column_name => :long_f

  def self.current_user
    Thread.current[:current_user]
  end

  def self.current_user=(usr)
    Thread.current[:current_user] = usr
  end

  def mailboxer_email(object)
    return email
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :dishes

    has_many :sales,
           :class_name => "Order",
           :foreign_key => "seller_id"

    has_many :purchases,
            :class_name => "Order",
            :foreign_key => "buyer_id"

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
