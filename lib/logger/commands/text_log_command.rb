class Commands::TextLogCommand < Command
  def initialize
    @file_path = "/tmp/#{Time.zone.now.year}_#{Time.zone.now.month}.log"
  end
  def execute(rows)
    f = File.new(@file_path, "w+")
    rows.each do | row |
      f.puts(row)
    end
    f.close
  end
end