class Tag < ApplicationRecord

    has_many :post_tags
    has_many :posts, through: :post_tags

    validates_presence_of :name, message: 'needs to mean something', default: false
    validates_uniqueness_of :name, message: 'is already taken, we are sorry', default: false

end
