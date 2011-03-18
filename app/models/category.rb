class Category < ActiveRecord::Base
  acts_as_nested_set

  validates_presence_of :name
  validates_uniqueness_of :name, :scope => :parent_id
  validate :loop

  has_many :categorizations, :dependent => :destroy
  has_many :products, :through => :categorizations

  private
  def loop
    if self.ancestors.include? self
      self.errors.add(:parent_id, "不能作为自己的父节点")
    end
  end
end
