FactoryBot.define do
    factory :post do
        date { Date.today }
        worked_performed { 'Some text goes here' }
        daily_hours {8.5 }
        user
        
    end
    factory :second_post, class: "Post" do
        date { Date.yesterday }
        worked_performed { 'This is my worked_performed' }
        daily_hours {7.5 }
        user
    end

    factory :post_from_other_user, class: "Post" do
        date { Date.yesterday }
        worked_performed { 'This is our worked_performed for other user' }
        daily_hours {8.9 }
        user { FactoryBot.create(:non_authorized_user)}
    end
end