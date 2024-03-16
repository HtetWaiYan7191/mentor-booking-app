class SocialLink < ApplicationRecord
  belongs_to :user

  validates :icon,  presence: true
  validates :link, presence: true,  format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]), message: "must be a valid URL" }
end
