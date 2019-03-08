class Post < ApplicationRecord
 has_many :comments, dependent: :destroy
 has_many :post_tags, dependent: :destroy
 has_many :tags, through: :post_tags
 belongs_to :moderator

 validates :title, presence: true
 validates :content, presence: true

 scope :published, -> {where(publish: true).order(id: :desc)}

 has_attached_file :image, styles: {
    thumb: '80x80#',
    square: '200x200#',
    medium: '300x300>'
  }, default_url: ActionController::Base.helpers.asset_path('cat.jpg')

 validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

 def self.matching_title_or_content search
 	where("title LIKE ? OR content LIKE ?","%#{search}%","%#{search}%")
 end
 def self.filter_by_tags param_tag
 	includes(:tags).where(publish: true, tags: {name: param_tag}).order(id: :desc)
 end
end
