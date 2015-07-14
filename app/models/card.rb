class Card < ActiveRecord::Base

  validates_format_of :number, with: /\A[345]\d{11,}\Z/

  validates :expiration_month, inclusion: {in: (1..12)}
  validates :expiration_year, inclusion: {in: (2015..2115)}

  before_save :set_card_type, :set_expiration_date

  def set_expiration_date
    self.expiration_date = DateTime.new(self.expiration_year,
                                        self.expiration_month,
                                        28)
  end

  validates :users, presence: true

  scope :expired, lambda { where('expiration_date < ?', Time.now) }


  def set_card_type
    first_num = self.number[0]
    self.card_type = case first_num
    when '3'
      'American Express'
    when '4'
      'Visa'
    when '5'
      'MasterCard'
    end
  end


  has_many :user_cards
  has_many :users, through: :user_cards
end
