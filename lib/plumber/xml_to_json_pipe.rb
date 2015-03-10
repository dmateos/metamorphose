require 'json'
require "rexml/document"

module Plumber
  class XmlToJsonPipe
    def translate!(flow)
      flow.data = JSON.pretty_generate(Hash.from_xml(flow.data))
    end
  end 
end
