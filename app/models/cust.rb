# encoding: utf-8
class Cust < ActiveRecord::Base
  attr_accessible :address, :assessment_date, :capital_account, :capital_account_type, :close_date,
                  :cust_name, :identification_number, :identification_type, :mobile, :open_date, :phone, :status,
                  :valid_date, :valid_date_crop, :zip_code, :birthday, :cust_type, :custbrokerrel_ids, :broker_ids

  # belongs_to :branch
  has_many   :custbrokerrels
  has_many   :custbrokerproductrels
  has_many   :brokerfavcusts
  has_many   :custindices
  has_many   :months, :through => :custindices

  has_many   :custbrokerrels
  has_many   :brokers, :through => :custbrokerrels

  scope :invest_custs, where("instr(cust_type,'1') > 0")
  scope :trader_custs, where("instr(cust_type,'2') > 0")
  scope :finance_custs, where("instr(cust_type,'3') > 0")


  def is_cust?(cust_sym)
    self.any? { |c| c.capital_account == cust_sym }
  end

  def broker
    self.brokers.first
  end

end

# == Schema Information
#
# Table name: custs
#
#  id                    :integer          not null, primary key
#  capital_account       :string(11)
#  cust_name             :string(255)
#  identification_type   :integer
#  identification_number :string(255)
#  address               :string(255)
#  phone                 :string(255)
#  mobile                :string(255)
#  zip_code              :string(255)
#  status                :integer
#  capital_account_type  :integer
#  open_date             :string(8)
#  close_date            :string(8)
#  valid_date            :string(8)
#  assessment_date       :string(8)
#  valid_date_crop       :string(8)
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  birthday              :datetime
#  cust_type             :string(255)
#
