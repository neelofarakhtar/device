class User < ApplicationRecord
  rolify
  require 'csv'
  # include Bhopal
  extend Bhopal
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,:confirmable,
         :recoverable, :rememberable, :validatable,authentication_keys: [:login]

 attr_writer :login

  def login
    @login || self.username || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login))
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end

   after_create :assign_default_role

  def assign_default_role
    self.add_role(:newuser) if self.roles.blank?
  end

    def self.import(file)
      # debugger
      file =File.open(file)
        csv = CSV.parse(file, headers: true)
        csv.each do |row|
            user_hash = User.new
            user_hash.firstname = row[0]
            user_hash.lastname = row[1]
            user_hash.email = row[2]
            user_hash.address = row[3]
            user_hash.mobile_number = row[4]
            user_hash.password = row[5]
            user_hash.save!
        end
    end
end
