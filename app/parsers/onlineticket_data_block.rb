class OnlineticketDataBlock < DataBlock
  # The DataBlock of the overall Ticket with sub-blocks in Body

  HEADER_STRUCTURE = {
    :header => 3,
    :version => 2,
    :carrier => 4,
    :key_id => 5,
    :signature => ->(data_block, structure){ data_block.read(50).bytes.map { |b| sprintf("%02X",b) }.join(" ") },
    # :signature => ->(data_block){ RASN1.parse(data_block.read(50), ber: true) },
  }
  BODY_STRUCTURE = {
    :data_length => 4,
    :ticket => ->(data_block, read_body){ data_block.read_ticket_blocks(Zlib::Inflate.inflate(data_block.read(read_body[:data_length].to_i))) },
  }
  BLOCK_TYPES = {
  }

  def read_ticket_blocks(ticket_data)
    offset = 0
    ticket_blocks = []
    while offset < ticket_data.length
      block_type = ticket_data[offset...(offset+6)]
      block = DataBlock.new(ticket_data,offset)
      offset = block.offset
      ticket_blocks << block
    end
    return ticket_blocks
  end


end
