class Identity < ActiveRecord::Base
  validates_presence_of :user,
                        :provider,
                        :uid
  belongs_to :user, class_name: 'Spree::User'

  def google?
    provider == 'google'
  end

  def facebook?
    provider == 'facebook'
  end
end
