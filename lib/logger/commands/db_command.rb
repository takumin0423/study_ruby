class Commands::DBCommand < Command
  def execute(rows)
    return if rows.length == 0
    # バルクインサート
    query = "INSERT INTO logs(description, account_id, operation_id, created_at, updated_at) values #{rows.join(',')}"
    ActiveRecord::Base.connection.execute(query)
  end
end