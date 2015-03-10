module Plumber
  class Plumber
    def initialize()
      @flows = []
      @pipes = []
    end

    def add_pipe(pipe)
      @pipes << pipe
    end

    def add_flow(flow)
      @flows << flow
    end

    def process
      flow = @flows[0]
      pipe = @pipes[0]
    end
  end
end
