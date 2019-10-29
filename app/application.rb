class Application

def call(env)
  resp = Rack::Response.new
  req = Rack::Request.new

  if req.path == "/items/<ITEM NAME>"
    Item.all.detect do |item|
      if item.name == <ITEM NAME>
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
