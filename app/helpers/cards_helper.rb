module CardsHelper
  def user_names(card)
    names = card.users.map do |user|
      user.full_name
    end

    names.join(', ')
  end
end
