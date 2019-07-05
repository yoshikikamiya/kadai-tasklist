class User < ApplicationRecord
    has_many :tasks
    validates :name,presence:true, length:{maximum:50}
    validates :email,presence:true,length:{maximum:255},
                format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                uniqueness:{case_sesitive:false}
    has_secure_password
end
