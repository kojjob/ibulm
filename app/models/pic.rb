class Pic < ApplicationRecord

  belongs_to :user
  has_many :comments, dependent: :destroy
  acts_as_votable

  extend FriendlyId
  friendly_id :title, use: :slugged

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validates :user_id, presence: true
end
