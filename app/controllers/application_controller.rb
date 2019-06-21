# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def self.check_user
    before_action :check_user
  end

  def self.check_order
    before_action :current_order
  end

  private

 def check_user
   @current_user = current_user
   redirect_to new_user_session_path if @current_user.blank?
 end

 def check_order
   redirect_to :not_found if order_fetcher.failure?
 end

 def order_fetcher
   @order_fetcher ||= OrderService::Current.call(current_user)
 end

  def current_order
    @current_order ||= order_fetcher.value if order_fetcher.success?
  end


  def redirect_with_error(path, error)
    redirect_to path, flash: { error: [error].flatten.joins(', ') }
  end

  def redirect_back_result(result)
    if result.success?
      redirect_back fallback_location: root_path, flash: { success: 'Success' }
    else
      redirect_back fallback_location: root_path, flash: { error: [result.value].flatten.join(', ') }
    end
  end
end
