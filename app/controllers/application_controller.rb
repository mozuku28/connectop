class ApplicationController < ActionController::Base

    def after_sign_in_path_for(resource)
        if admin_signed_in?
            admins_path
        elsif user_signed_in?
            root_path
        else
            root_path
        end
    end

    def after_sign_out_path_for(resource)
        if admin_signed_in?
            admin_session_path
        elsif user_signed_in?
            root_path
        else
            root_path
        end
    end

end
