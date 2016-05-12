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
    emergency = Emergency.new(countryCode)
  end

end

class Emergency
    def initialize(countryCode)
      @response = HTTParty.get("http://emergencynumberapi.com/api/country/#{countryCode}")
    end

    def error?
      if @response["error"] != nil && @response["error"] != ""
        return true
      else
        return false
      end
    end

    def dispatch
      numbers = get_numbers("dispatch")  
    end

    def ambulance
      numbers = get_numbers("ambulance")
    end

    def fire
      numbers = get_numbers("fire")    
    end

    def police
      numbers = get_numbers("police")
    end

    private
    def get_numbers(keyword)
      data = @response["data"][keyword]
      numbersArr = []
      if data["all"] == nil
        all = nil
      elsif data["all"].join == ""
        all = nil
      else
        all = data["all"].join("/")
        numbersArr << all
      end

      if data["gsm"] == nil
        gsm = nil
      elsif data["gsm"].join == ""
        gsm = nil
      else
        gsm = data["gsm"].join
        numbersArr << gsm
      end

      if data['fixed'] == nil
        fixed = nil
      elsif data["fixed"].join == ""
        fixed = nil
      else
        fixed = data['fixed'].join
        numbersArr << fixed
      end
      numbers = numbersArr.join("/")
      return numbers
    end


  end


