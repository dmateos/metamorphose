module Plumber
  class DummyPipe
    def translate!(flow)
      flow.data
    end
  end
end
