# Helper for printing things out to the console.

def log_init(app_log)
  ts = Time.now.strftime('%Y.%m.%d_%H.%M.%S')
  @log_file_name = File.join(File.expand_path(File.dirname(__FILE__)), '', "#{app_log}_#{ts}.log")
  @migration_log = File.new(@log_file_name, 'w')
end

def log(message)
  #output = "[#{Time.now.to_s}] #{message}"
  output = "#{message}"
  puts output
  @migration_log.puts(output)
  @migration_log.flush
end

def log_divider
  output = '=' * 102
  puts output
  @migration_log.puts(output)
end

def log_a_number(left_side_output, right_side_output, line_length = 80)
  output = ''
  output << left_side_output
  output << ' ' * (line_length - (left_side_output.length + right_side_output.length))
  output << right_side_output
  puts output
  @migration_log.puts(output)
end

=begin
def log_error(error_message)
  output = %Q|
#{'-' * 102}
ERROR:
#{error_message}
#{'-' * 102}
|
  puts output
  @error_log.puts(output)
  @error_count += 1
end
=end