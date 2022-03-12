require 'faker'

def user_params
  time = Faker::Time.backward
  {
    email: Faker::Internet.email,
    encrypted_password: User.new.send(:password_digest, 'password') ,
    created_at: time,
    updated_at: time
  }
end

User.insert_all!(10.times.map { user_params })
