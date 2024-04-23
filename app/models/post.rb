class Post < ApplicationRecord

    belongs_to :users, class_name: "User", foreign_key: "user_id"
    has_many :post_tags
    has_many :tags, through: :post_tags
    has_many :subposts, class_name: "Post", foreign_key: "parent_post_id"
    belongs_to :parent_post, class_name: "Post", optional: true

    validates :title, presence: true
    validates :content, presence: true
    validates :user_id, presence: true
    validates :answers_count, numericality: {only_integer: true, greater_than_or_equal_to: 0}
    validates :likes_count, numericality: {only_integer: true, greater_than_or_equal_to: 0}

    before_validation :set_published_at

    private
        def set_published_at
            self.published_at = Time.now
        end
    
end