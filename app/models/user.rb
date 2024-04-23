class User < ApplicationRecord

    has_many :posts, dependent: :destroy

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true, format: {with: URI::MailTo::EMAIL_REGEXP}
    validates :password, presence: true, length: {minimum: 6}

    before_validation :strip_whitespace
    before_validation :downcase_email
    before_validation :regularize_name

    private
        def strip_whitespace
            self.name = name.strip
            self.email = email.strip
        end
        def downcase_email
            self.email = email.downcase
        end
        def regularize_name
            self.name = name.strip.titleize
        end
    
end