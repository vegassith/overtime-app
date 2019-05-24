require 'rails_helper'

describe 'Home' do
    it 'allows the admin to approve posts from the home page' do
        post = FactoryBot.create(:post)
        admin_user = FactoryBot.create(:admin_user)
        login_as(admin_user, :scope => :user)
        
        visit root_path
        click_on("approve_#{post.id}")

        expect(post.reload.status).to eq('approved')
        
    end
    it 'allows the employee to change the audit log status from the home page' do
        
        user = FactoryBot.create(:user)
        login_as(user, :scope => :user)
        auditlog = FactoryBot.create(:audit_log, user: user)

        visit root_path
        
        click_on("confirm_#{auditlog.id}")

        expect(auditlog.reload.status).to eq('confirmed')
        
    end
end