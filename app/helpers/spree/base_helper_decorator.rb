Spree::BaseHelper.module_eval do

  def link_to_cart(text = t('cart'))
    if current_order.nil? or current_order.line_items.empty?
      text = "#{text}: (#{t('empty')})"
    else
      text = "#{text}: (#{current_order.item_count}) #{current_order.display_total}"
    end
    link_to text, cart_path, :class => css_class(cart_path)
  end
  
  def css_class(path)
    current_page?(path) ? "ui-btn-active" : ""
  end
  
  def copyright
    "<p>#{t(:powered_by)} <a href=\"http://spreecommerce.com/\">Spree</a></p>".html_safe
  end
end
