class Snapshot < ActiveRecord::Base
  has_many :releases
end
