class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :clickbait_title


    def clickbait_title
        if self.title && !self.title.match?(/Won't Believe|Secret|Top [0-9]|Guess/i)
           errors.add(:title, "Title is not clickbait-y")
        end
    end

end
