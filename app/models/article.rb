class Article < ApplicationRecord
  has_many :images, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :images, reject_if: proc { |attributes| attributes['file'].blank? }, allow_destroy: true

  enum theme: { IT_technology: 0, Adventure: 1, Family: 2, Other: 3 }
end
