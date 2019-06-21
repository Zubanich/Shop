# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_order
    @current_order ||= OrderService::Current.call(user)
  end
end
