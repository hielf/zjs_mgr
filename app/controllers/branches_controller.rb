# encoding: utf-8
class BranchesController < ApplicationController
  load_and_authorize_resource
  before_filter :authenticate

  def index
    @branches_grid = initialize_grid(Branch,
              :order => 'branches.code',
              # :order_direction => 'desc',
              :conditions => {:id => Branch.accessible_by(current_ability).map{|br| [br.id]}},
              # :include => [:branch],
              :name => 'branches',
              :enable_export_to_csv => true,
              :csv_field_separator => ';',
              :csv_file_name => '导出',
              :per_page => 20)
    @title = "分支机构"
    export_grid_if_requested('branches' => 'grid')
  end

  def show
    @branch     = Branch.find(params[:id])
    @title      = @branch.name
    @father_department = @branch.department
    @brokers    = @branch.brokers

    @brokers_grid = initialize_grid(Broker,
              :conditions => { :id => @brokers.map{|b| b.id} },
              # :include => [:custindices],
              # :name => 'brokerfavcusts',
              :per_page => 5)
  end

  def new
    @branch = Branch.new
    @title = "新建分支机构"
  end

  def create
    @branch = Branch.new(params[:branch])
    if @branch.save
      redirect_to branches_path, :flash => { :success => "分支机构添加成功"}
    else
      @title = "新建分支机构"
      render 'new'
    end
  end

 def edit
    @branch  = Branch.find(params[:id])
    @title = "分支机构设置"
  end

 def update
    @branch  = Branch.find(params[:id])
    if @branch.update_attributes(params[:branch])
      redirect_to branches_path, :flash => { :success => "更新成功" }
    else
      @title = "分支机构设置"
      render 'edit'
    end
 end
end
