class User < ApplicationRecord

    has_many :posts, dependent: :destroy

    validates_presence_of :name, message: 'is needed. We need at least one, please!', default: false
    validates_uniqueness_of :email, message: 'already taken? That\'s so last season!', default: false
    validates_presence_of :email, message: 'please! We can\'t stay in touch without it!', default: false
    validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP, message: 'is invalid? That\'s a bummer!', default: false
    validates_presence_of :password, message: 'please! Keep it secret, keep it safe!', default: false
    validates_length_of :password, minimum: 6, message: 'too short? That\'s not very secure, darling!', default: false

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