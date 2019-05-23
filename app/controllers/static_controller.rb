class StaticController < ApplicationController

    def home
        @recent_audit_items = AuditLog.last(10)
        @pending_approvals = Post.submitted
    end

end