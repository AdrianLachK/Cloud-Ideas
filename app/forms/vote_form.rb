class VoteForm < Patterns::Form
  param_key 'vote'

  attribute :preferred_quote_id
  attribute :other_quote_id

  def preferred_vote_label
    "#{preferred_quote.label} (score: #{preferred_quote.score})"
  end

  private

  def persist
    return true if preferred_quote.score > other_quote.score

    preferred_quote.score, other_quote.score = other_quote.score, preferred_quote.score

    preferred_quote.save!
    other_quote.save!
  end

  def preferred_quote
   @preferred_quote ||= Quote.find(preferred_quote_id)
  end

  def other_quote
    @other_quote ||=Quote.find(other_quote_id)
  end

end