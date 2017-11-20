class Application

  def call(env)

    resp = Rack::Response.new
    req = Rack::Response.new(env)

    if req.path.match(/items/)
      uitem = req.path.split("/items/").last

      if Item.items.keys.include?(uitem) == true
        resp.write Item.items[uitem]
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
