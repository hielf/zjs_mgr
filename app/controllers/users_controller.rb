# encoding: utf-8
class UsersController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource :only => [:new, :create]
  before_filter :authenticate, :only => [:index, :edit, :update, :destroy]
  # before_filter :correct_user, :only => [:edit, :update]
  # before_filter :admin_user,   :only => :destroy

  def index
    @users = User.order("name").paginate(:page => params[:page]).per_page(20)
    @department = params[:department]
    # usergrid = User.accessible_by(current_ability, :read)
    @users_grid = initialize_grid(User,
              # :conditions => {:department_id => Department.accessible_by(current_ability).map{|dp| [dp.id]}},
              :include => [:branch],
              :name => 'users',
              :enable_export_to_csv => true,
              :csv_field_separator => ';',
              :csv_file_name => '导出',
              :per_page => 20)
    @title = "用户"
    export_grid_if_requested('users' => 'grid')
  end

  def show
    @user  = User.find(params[:id])
    @title = @user.name
  end

  def usersettings
    @user  = User.find(params[:id])
    @title = "用户设置" +" "+ @user.name
  end

  def new
    @user  = User.new
    @title = "注册"
  end

  def create
    # raise params[:user].inspect
    @user = User.new(params[:user])
    @user.status = get_dict("UserBase.status",1).id
    @user.build_broker(:broker_code => params[:user][:usercode],
                      :broker_name => params[:user][:name],
                      :certificate_num => params[:user][:certificate_num],
                      :bank_account => params[:user][:bank_account],
                      :mobile => params[:user][:mobile],
                      :email => params[:user][:email],
                      :branch_id => Branch.find_by_code("0010").id,
                      :open_date => Time.now.strftime("%m/%d/%Y"),
                      :broker_status => get_dict("BrokerBase.status", 1).id)
    @user.assignments.build(:role_id => Role.find_by_name("普通居间人").id)

    if @user.save
      @broker = @user.broker
      @longurl = APP_CONFIG['url_generator']+@broker.id.to_s
      a = { APP_CONFIG['url_params'] => @longurl }
      x = Net::HTTP.post_form(URI.parse(APP_CONFIG['url_shorter']), a)
      @tinyurl = JSON.parse(x.body)[APP_CONFIG['url_res']]
      @broker.url = @tinyurl
      @broker.update_attribute :url, @tinyurl

      sign_in @user
      redirect_to root_path, :flash => { :success => "注册成功，欢迎您的加入"}
    else
      @title = "注册"
      render 'new'
    end
  end

  def edit
    # raise request.inspect
    @user  = User.find(params[:id])
    @title = "用户设置"
    @userpositions = Userposition.all
  end

  def update
    @user  = User.find(params[:id])
    @assignments = params[:user][:role_ids]
    @branch = params[:user][:branch_id]
    if @assignments.present?
       @user.update_attribute :role_ids, params[:user][:role_ids]
       @user.update_attribute :userposition_ids, params[:user][:userposition_ids]
        redirect_to users_path, :flash => { :success => "用户权限设置成功" }
    elsif @branch.present?
       @user.update_attribute :branch_id, params[:user][:branch_id]
       @user.broker.update_attribute :branch_id, params[:user][:branch_id]
        redirect_to users_path, :flash => { :success => "用户所属分支机构设置成功" }
    else
      if @user.update_attributes(params[:user])
        @user.update_attribute :first_login, false
        respond_to do |format|
           format.html { redirect_to @user, :flash => { :success => "用户设置成功" } }
           format.js
        end
      else
        @title = "用户设置"
        render 'edit'
      end
    end
  end

  def destroy
    # User.find(params[:id]).destroy
    @user.destroy
    # flash[:success] = "用户已删除"
    redirect_to users_path, :flash => { :success => "用户已删除" }
  end

  private

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      @user = User.find(params[:id])
      redirect_to(root_path) if !current_user.admin? || current_user?(@user)
    end
end
