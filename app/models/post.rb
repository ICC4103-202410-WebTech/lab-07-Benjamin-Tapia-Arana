class Post < ApplicationRecord

    belongs_to :users, class_name: "User", foreign_key: "user_id"
    has_many :post_tags
    has_many :tags, through: :post_tags
    has_many :subposts, class_name: "Post", foreign_key: "parent_post_id"
    belongs_to :parent_post, class_name: "Post", optional: true

    validates_presence_of :title, message: 'please, Duh doy!', default: false
    validates_presence_of :content, message: 'is needed. You need to send something!', default: false
    validates_presence_of :user_id, message: 'is the only way to know who post it', default: false
    validates :answers_count, numericality: {only_integer: true, greater_than_or_equal_to: 0, message: 'must be 0 or a positive number, silly!'}
    validates :likes_count, numericality: {only_integer: true, greater_than_or_equal_to: 0, message: 'must be 0 or a positive number, silly!'}

    before_validation :set_published_at

    private
        def set_published_at
            self.published_at = Time.now
        end
    
end