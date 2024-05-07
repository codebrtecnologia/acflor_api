class LogsController < ApplicationController
  def show
    @number_lines = 120
    # logs = `tail -n #{@number_lines} #{Rails.root}/log/#{Rails.env}.log`
    logs = `tail -n #{@number_lines} log/production.log | tac | head -n #{@number_lines}`
    @log_content = logs
  end
end
