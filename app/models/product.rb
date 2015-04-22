# encoding: utf-8
class Product < ActiveRecord::Base
  attr_accessible :begin_limit, :capital_account, :contract, :instruction, :linkman, :manage_begin_date,
                  :manage_end_date, :manager, :name, :phone, :product_code, :product_income, :product_structure,
                  :product_type, :returns_ratio, :risk_level, :sale_begin_date, :sale_end_date, :sale_limit,
                  :sales_bonus, :status
                  
  has_many        :brokerproductrels
  has_many 				:productattachments
  has_many				:custbrokerproductrel
end

# == Schema Information
#
# Table name: products
#
#  id                :integer          not null, primary key
#  product_code      :string(255)
#  name              :string(255)
#  manager           :string(255)
#  product_type      :integer
#  risk_level        :integer
#  sale_limit        :string(255)
#  returns_ratio     :string(255)
#  sale_begin_date   :datetime
#  sale_end_date     :datetime
#  manage_begin_date :datetime
#  manage_end_date   :datetime
#  product_structure :string(255)
#  begin_limit       :string(255)
#  sales_bonus       :string(255)
#  product_income    :integer
#  status            :integer
#  linkman           :string(255)
#  phone             :string(255)
#  capital_account   :string(255)
#  contract          :string(255)
#  instruction       :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  产品起息日             :string(255)
#  产品到期日             :string(255)
#  产品简介              :text
#  风险特征              :text
#  产品面值              :string(255)
#  产品托管人             :string(255)
#  链接                :string(255)
#  管理期限              :text
#  封闭期与开放期           :text
#  参与和退出办理时间         :text
#  最低金额              :text
#  相关费率              :text
#  投资范围              :text
#  自有资金参与            :text
#  费用与业绩报酬           :text
#  投资经理              :text
#  封闭期               :text
#  分级结构              :text
#  封闭期和开放期           :text
#  参与和退出             :text
#  投资目标              :text
#  募集规模与存续期限         :text
#  投资范围及资产组合         :text
#  封闭期与开放日           :text
#  拟任投资经理            :text
#  业绩比较基准            :text
#  业绩基准              :text
#  募集规模与存续期间         :text
#  投资理念              :text
#  投资策略              :text
#  自有资金投入            :text
#  风险收益特征            :text
#  资产配置比例范围          :text
#  开放期               :text
#  产品特点              :text
#  参与退出费用与业绩         :text
#  资产配置比例            :text
#  参与退出费用和保护         :text
#  参与退出费用            :text
#  目标规模              :text
#  管理期               :text
#  适合推广对象            :text
#  集合计划份额的参与         :text
#  集合计划的分级           :text
#  集合计划份额的退出         :text
#  管理人自有资金参与         :text
#  费用                :text
#  业绩报酬              :text
#  收益分配              :text
#  产品展期              :text
#  最低份额              :text
#  集合计划的参与           :text
#  集合计划的退出           :text
#  管理人自有资金           :text
#  费用种类              :text
#  集合计划展期            :text
#  风险收益特征推广对象        :text
#  集合计划的展期           :text
#  各项费用              :text
#  代理推广机构            :text
#
