require 'rails_helper'

RSpec.describe AuditLog, type: :model do
  before do
    @aduit_log = FactoryBot.create(:audit_log)
  end
  
  describe 'creation' do

    it 'can be properly created' do
        expect(@aduit_log).to be_valid
    end
    
  end

  describe 'validations' do

    it 'should be required to have a user assocation ' do
      @aduit_log.user_id = nil 
      expect(@aduit_log).to_not be_valid
    end

    it 'should be required to have a status ' do
      @aduit_log.status = nil 
      expect(@aduit_log).to_not be_valid
    end

    it 'should be required to have a start date ' do
      @aduit_log.start_date = nil 
      expect(@aduit_log).to_not be_valid
    end

    it 'should have a start date equal 6 days prior ' do
        new_audit_log = AuditLog.create(user_id: User.last.id, status: 0)

        expect(new_audit_log.start_date).to eq(Date.today - 6.days)

    end
  end
  
end
