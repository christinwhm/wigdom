class Product < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :name
  validates_presence_of :description
  validates_associated :user

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
end
