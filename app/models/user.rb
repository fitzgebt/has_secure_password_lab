class User < ApplicationRecord
    validate :name
    has_secure_password
end
