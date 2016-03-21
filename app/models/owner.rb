class Owner < ActiveRecord::Base
	has_many :ownerships
  #has_many :ownerables, through: :ownerships, source: :ownerable, source_type: 'Request'
  has_many :requests, through: :ownerships, source: :ownerable, source_type: 'Request'
  has_many :business_contexts, through: :ownerships, source: :ownerable, source_type: 'BusinessContext'
end
