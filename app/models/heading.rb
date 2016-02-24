class Heading < ActiveRecord::Base
  belongs_to :headerable, polymorphic: true
end
