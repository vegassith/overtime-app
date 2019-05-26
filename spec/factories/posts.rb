FactoryBot.define do
    factory :post do
        date { Date.today }
        rationale { 'Some text goes here' }
        daily_hours {8.5 }
        user
        
    end
    factory :second_post, class: "Post" do
        date { Date.yesterday }
        rationale { 'This is our rationale' }
        daily_hours {7.5 }
        user
    end

    factory :post_from_other_user, class: "Post" do
        date { Date.yesterday }
        rationale { 'This is our rationale for other user' }
        daily_hours {8.9 }
        user { FactoryBot.create(:non_authorized_user)}
    end
end