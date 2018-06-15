user = User.where(email: 'ismael.marin@gmail.com').first_or_initialize
user.password = 'administrator'
user.save

['employee', 'admin'].each do |role|
  Role.find_or_create_by(name: role)
end
