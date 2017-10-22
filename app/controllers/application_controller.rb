class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_worker!
  
  def after_sign_in_path_for(resource)
    if current_worker.has_role?(:admin)
      workers_path
    end
  end

  def current_ability
    @current_ability ||= ::Ability.new(current_worker)
  end
end
