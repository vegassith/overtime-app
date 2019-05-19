100.times do |post|
    Post.create!(date: Date.today, rationale: "#{post} rationale content")
end
User.create!(first_name: "Mark", last_name: "Murphy", email: "mark@esca.org", password: "test123", password_confirmation: "test123")

puts "100 posts have been created"