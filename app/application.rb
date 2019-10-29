class Application

@@items = [Item.new("Banana", 0.25), Item.new("Mango", 1)]

def call(env)
  resp = Rack::Response.new
  req = Rack::Request.new(env)

  if req.path.match(/items/)
    item_name = req.path.split("/items/").last
    @@items.detect do |item|
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
