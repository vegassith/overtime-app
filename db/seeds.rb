@user1 = Employee.create(first_name: "Luke", 
                    last_name: "Skywalker", 
                    email: "mark@test.org", 
                    password: "test123", 
                    password_confirmation: "test123",
                    phone: "#{ENV['SMS_NUMBER']}",
                    ssn: "1234",
                    company: "ABC Company")
@user2 = Employee.create(first_name: "Mace", 
                    last_name: "Windu", 
                    email: "mace@test.org", 
                    password: "test123", 
                    password_confirmation: "test123",
                    phone: "#{ENV['SMS_NUMBER']}",
                    ssn: "1234",
                    company: "ABC Company")

puts "Created 2 users"

AdminUser.create(first_name: "Admin", 
                last_name: "User", 
                email: "admin@test.org", 
                password: "admin123", 
                password_confirmation: "admin123",
                phone: "#{ENV['SMS_NUMBER']}",
                ssn: "1234",
                company: "ABC Company")

puts "Created Admin User"

7.times do |auditlog|
    AuditLog.create(user_id: @user2.id, status: 0, start_date: (Date.today - SecureRandom.random_number(1..60).days ))
end
puts "7 auditlog entries have been created for user #{@user2.first_name}"


7.times do |auditlog|
    AuditLog.create(user_id: @user1.id, status: 0, start_date: (Date.today - SecureRandom.random_number(1..60).days))
end

puts "7 auditlog entries have been created for user #{@user1.first_name}"
50.times do |post|
    Post.create!(date: Date.today, rationale: "#{post} rationale content Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", user_id: @user1.id, daily_hours: 12.0)
end

puts "50 posts have been created for user #{@user1.first_name}"

50.times do |post|
    Post.create!(date: Date.today, rationale: "#{post} rationale content Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", user_id: @user2.id, daily_hours: 11.5)
end

puts "50 posts have been created for user #{@user2.first_name}"

