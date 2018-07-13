class Format
  attr_reader :correct, :incorrect

  CORRECT_FORMATS = { "year" => "%Y-", "month" => "%m-", "day" => "%d",
                      "hour" => "%Hh ", "minute" => "%Mm ", "second" => "%Ss" }.freeze

  def initialize(params)
    @correct = ''
    @incorrect = []
    time_response(params['format'].split(','))
  end

  private

  def time_response(params)
    params.each do |format|
      if CORRECT_FORMATS[format]
        @correct += CORRECT_FORMATS[format]
      else
        @incorrect << format
      end
    end
  end
end
