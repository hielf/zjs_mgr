# encoding: utf-8
# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  email              :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  encrypted_password :string(255)
#  salt               :string(255)
#  admin              :boolean          default(FALSE)
#  usercode           :string(255)
#  branch_id          :integer
#  department_id      :integer
#  status             :integer
#  user_type          :integer
#  first_login        :boolean          default(FALSE)
#  mobile             :string(255)
#

class User < ActiveRecord::Base
  attr_accessor   :password, :certificate_num, :bank_account, :role_id, :terms_of_service
  attr_accessible :name, :email, :password, :usercode, :password_confirmation, :userposition_ids,
                  :role_ids, :branch_id, :department_id, :mobile, :status, :user_type, :certificate_num,
                  :bank_account, :terms_of_service

  belongs_to :branch
  belongs_to :department

  has_one :broker

  has_many :branches
  has_many :notices
  has_many :sessions
  has_many :assignments
  has_many :usersigns
  has_many :roles, :through => :assignments
  has_many :userpositionrels, :dependent => :destroy,
                              :foreign_key => "userid"
  has_many :userpositions, :through => :userpositionrels,
                           :source => :position
  has_many :readnotices
  has_many :notices, :through => :readnotices

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, format: { with: email_regex }, :uniqueness => true
  validates :name,  :presence   => true,
                    :length     => { :maximum => 20 }
  validates :mobile,  :presence   => true,
                      :numericality => true,
                      :length     => { :is => 11 }
  validates :usercode, :presence   => true,
                       :uniqueness => true,
                       :length       => { :within => 1..10 }
  validates :password, :presence     => true,
                       :confirmation => true,
                       :length       => { :within => 5..20 }
  validates :terms_of_service, acceptance: { accept: '1' }

  before_save :encrypt_password

  # default_scope  :order => 'users.usercode'

  scope :valid_user, where(:status => Dict.find_by_dict_type_and_code("UserBase.status", 1) )
  scope :managers, where(:status => Dict.find_by_dict_type_and_code("UserBase.status", 1) )

  def to_label
    "#{usercode} | #{name}"
  end

  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end

  def has_default_password?(submitted_password)
    encrypted_password == submitted_password
  end

  def position!(position)
    userpositionrels.create!(:positionid => position.id )
  end

  def has_role?(role_sym)
    roles.any? { |r| r.name.underscore.to_sym == role_sym }
  end

  def has_position?(position_sym)
    userpositions.any? { |p| p.name.underscore.to_sym == posposition_symition }
  end

  class << self
    def authenticate(usercode, submmited_password)
      user = User.find_by_usercode_and_status(usercode, Dict.find_by_dict_type_and_code("UserBase.status", 1))
      (user && user.has_password?(submmited_password)) ? user : nil

      # 与上面相同
      # return nil  if user.nil?
      # return user if user.has_password?(submmited_password)
    end

    def authenticate_with_salt(id, cookie_salt)
      user = find_by_id(id)
      (user && user.salt == cookie_salt) ? user : nil
    end
  end


  #encrypted password method
  private
    def encrypt_password
      self.salt = make_salt if (new_record? || self.salt.nil?)
      if password != nil
        self.encrypted_password = encrypt(password)
      end
    end

    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end

    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end

    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end
end
