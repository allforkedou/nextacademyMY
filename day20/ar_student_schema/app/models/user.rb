class User < ActiveRecord::Base
    validates :email, presence: true
    validates :age, presence: true
end