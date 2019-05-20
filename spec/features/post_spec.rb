require 'rails_helper'

describe 'navigate' do
  before do
    @user = FactoryBot.create(:user)
    login_as(@user, :scope => :user)
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
        post1 = FactoryBot.create(:post)
        post2 = FactoryBot.create(:second_post)
        visit posts_path
        expect(page).to have_content(/text|rationale/)   
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
  before do
    @post = FactoryBot.create(:post)
  end
    it 'can be reached by clicking edit on index page' do
    visit posts_path

    click_link("edit_#{@post.id}")
    expect(page.status_code).to eq(200)
  end

  it 'can be edited' do
    visit edit_post_path(@post)
    fill_in 'post[date]', with: Date.today
    fill_in 'post[rationale]', with: "Edited Content"
    click_on "Save"
    expect(page).to have_content("Edited Content")
  end
  end

  describe 'delete' do
    before do
      @post = FactoryBot.create(:post)
    end
    it 'can be deleted' do
      visit posts_path
      
      click_link("delete_post_#{@post.id}_from_index")
      expect(page.status_code).to eq(200)

    end

  end

  
end