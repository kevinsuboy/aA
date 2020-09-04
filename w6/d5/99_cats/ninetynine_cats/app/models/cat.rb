CAT_COLOR = ["red", "blue", "green", "gray", "black", "orange"]
class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper
  validates :color, inclusion: CAT_COLOR
  validates :gender, inclusion: ["M", "F"] 


  def age
    (Time.now - self.birth_date)
  end
end
