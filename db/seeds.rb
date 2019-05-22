@user1 = User.create(first_name: "Luke", last_name: "Skywalker", email: "mark@test.org", password: "test123", password_confirmation: "test123")
@user2 = User.create(first_name: "Mace", last_name: "Windu", email: "mace@test.org", password: "test123", password_confirmation: "test123")

puts "Created 2 users"

AdminUser.create(first_name: "Admin", last_name: "User", email: "admin@test.org", password: "admin123", password_confirmation: "admin123")
puts "Created Admin User"
50.times do |post|
    Post.create!(date: Date.today, rationale: "#{post} rationale content", user_id: @user1.id, overtime_request: 5.0)
end

puts "50 posts have been created for user #{@user1.first_name}"

50.times do |post|
    Post.create!(date: Date.today, rationale: "#{post} rationale content", user_id: @user2.id, overtime_request: 3.5)
end

puts "50 posts have been created for user #{@user2.first_name}"