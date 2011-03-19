Spree::BaseController.class_eval do
  before_filter :prepare_for_mobile
  before_filter :prepend_view_path_if_mobile
  
  protected

  def mobile_device?
    if session[:mobile_param]
      session[:mobile_param] == "1"
    else
      request.user_agent =~ /Mobile|webOS/
    end
  end
  helper_method :mobile_device?

  private

  def prepare_for_mobile
    session[:mobile_param] = params[:mobile] if params[:mobile]
  end
  
  def prepend_view_path_if_mobile
    if mobile_device?
      prepend_view_path File.join(File.dirname(__FILE__), '..', 'mobile_views')
      prepend_view_path File.join(Rails.root, 'app', 'mobile_views')
    end
  end
end
