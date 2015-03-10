class Flow < ActiveRecord::Base
  belongs_to :pipe

  enum connector_type: [ :connector_url ]
end
