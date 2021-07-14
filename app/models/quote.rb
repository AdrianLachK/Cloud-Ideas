class Quote < ApplicationRecord
  before_validation :set_score, on: :create

  validates :label, presence: true

  private

  def set_score
    self.score = (Quote.maximum(:score)|| 0) + 1
  end
end
