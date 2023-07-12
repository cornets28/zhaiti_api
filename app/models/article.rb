class Article < ApplicationRecord
    # validates :title, presence: true, length: { minimum: 3}
    # validates :body, presence: true, length: { minimum: 15}
    belongs_to :author
    belongs_to :channel
end
