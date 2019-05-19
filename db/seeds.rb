@user1 = User.create(first_name: "Luke", last_name: "Skywalker", email: "mark@test.org", password: "test123", password_confirmation: "test123")
@user2 = User.create(first_name: "Mace", last_name: "Windu", email: "mace@test.org", password: "test123", password_confirmation: "test123")

50.times do |post|
    Post.create!(date: Date.today, rationale: "#{post} rationale content", user_id: @user1.id)
end
50.times do |post|
    Post.create!(date: Date.today, rationale: "#{post} rationale content", user_id: @user2.id)
end
puts "100 posts have been created"