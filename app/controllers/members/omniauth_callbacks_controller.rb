class Members::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @member = Member.from_omniauth(request.env["omniauth.auth"])

    if @member.persisted?
      session[:user_return_to] = request.env["omniauth.origin"]
      sign_in_and_redirect @member, :event => :authentication
      set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?
    else
      session["devise.user_attributes"] = @member.attributes
      redirect_to request.env["omniauth.origin"]
    end
  end
end
