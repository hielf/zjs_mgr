# encoding: utf-8
class CustsController < ApplicationController
  load_and_authorize_resource
  before_filter :authenticate#, :only => [:index, :show, :edit, :update, :productcusts_index, :cust_detail_index]

  def index
    @custs = Cust.order("name").paginate(:page => params[:page]).per_page(20)
    @department = params[:department]
    if params[:broker_id]
      @broker = Broker.find(params[:broker_id])
    else
      @broker = Broker.find_by_user_id(current_user.id)
    end
    @custs_grid = initialize_grid(Cust,
              :include => [:custbrokerrels],
              # :conditions => {:branch_id => Branch.accessible_by(current_ability).map{|br| [br.id]}},
              :name => 'custs',
              :enable_export_to_csv => true,
              :csv_field_separator => ';',
              :csv_file_name => '导出',
              :per_page => 20)
    @title = "客户列表"
    export_grid_if_requested('custs' => 'grid')
  end

  def update
    @cust = Cust.find params[:id]
    if params[:cust][:broker_ids].present?
      @cust.update_attribute :broker_ids, params[:cust][:broker_ids]
      redirect_to custs_path, :flash => { :success => "客户关系设置成功" }
    else @cust.update_attributes(params[:cust])
      redirect_to custs_path, :flash => { :success => "更新成功" }
    end
  end

  def productcusts_index
    # @custs = Cust.order("name").paginate(:page => params[:page]).per_page(20)
    @department = params[:department]
    if params[:broker_id]
      @broker = Broker.find(params[:broker_id])
    else
      @broker = Broker.find_by_user_id(current_user.id)
    end
    @productcusts_grid = initialize_grid(Cust,
              :include => [:branch, :custbrokerproductrels],
              :conditions => [ " CUSTBROKERPRODUCTRELS.BROKER_ID = ? ", @broker ],
              :name => 'productcusts',
              # :enable_export_to_csv => true,
              # :csv_field_separator => ';',
              # :csv_file_name => '导出',
              :per_page => 20)
    @title = "营销产品客户"
    export_grid_if_requested('productcusts' => 'grid')
  end

  def cust_detail_index
    @custs = Cust.order("name").paginate(:page => params[:page]).per_page(20)
    @department = params[:department]
    if params[:broker_id]
      @broker = Broker.find(params[:broker_id])
    else
      @broker = Broker.find_by_user_id(current_user.id)
    end
    @custs_grid = initialize_grid(Cust,
              :order => 'custindices.month_id',
              :order_direction => 'desc',
              :include => [:branch, :custbrokerrels, :months],
              :conditions => [ " CUSTBROKERRELS.BROKER_ID = ? ", @broker ],
              :name => 'custs',
              # :enable_export_to_csv => true,
              # :csv_field_separator => ';',
              # :csv_file_name => '导出',
              :per_page => 20)
    @title = "客户业绩"
  end

  def show
    @cust  = Cust.find(params[:id])
    @title = @cust.cust_name
  end

  def invest_custs_index
    if params[:broker_id]
      @broker = Broker.find(params[:broker_id])
    else
      @broker = Broker.find_by_user_id(current_user.id)
    end
    @invest_custs_grid = initialize_grid(Cust,
              :include => [:custbrokerrels],
              :conditions => [ " CUSTBROKERRELS.BROKER_ID = ? AND CUSTS.ID IN (?)", @broker, Cust.invest_custs.map{|c| c.id} ],
              :name => 'investcusts',
              # :enable_export_to_csv => true,
              # :csv_field_separator => ';',
              # :csv_file_name => '导出',
              :per_page => 20)
    @title = "投资客户"
    export_grid_if_requested('investcusts' => 'grid')
  end

  def trader_custs_index
    if params[:broker_id]
      @broker = Broker.find(params[:broker_id])
    else
      @broker = Broker.find_by_user_id(current_user.id)
    end
    @trader_custs_grid = initialize_grid(Cust,
              :include => [:custbrokerrels],
              :conditions => [ " CUSTBROKERRELS.BROKER_ID = ? AND CUSTS.ID IN (?)", @broker, Cust.trader_custs.map{|c| c.id} ],
              :name => 'tradercusts',
              # :enable_export_to_csv => true,
              # :csv_field_separator => ';',
              # :csv_file_name => '导出',
              :per_page => 20)
    @title = "操盘手客户"
    export_grid_if_requested('tradercusts' => 'grid')
  end

  def finance_custs_index
    if params[:broker_id]
      @broker = Broker.find(params[:broker_id])
    else
      @broker = Broker.find_by_user_id(current_user.id)
    end
    @finance_custs_grid = initialize_grid(Cust,
              :include => [:custbrokerrels],
              :conditions => [ " CUSTBROKERRELS.BROKER_ID = ? AND CUSTS.ID IN (?)", @broker, Cust.finance_custs.map{|c| c.id} ],
              :name => 'financecusts',
              # :enable_export_to_csv => true,
              # :csv_field_separator => ';',
              # :csv_file_name => '导出',
              :per_page => 20)
    @title = "配资客户"
    export_grid_if_requested('financecusts' => 'grid')
  end

  def custrel
    @cust = Cust.find params[:id]
    @title = @cust.capital_account + " - " + @cust.cust_name
  end
end
