class ClickbaitValidator < ActiveModel::Validator
    def validate(record)
      unless record.title =~ /(Won't Believe|Secret|Top \d+|Guess)/
        record.errors[:title] << "must be sufficiently clickbait-y"
      end
    end
  end


class Post < ApplicationRecord
    validates :title, presence: true, clickbait: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    # validates_with ClickbaitValidator

    # def validate(record)
    #     unless record.title =~ /(Won't Believe|Secret|Top \d+|Guess)/
    #       record.errors[:title] << "must be sufficiently clickbait-y"
    #     end
    #   end
end
