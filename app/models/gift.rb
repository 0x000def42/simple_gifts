require 'digest/md5'
class Gift < ApplicationRecord
  belongs_to :autor, class_name: 'User', foreign_key: :autor_id
  belongs_to :recepient, class_name: 'User', foreign_key: :recepient_id

  accepts_nested_attributes_for :recepient

  validates :name, :description, :content, :access_hash, :autor, :recepient, presence: true

  def set_access_hash!
    self.access_hash = Digest::MD5.hexdigest("#{autor.email}, #{recepient.email}")
  end

end