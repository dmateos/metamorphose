class Flow < ActiveRecord::Base
  belongs_to :pipe
  has_one :endpoint

  enum connector_type: [ :connector_url, :connector_endpoint ]
end
