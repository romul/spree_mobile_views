require 'spree_core'
require 'spree_mobile_views/engine'
require 'spree/core/controller_helpers'


module SpreeMobileViews
end

module Spree
  module Core
    module ControllerHelpers
      protected
      MOBILE_USER_AGENTS = 'palm|blackberry|nokia|phone|midp|mobi|symbian|chtml|ericsson|minimo|' +
        'audiovox|motorola|samsung|telit|upg1|windows ce|ucweb|astel|plucker|' +
        'x320|x240|j2me|sgh|portable|sprint|docomo|kddi|softbank|android|mmp|' +
        'pdxgw|netfront|xiino|vodafone|portalmmm|sagem|mot-|sie-|ipod|up\\.b|' +
        'webos|amoi|novarra|cdm|alcatel|pocket|ipad|iphone|mobileexplorer|mobile'

      def mobile_device?
        if cookies[:mobile_param]
          cookies[:mobile_param] == "1"
        else
          request.user_agent.to_s.downcase =~ Regexp.new(MOBILE_USER_AGENTS)
        end
      end

      def prepare_for_mobile
        cookies[:mobile_param] = params[:mobile] if params[:mobile]
      end

      def prepend_view_path_if_mobile
        if mobile_device?
          prepend_view_path File.join(File.dirname(__FILE__), '..', 'app', 'mobile_views')
          prepend_view_path File.join(Rails.root, 'app', 'mobile_views')
        end
      end


      class << self
        def included_with_mobile_views(base)
          included_without_mobile_views(base)
          base.class_eval do 
            helper_method :mobile_device?
            before_filter :prepare_for_mobile
            before_filter :prepend_view_path_if_mobile
          end
        end

        alias_method_chain :included, :mobile_views

      end

    end
  end
end
