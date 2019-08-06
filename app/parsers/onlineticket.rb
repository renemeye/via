class Onlineticket
  def parse(ticket_content)
    ticket_content = fix_zxing(ticket_content)
    puts OnlineticketDataBlock.new(ticket_content).header.inspect
    puts OnlineticketDataBlock.new(ticket_content).body.inspect
  end

  def fix_zxing(data)
    data.encode('ISO-8859-1')
  end
end
