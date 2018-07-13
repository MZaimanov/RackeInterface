require_relative 'format'

class App
  def call(env)
    @request = Rack::Request.new(env)
    if @request.path_info == '/time'
      time_format = Format.new(@request.params)
      if time_format.unknown.empty?
        answer(200, Time.now.strftime(time_format.correct))
      else
        answer(400, "Unknown time format #{time_format.incorrect}")
      end
    else
      answer(404, "Page not found or Incorrect request")
    end
  end

  private

  def answer(status, body)
    [ status, { 'Content-Type' => 'text/plain' }, [body]]
  end
end
