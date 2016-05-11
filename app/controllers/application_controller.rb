class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def loggedin?
    !!session[:id]
  end

  def current_user
    User.find
  end

  def is_a_valid_email?(email)
    (email =~ /^(([A-Za-z0-9]*\.+*_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\+)|([A-Za-z0-9]+\+))*[A-Z‌​a-z0-9]+@{1}((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,4}$/i)
  end

  def get_emergency_numbers(countryCode)
    data = HTTParty.get("http://emergencynumberapi.com/api/country/#{countryCode}")
    numbers = []
    if data["error"] == nil || data["error"] == "" 
      dispatch = data["data"]["dispatch"]["all"] || data["data"]["dispatch"]["gsm"] || data["data"]["dispatch"]["fixed"]
      if dispatch.join != "" && dispatch.join != nil
        numbers << dispatch.join
      else 
        ambulance = data["data"]["ambulance"]["all"] || data["data"]["ambulance"]["gsm"] || data["data"]["ambulance"]["fixed"]
        fire = data["data"]["fire"]["all"] || data["data"]["fire"]["gsm"] || data["data"]["fire"]["fixed"]
        police = data["data"]["police"]["all"] || data["data"]["police"]["gsm"] || data["data"]["police"]["fixed"]
        numbers << ambulance.join
        numbers << fire.join
        numbers << police.join
      end
    end
    return numbers
  end

end


