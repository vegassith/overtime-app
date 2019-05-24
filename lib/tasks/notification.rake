namespace :notification do
  desc "Sends SMS Notification to employees asking them to log if they have overtime or not"
  task sms: :environment do
   # User.all.each do |user|
    #  SmsTool.send_sms()
    #end
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
