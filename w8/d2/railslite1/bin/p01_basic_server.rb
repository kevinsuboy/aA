require 'rack'

class MyController
    def initialize(req,res)
        @req = req
        @res = res
    end
    def execute
        res.write(req.path)
        nil
    end
    private
    attr_reader :req, :res
end

app = Proc.new do |env|
    req = Rack::Request.new(env)
    res = Rack::Response.new
    # res['Content-Type'] = 'text/html'
    # res.write("Hello world!")
    MyController.new(req,res).execute
    res.finish
end

Rack::Server.start(
    app: app,
    Port: 3000
)
