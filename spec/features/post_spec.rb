require 'rails_helper'

describe 'navigate' do
  describe 'index' do
    it 'can be reached successfully' do
        visit posts_path
        expect(page.status_code).to eql(200)   
     end

     it 'has a title of Posts' do
        visit posts_path
        expect(page).to have_content(/Posts/)  
     end
  end

  describe 'creation' do
    before do
        user = User.create(email: "test@test.com", password: "123456", password_confirmation: "123456", first_name: "Jon", last_name: "Snow")
        login_as(user, :scope => :user)
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
  
end