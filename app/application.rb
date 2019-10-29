class Application

def call(env)
  resp = Rack::Response.new
  req = Rack::Request.new(env)

  if req.path == "/items/"
    item_name = req.path.split("/items/").last
    Item.all.detect do |item|
      if item.name == item_name
        item.price
      else
        resp.write "We don't have that item"
        resp.status = 404
      end
    end
  else
    resp.write "Route not found"
    resp.status = 404
  end
end

end
