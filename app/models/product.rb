class Product < ActiveRecord::Base
  has_many :categorizations, :dependent => :destroy
  has_many :categories, :through => :categorizations

  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :categories

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_presence :image
  validates_attachment_size :image, :less_than => 5.megabytes
  validates_attachment_content_type :image, :content_type => ['image/jpg', 'image/jpeg', 'image/pjpeg', 'image/gif', 'image/png', 'image/x-png']

  def self.by_category(category)
    products = category.products

    category.children.each do |child|
      products += Product.by_category(child)
    end

    products.uniq
  end
end
