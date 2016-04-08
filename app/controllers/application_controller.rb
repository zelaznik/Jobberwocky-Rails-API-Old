class ApplicationController < ActionController::Base
  include Authenticable
  respond_to :json

  def self.cors_allowed_actions
    @cors_allowed_actions ||= []
  end

  def self.cors_allowed_actions=(arr)
    @cors_allowed_actions = arr
  end

  def self.allow_cors(*methods)
    self.cors_allowed_actions += methods
    before_filter :cors_before_filter, :only => methods
  end

end
