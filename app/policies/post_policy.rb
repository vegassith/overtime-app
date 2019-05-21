class PostPolicy < ApplicationPolicy

    def update?
        record.user.id == user.id || admin_types.include?(current_user.type))
    end

end