require 'json'

class Session
  # find the cookie for this app
  # deserialize the cookie into a hash
  def initialize(req)
    json = req.cookies["_rails_lite_app"]
    @cookie = json ? JSON.parse(json) : {}
  end

  def [](key)
    @cookie[key]
  end

  def []=(key, val)
    @cookie[key] = val
  end

  # serialize the hash into json and save in a cookie
  # add to the responses cookies
  def store_session(res)
    value = {path: "/", value: JSON.generate(@cookie)}
    res.set_cookie("_rails_lite_app",value)
  end
end
