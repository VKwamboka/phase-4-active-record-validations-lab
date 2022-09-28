class Post < ApplicationRecord
    CATEGORIES = ["Fiction","Non-Fiction"]
    validates :category, inclusion:{
        in: CATEGORIES,
        # message: `must be one of: #{CATEGORIES.join(',')}`
    }
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validate :title_must_be_clickbait_y

    REGEX_PATTERNS = [
        /Won't Believe/i,
        /Secret/i,
        /Top \d/i,
        /Guess/i
    ]


    def title_must_be_clickbait_y
        if REGEX_PATTERNS.none? { |clickbait| clickbait.match title }
            errors.add(:title, "must be clickbait-y")
        end
    end
end
