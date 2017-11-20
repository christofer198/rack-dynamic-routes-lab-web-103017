class Application

  def call(env)

    resp = Rack::Response.new
    req = Rack::Response.new(env)

    if req.path.match(/items/)


      resp.write Item.items[path]

    else
      resp.write "404 route not found"
      resp.status = 404
    end
    resp.finish
  end

end
