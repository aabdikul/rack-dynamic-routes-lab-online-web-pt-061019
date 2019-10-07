class Application
  @@items = []
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    #binding.pry
    if req.path.match(/items/) == nil
      resp.write "Route not found"
      resp.status = 404
    else
      item = @@items.find(|i| i.name == req.path.split("/items/").last)
      if item == nil
        resp.write "Item not found"
        resp.status = 400
      else
        resp.write item.price
      end
    end
    resp.finish
  end
end
