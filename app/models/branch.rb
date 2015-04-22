# encoding: utf-8
# == Schema Information
#
# Table name: branches
#
#  id            :integer          not null, primary key
#  code          :string(255)
#  name          :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  department_id :integer
#  supervisor    :string(255)
#  location      :string(255)
#  phone         :string(255)
#  user_id       :integer
#

class Branch < ActiveRecord::Base
  attr_accessible :code, :name, :department_id, :location, :phone, :user_id
  belongs_to :department
  belongs_to :user
  
  has_many :users
  has_many :brokers
  has_many :branchindices
  has_many :custs
  
  validates :code,  :presence   => true,
                    :numericality => true,
                    :length     => { :is => 4 }, 
                    :uniqueness => true
  validates :name,  :presence   => true,
                    :length     => { :maximum => 20 },
                    :uniqueness => true
  validates :department_id,  :presence   => true
  validates :user_id, :presence   => true

  default_scope   :order => 'branches.code' 
  
  def to_label
    "#{code} | #{name}"
  end
  
  # def typebrokers(broker_type)
  #   Broker.typebrokers(broker_type)
  # end
  # scope :type_brokers, lambda { |broker_type| type_broker(broker_type) }
  # 
  # private
  # 
  #   def self.type_broker(broker_type)
  #     following_ids = %(SELECT followed_id FROM relationships
  #                       WHERE follower_id = :user_id)
  #     where("user_id IN (#{following_ids}) OR user_id = :user_id",
  #           :user_id => user)
  #   end
end
