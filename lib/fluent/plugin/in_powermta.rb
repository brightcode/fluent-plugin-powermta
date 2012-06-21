require 'csv_parser'

class PowerMTAInput < Fluent::TailInput
  # Register plugin first. NAME is the name of this plugin
  # which is used in the configuration file.
  Fluent::Plugin.register_input('powermta', self)

  # Override 'configure_parser(conf)' method.
  def configure_parser(conf)
    header = conf['header'] || 'type,timeLogged,timeQueued,timeImprinted,orig,rcpt,orcpt,' + 
      'dsnAction,dsnStatus,dsnDiag,dsnMta,bounceCat,srcType,srcMta,dlvType,dlvSourceIp,' + 
      'dlvDestinationIp,dlvEsmtpAvailable,dlvSize,vmta,jobId,envId'
    @fields = PowerCSV.parse(header)
    # 2012-06-12 00:11:57-0500
    @time_index = @fields.index('timeLogged')
    @time_format = conf['time_format'] || '%Y-%M-%d %H:%M:%S'
  end

  # Override 'parse_line(line)' method that returns time and record.
  def parse_line(line)
    values = PowerCSV.parse(line)
    
    if values.length != @fields.length
      # parse error
    end
    
    time = values[@time_index]
    time = Time.strptime(time, @time_format).to_i
    # Time.local(value[0..3].to_i, value[5..6].to_i, value[8..9].to_i, 
    #  value[11..12].to_i, value[14..15].to_i, value[17..18].to_i).to_i

    record = {}
    @fields.each_with_index do |field, index|
      record[field] = values[index]
    end

    return time, record
  end
end

