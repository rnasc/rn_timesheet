class ApplicationController < ActionController::Base
    before_action :authenticate_user!, except: %i[ home ]
    before_action :check_authorization

    private

    ADMIN_ONLY ||= {
        "projects#index" => true,
        "projects#edit" => true,
        "projects#destroy" => true,
    }
    
    def check_authorization 
        return unless current_user

        controller = params[:controller]
        action = params[:action]
        auth_search = "#{controller}##{action}"
        access_level = ADMIN_ONLY[auth_search]

        return unless access_level

        unless current_user.admin
            redirect_to root_path, notice: 'Usuario sem acesso'
        end
        
    end
    
end
