class Shorter < ApplicationRecord

  before_save :create_shorted_url
  before_save :initialize_redirect_counter

  validates_presence_of :original_url

  validates_uniqueness_of :original_url

  def create_shorted_url
    self.shorted_url = "#{SecureRandom.hex(3)}.com" if self.shorted_url.blank?
  end

  def initialize_redirect_counter
    self.redirect_counter ||= 0
  end

  def expired?
    DateTime.now > expire_time
  end
end
