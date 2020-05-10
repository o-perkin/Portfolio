class Portfol < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumb_image

  def self.angular
    where(subtitle: "Angular")
  end

  scope :ruby_on_rails_portfol_items, -> { where(subtitle: "Ruby on Rails") }
end
 