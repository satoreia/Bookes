class Book < ApplicationRecord
	validates :title, presence: true
	validates :body, presence: true
	# schema.rbでt.string"title"とか確認する
end
