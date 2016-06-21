class ApplicationController < ActionController::Base

  #   # Rails recommends to use :null_session for APIs
  protect_from_forgery with: :null_session

  def index
  end


  def self.helper_method(*args)
  end
  def self.hide_action(*args)
  end
end
