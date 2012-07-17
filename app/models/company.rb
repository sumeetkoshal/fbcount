class Company < ActiveRecord::Base
  require 'open-uri'
  validates_uniqueness_of :name, :facebookid
  validates_presence_of :name, :url, :facebookid, :description, :likecount
  validates_length_of   :name, :maximum=> 25
  validates_length_of   :url, :maximum => 255
  validates_length_of   :facebookid, :maximum => 100
  validates_length_of   :description, :maximum => 255
  validates_numericality_of :likecount

  before_save :check_facebook_account_validity
  before_update :check_facebook_account_validity

  after_create :increment_like_count

  def check_facebook_account_validity
      begin
        open("http://graph.facebook.com/#{self.facebookid}")
        true
      rescue
        errors.add(:base, 'invalid facebook account')
        false
      end
  end

  def add_like_count()
    self.update_attribute(:likecount, self.likecount+1)
  end
  def increment_like_count
    self.delay.add_like_count
  end
end
