class Ticket < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :status, presence: true, uniqueness: true
  has_rich_text :content
end
