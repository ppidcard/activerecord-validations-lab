class Post < ActiveRecord::Base
    validates :title, presence: true
    validates(:content, { :length => { :minimum => 250 } })
    validates(:summary, { :length => { :maximum => 250 } })
    validates :category, inclusion: {in:["Fiction", "Non-Fiction"]}
    validate :clickbait

    def clickbait
    arr = ["Won't Believe", "Top[number]", "Secret", "Guess"]
        if title && arr.none? {|f| title.include?(f)}
            errors.add(:title, "is not clickbait")
        end
    end
end
