class Application

  def call(env)

    resp = Rack::Response.new
    req = Rack::Response.new(env)

    if req.path.match(/items/)
      path = req.path.split("/items/").last

      if Item.items.keys.include?(path) == true
        resp.write Item.items[path]
      else
        resp.write "Item not found"
        resp.status = 400
      end

    else
      resp.write "404 route not found"
      resp.status = 404
    end
    resp.finish
  end

end
