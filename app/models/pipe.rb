class Pipe < ActiveRecord::Base
  has_many :flows
  has_many :transforms

  enum in_type: [ :pipe_in_xml, :pipe_in_unmod ]
  enum out_type: [ :pipe_out_json, :pipe_out_unmod ]

  def self.cron
    Pipe.all.each do |p|
      #flow = Plumber::Flow.new(@pipe.in_options)
      #pipe = Plumber::Pipe.new(flow, @pipe.in_type)
      #puts pipe.data
      #puts pipe.data_original
    end
  end
end

