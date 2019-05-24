 every :sunday, at: '12pm' do
    rake "notification:sms"
 end

 every 1.day, at: '4:00 pm' do
    rake "notification:manager_email"
  end
  

