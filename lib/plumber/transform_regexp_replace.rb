module Plumber
  class TransformRegexpReplace
    def transform!(flow, parameters)
      s1, s2 = parameters.split("/")
      flow.data = flow.data.gsub(s1, s2)
    end
  end
end
