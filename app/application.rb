class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    #binding.pry
    if req.path.match(/items/) == nil
      resp.write "Route not found"
      resp.status = 404
    else

    end
    resp.finish
  end
end
