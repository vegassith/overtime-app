class StaticController < ApplicationController

    def home
        @audit_logs = AuditLog.pending
        @pending_approvals = Post.submitted
    end

end