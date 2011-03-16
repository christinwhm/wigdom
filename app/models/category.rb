class Category < ActiveRecord::Base
  acts_as_tree

  has_many :categorizations, :dependent => :destroy
  has_many :products, :through => :categorizations

  def before_update
    if self.id == self.parent_id
      errors.add(:base, "You can not be the parents of yourself.")
      return false
    end
  end
end
