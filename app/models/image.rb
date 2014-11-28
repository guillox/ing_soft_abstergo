class Image < ActiveRecord::Base
  belongs_to :auction

  dragonfly_accessor :image  #defines a reader/writer for image
end
