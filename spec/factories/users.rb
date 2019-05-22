FactoryBot.define do
    sequence :email do |n|
        "test#{n}@test.com"
    end

    factory :user do
        first_name { 'Jon' }
        last_name { 'Snow' }
        email { generate :email }
        password {'test123'}
        password_confirmation {'test123'}
        phone { "#{ENV['SMS_NUMBER']}" }
    end
    factory :admin_user, class: "AdminUser" do
        first_name { 'Admin' }
        last_name { 'User' }
        email { generate :email }
        password {'asdfghjk'}
        password_confirmation {'asdfghjk'}
        phone { "#{ENV['SMS_NUMBER']}" }
    end

    factory :non_authorized_user, class: "User" do
        first_name { 'Non' }
        last_name { 'Authorized' }
        email { generate :email }
        password {'test123'}
        password_confirmation {'test123'}
        phone { "#{ENV['SMS_NUMBER']}" }
    end
end