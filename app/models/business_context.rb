class BusinessContext < ActiveRecord::Base
  belongs_to :request
  has_many :custom_headings, as: :ch_context
  accepts_nested_attributes_for :custom_headings
end
