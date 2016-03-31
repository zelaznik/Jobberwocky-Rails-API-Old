class CorsController < ApplicationController
  def preflight
    begin
      http_request_verb = request.headers['Access-Control-Request-Method']
      unless ["POST", "PUT", "PATCH", "DELETE"].include?(http_request_verb)
        raise "Invalid Request Verb"
      end

      # This line will raise an exception if the path does not resolve to any controller/action.
      # details looks something like this { :controller => "posts", :action => "index" }
      details = Rails.application.routes.recognize_path(
        request.original_fullpath, :method => http_request_verb.downcase.to_sym
      )

      # Convert to the controller class name (posts => PostsController)
      # Since we recorded the action names as symbol, we should convert it to symbol here
      controller_class_name = details[:controller].capitalize + "Controller"
      action_name = details[:action].to_sym

      # If this statement returns true, then CORS is allowed
      if eval(controller_class_name).cors_allowed_actions.include?(action_name)
        headers['Access-Control-Allow-Headers'] = request.headers['Access-Control-Request-Headers']
        headers['Access-Control-Allow-Origin']  = request.headers['Origin']
        headers['Access-Control-Allow-Methods'] = http_request_verb
        headers['Access-Control-Max-Age']       = "2718"
        headers['Source-Code'] = 'CorsController'
      end

    rescue
    end

    # Render empty stuff since preflight requests care only about the headers
    render :text => "", :content_type => 'text/plain'
  end
end
