require 'rails_helper'

describe 'navigate' do
  let(:user) {FactoryBot.create(:user)}
  let(:post) {FactoryBot.create(:post, user: user)}
  before do
    
    login_as(user, :scope => :user)
  end
  describe 'index' do
    it 'can be reached successfully' do
        visit posts_path
        expect(page.status_code).to eql(200)   
     end

     it 'has a title of Posts' do
        visit posts_path
        expect(page).to have_content(/Posts/)  
     end

     it 'has a list of posts' do 
        post1 = FactoryBot.create(:post, user: user)
        post2 = FactoryBot.create(:second_post, user: user)
        visit posts_path
        expect(page).to have_content(/text|rationale/)   
     end

     it 'has a scope so that only posts creators can their posts ' do
      post1 = FactoryBot.create(:post, user: user)
      post2 = FactoryBot.create(:second_post, user: user)
      other_user = FactoryBot.create(:post_from_other_user)
      
      visit posts_path
      expect(page).to_not have_content(/This is our rationale for other user/)

     end
  end
  describe 'new' do
    it 'has a link from the homepage' do
    visit root_path
    
    click_link("new_post_from_nav")
    expect(page.status_code).to eq(200)
    end

  end
  describe 'creation' do
    before do
        visit new_post_path
    end
      it 'has a new form that can be reached' do
        expect(page.status_code).to eql(200)
      end
      it 'can be created from new form page' do
        fill_in 'post[date]', with: Date.today
        fill_in 'post[rationale]', with: "Some text goes here"
        click_on "Save"
        expect(page).to have_content("Some text goes here")
      end
      it 'will have a user associated it' do
        fill_in 'post[date]', with: Date.today
        fill_in 'post[rationale]', with: "User Assocation"
        click_on "Save"
        expect(User.last.posts.last.rationale).to eql("User Assocation")  
      end
  end

  describe 'edit' do

    it 'can be edited' do
      visit edit_post_path(post)
      
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Edited Content"
      click_on "Save"
      expect(page).to have_content("Edited Content")
    end

    it 'cannot be edited by a non authorized user' do
      logout(:user)
      non_authorized_user = FactoryBot.create(:non_authorized_user)
      login_as(non_authorized_user, :scope => :user)

      visit edit_post_path(post)
      expect(current_path).to eq(root_path)  

    end

end

  describe 'delete' do

    it 'can be deleted' do
      logout(:user)

      delete_user = FactoryBot.create(:user)
      login_as(delete_user, :scope => :user)
      post_to_delete = Post.create!(date: Date.today, rationale: "rationale content", user_id: delete_user.id)
      
      visit posts_path
      
      click_link("delete_post_#{post_to_delete.id}_from_index")
      expect(page.status_code).to eq(200)

    end

  end

  
end