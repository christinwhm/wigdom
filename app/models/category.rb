class Category < ActiveRecord::Base
  acts_as_nested_set :dependent => :destroy

  validates_presence_of :name
  validates_uniqueness_of :name, :scope => :parent_id
  validate :loop

  has_many :categorizations, :dependent => :destroy
  has_many :products, :through => :categorizations

  private
  def loop
    if self.ancestors.include? self
      self.errors.add(:parent_id, "You can not be the parent of yourself.")
    end
  end
end
