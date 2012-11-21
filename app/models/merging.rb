class Merging < ActiveRecord::Base
  belongs_to :article
  belongs_to :merged, :class_name => 'Article'
end
