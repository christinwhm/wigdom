class Message < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :body

  validates_format_of :email, :with => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
end
