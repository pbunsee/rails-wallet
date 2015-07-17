class User < ActiveRecord::Base

  has_attached_file :avatar, styles: {
                               medium: '300x300>',
                               thumb: '100x100>'},
                             default_url: '/images/:style/missing.png',
                             storage: :s3,
                             s3_credentials: Proc.new{|a| a.instance.s3_credentials }

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  def s3_credentials
    {bucket: 'jeremyraines.com',
     access_key_id: ENV['access_key_id'],
     secret_access_key: ENV['secret_access_key']}
  end



  validates_presence_of :fname, :lname, :email, :password

  validates_uniqueness_of :email

  validates_confirmation_of :password

  validates_format_of :phone, with: /\d{3}-\d{3}-\d{4}/

  validates_numericality_of :balance, { greater_than_or_equal_to: 0 }

  has_many :user_cards
  has_many :cards, through: :user_cards

  before_destroy :destroy_solely_owned_cards

  def destroy_solely_owned_cards
    all_my_cards = self.cards
    owned_cards = all_my_cards.select do |card|
                    card.users.length == 1
                  end
    owned_cards.each &:destroy!
  end


  def full_name
    fname + ' ' + lname
  end
end
