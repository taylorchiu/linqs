class Link < ActiveRecord::Base
  has_many :link_tags
  has_many :tags, through: :link_tags
  has_many :comments, as: :commentable
  belongs_to :user
  accepts_nested_attributes_for :link_tags

  validates :title, presence: true, length: {minimum: 2}
<<<<<<< HEAD
  validates :url, presence: true, length: {minimum: 9}
=======
  validates :url, presence: true, length: {minimum: 5}
  #validates :url, :presence => {:message => 'URL cannot be blank.'}, :format => {:with => /\A[www]+[A-Za-z0-9._%+-]+\.[A-Za-z]+\z/, :message => 'INCORRECT FORMAT!'}

 
>>>>>>> 48290b8528a11f42af859fd758027a4bd5243175
end
