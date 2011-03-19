TaxonsController.class_eval do
  def index
    @taxonomies = get_taxonomies
  end
end
