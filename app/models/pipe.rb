class Pipe < ActiveRecord::Base
  enum in: [ :in_url ]
  enum in_type: [ :in_xml, :in_json, :in_csv ]

  enum out: [ :out_url ]
  enum out_type: [ :out_json, :out_unmod ]

  def self.cron
    Pipe.all.each do |p|
      #flow = Plumber::Flow.new(@pipe.in_options)
      #pipe = Plumber::Pipe.new(flow, @pipe.in_type)
      #puts pipe.data
      #puts pipe.data_original
    end
  end
end

