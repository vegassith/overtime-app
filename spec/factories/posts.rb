FactoryBot.define do
    factory :post do
        date { Date.today }
        rationale { 'Some text goes here' }
        user
    end
    factory :second_post, class: "Post" do
        date { Date.yesterday }
        rationale { 'This is our rationale' }
        user
    end

    factory :post_from_other_user, class: "Post" do
        date { Date.yesterday }
        rationale { 'This is our rationale for other user' }
        user { FactoryBot.create(:non_authorized_user)}
    end
end