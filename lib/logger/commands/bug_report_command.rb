class Commands::BugReportCommand < Command
  def initialize
    @url = 'http://test.jp/'
  end

  def execute(rows)
    rows.each do |log|
      uri = URI.parse(@url)
    end
  end
end