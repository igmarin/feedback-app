require 'faker'

['employee', 'admin'].each do |role|
  Role.find_or_create_by(name: role)
end

user = User.where(email: 'ismael.marin@gmail.com').first_or_initialize
if user
  user.role_id = Role.where(name: 'admin').first.id
  user.password = 'administrator'
  user.save
end

10.times do
  User.create(email: Faker::Internet.email, password: 'password', role_id: Role.ids.sample)
end
