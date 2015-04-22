require 'spec_helper'

describe Broker do
  pending "add some examples to (or delete) #{__FILE__}"
end

# == Schema Information
#
# Table name: brokers
#
#  id                   :integer          not null, primary key
#  broker_code          :string(255)
#  broker_name          :string(255)
#  branch_id            :integer
#  age                  :integer
#  open_date            :string(255)
#  close_date           :string(255)
#  certificate_num      :string(255)
#  certificate_addr     :string(255)
#  mobile               :string(255)
#  phone                :string(255)
#  fax                  :string(255)
#  email                :string(255)
#  birthday             :string(255)
#  bank_account         :string(255)
#  graduate_college     :string(255)
#  graduate_date        :string(255)
#  major                :string(255)
#  earliest_date        :string(255)
#  agreement_begin_date :string(255)
#  agreement_end_date   :string(255)
#  compact_no           :string(255)
#  broker_qualify_no    :string(255)
#  cert_first_date      :string(255)
#  cert_valite_date     :string(255)
#  cert_get_date        :string(255)
#  exam_pass_date       :string(255)
#  job_qualify          :string(255)
#  passed_exam          :string(255)
#  broker_qualify       :string(255)
#  personnel_manning    :string(255)
#  remark               :text
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  avatar               :string(255)
#  broker_type          :integer
#  user_id              :integer
#  region_manager       :boolean
#  gender               :integer
#  broker_level         :integer
#  broker_status        :integer
#  jobstatus            :integer
#  user_code            :string(255)
#  certificate_type     :integer
#  risk_balance         :decimal(, )
#  broker_degree        :integer
#  zqbz                 :integer
#  url                  :string(255)
#  bank                 :string(255)
#  serv_bank            :string(255)
#
