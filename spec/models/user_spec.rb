require 'spec_helper'

describe User do
  before(:each) do
    @attr = { 
     :name => "test", 
     :email => "test@mail.com",  
     :password => "validpassword",
     :password_confirmation => "validpassword"
    }
  end
  
  it "should create a new instance given a valid attribute" do
    User.create!(@attr)
  end
  
  it "should require a name" do
    no_name_user = User.new(@attr.merge(:name => ""))
    no_name_user.should_not be_valid
  end
  
  it "should require a email address" do
    no_email_user = User.new(@attr.merge(:email => ""))
    no_email_user.should_not be_valid
  end
  
  it "should reject long name" do
    long_name = "a" * 21
    long_name_user = User.new(@attr.merge(:name => long_name))
    long_name_user.should_not be_valid
  end
  
  it "should accept valid email address" do
    addresses = %w[user@mail.com A.b@c.com aa_t@b.org]
    addresses.each do |address|
      valid_email_user = User.new(@attr.merge(:email => address))
      valid_email_user.should be_valid
    end
  end
  
  it "should reject invalid email address" do
    addresses = %w[user@mail,com a@b d_#_g aaa@b.ccc.]
    addresses.each do |address|
      invalid_email_user = User.new(@attr.merge(:email => address))
      invalid_email_user.should_not be_valid    
    end
  end
  
  it "should reject duplicate email address" do
    User.create!(@attr)
    user_with_same_email = User.new(@attr)
    user_with_same_email.should_not be_valid
  end
  
  it "should reject UPCASE email address" do
    upcased_email = @attr[:email].upcase
    User.create!(@attr.merge(:email => upcased_email))
    user_with_same_email = User.new(@attr)
    user_with_same_email.should_not be_valid
  end
  
  describe "password" do
    before(:each) do
      @user = User.new(@attr)
    end
    
    it "should have a password attribute" do
      @user.should respond_to(:password) 
    end
    
    it "should have a password confirmation attribute" do
      @user.should respond_to(:password_confirmation)
    end
  end
  
  describe "password validations" do
    it "should requite a password" do
      User.new(@attr.merge(:password => "", :password_confirmation => ""))
                          .should_not be_valid
    end
    
    it "should require a matching password confirmation" do
      User.new(@attr.merge(:password_confirmation => "invalid")).should_not be_valid
    end
    
    it "should reject short passwords" do
      short = "a" * 4
      hash = @attr.merge(:password => short, :password_confirmation => short)
      User.new(hash).should_not be_valid
    end
    
    it "should reject long passwords" do
      long = "a" * 21
      hash = @attr.merge(:password => long, :password_confirmation => long)
      User.new(hash).should_not be_valid
    end
  end
  
  describe "password encryption" do
    
    before(:each) do
      @user = User.create!(@attr)
    end
    
    it "should have a encrypted password attribute" do
      @user.should respond_to(:encrypted_password)
    end
    
    it "should set the encrypted password attribute" do
      @user.encrypted_password.should_not be_blank 
    end
    
    it "should have a salt" do
      @user.should respond_to(:salt)
    end
    
    describe "has_password? method" do
      
      it "should exist" do
        @user.should respond_to(:has_password?)
      end
      
      it "should return true if password match" do
        @user.has_password?(@attr[:password]).should be_true
      end
      
      it "should return false if password don't match" do
        @user.has_password?("invalid").should be_false
      end
    end
    
    describe "authenticate method" do
      it "should exist" do
        User.should respond_to(:authenticate)
      end
      
      it "should return nil on email/password mismatch" do
        User.authenticate(@attr[:email], "wrongpass").should be_nil
      end
      
      it "should return nil for an email address with no user" do
        User.authenticate("v@a.com", @attr[:password]).should be_nil
      end
      
      it "should return user on email/password match" do
        User.authenticate(@attr[:email], @attr[:password]).should == @user
      end
    end
  end
  
  describe "admin attribute" do
    
    before(:each) do
      @user = User.create!(@attr)
    end
    
    it "should respond to admin" do
      @user.should respond_to(:admin)
    end
    
    it "should not be an admin by default" do
      @user.should_not be_admin
    end
    
    it "should be able to covert to admin" do
      @user.toggle!(:admin)
      @user.should be_admin
    end
  end
end

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
