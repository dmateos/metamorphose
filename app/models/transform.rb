class Transform < ActiveRecord::Base
  belongs_to :pipe

  enum transform_type: [:transform_regexp_replace] 
end
