module DefaultPageContent
  extend ActiveSupport::Concern

  included do 
    before_filter :set_page_defaults
  end

  def set_page_defaults
    @page_title = "Portfolio | My Portfolio website"
    @seo_keywords = "Alex Perkin Portfolio"
  end
end