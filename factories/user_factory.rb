Factory.define :user do |user|
  user.email { "user#{rand(10000)}@ticketee.com" }
  user.password "password"
  user.password_confirmation {|u| u.password }
  user.admin false
end
