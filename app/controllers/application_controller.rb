class ApplicationController < ActionController::Base
	include TheComments::ViewToken
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_action :prepare_meta_tags, if: "request.get?"

  protected

  def prepare_meta_tags(options={})
    site_name   = "Kopilka-Receptov.com"
    title       = [controller_name, action_name].join(" ")
    meta_description = "The CookiesHQ team creates web software for humans"
    image       = options[:image] || "your-default-image-url"
    current_url = request.url
    defaults = {
      site:        site_name,
      title:       title,
      reverse:     true,
      image:       image,
      description: meta_description,
      keywords:    %w[web software development mobile app],
      twitter: {
        site_name: site_name,
        site: '@thecookieshq',
        card: 'summary',
        description: meta_description,
        image: image
      },
      og: {
        url: current_url,
        site_name: site_name,
        title: title,
        image: image,
        description: meta_description,
        type: 'website'
      }
    }

      options.reverse_merge!(defaults)
      set_meta_tags options
  end

  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:email, :password, :password_confirmation, :chefname)}
  	devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:email, :password, :password_confirmation, :current_password, :chefname, :adress, :user_image)}
	end

end
