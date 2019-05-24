namespace :notification do
  desc "Sends SMS Notification to employees asking them to log if they have overtime or not"
  task sms: :environment do
    employees = Employee.all
    notification_message = " Please log into the overtime management dashboard to request overtime or confirm your hours for last week: #{ENV['WEBSITE_URL']}"
    employees.each do |employee|
        AuditLog.create!(user_id: employee.id)
        SmsTool.send_sms(number: employee.phone, message: notification_message )
      end
  end
  desc "Sends EMAIL Notification to manager (adminusers) each day to inform of pending overtime requests"
  task manager_email: :environment do
    submitted_posts = Post.submitted
    admin_users = AdminUser.all
    if submitted_posts.count > 0
      
      admin_users.each do |admin_user|
        ManagerMailer.email(admin_user).deliver_now
      end
    end
  end

end
