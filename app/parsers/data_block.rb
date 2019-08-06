class DataBlock
  # A DataBlock with a standard-header. The base for custom implementations.
  # Also provides features for easy definition of custom fields.
  attr_reader :header, :body, :offset

  HEADER_STRUCTURE = {
    head: 6,
    version: 2,
    length: 4,
  }

  BODY_STRUCTURE = {
    :unknown_data => ->(data_block, structure){
      data_block.read(data_block.header[:length].to_i - 12).bytes.map { |b| sprintf("%02X",b) }.join(" ")
    },
  }

  def initialize(data, offset=0)
    @stream = data
    @offset = offset
    @header = read_structure(self.class::HEADER_STRUCTURE)
    @body = read_structure(self.class::BODY_STRUCTURE)
  end

  def inspect
    "<#DataBlock HEAD:#{@header.inspect} BODY:#{@body.inspect} offset:#{@offset}>"
  end

  def read(length)
      @stream[@offset...(@offset+=length)]
  end

  private

  def read_structure(dict)
    structure = {}
    dict.map{|key, definition|
      structure[key] = if definition.respond_to? :call
        definition.call(self, structure)
      elsif definition.is_a? Integer
        read(definition)
      end
    }
    structure
  end
end
