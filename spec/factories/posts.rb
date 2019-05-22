FactoryBot.define do
    factory :post do
        date { Date.today }
        rationale { 'Some text goes here' }
        overtime_request {2.5 }
        user
        
    end
    factory :second_post, class: "Post" do
        date { Date.yesterday }
        rationale { 'This is our rationale' }
        overtime_request {0.5 }
        user
    end

    factory :post_from_other_user, class: "Post" do
        date { Date.yesterday }
        rationale { 'This is our rationale for other user' }
        overtime_request {3.5 }
        user { FactoryBot.create(:non_authorized_user)}
    end
end