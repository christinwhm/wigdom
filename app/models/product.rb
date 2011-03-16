class Product < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :description

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
end
