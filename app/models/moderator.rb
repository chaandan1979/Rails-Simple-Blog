class Moderator < ApplicationRecord
	has_secure_password

	has_many :posts

	validates :fullname, presence: true
	validates :username, presence: true, format: {with: /@/, message: 'is not valid email address'}
	validates :password, presence: true

	has_attached_file :pimage, styles: {
    thumb: '100x150#',
    square: '200x200#',
    medium: '300x300>'
  }

    validates_attachment_content_type :pimage, content_type: /\Aimage\/.*\z/

end
