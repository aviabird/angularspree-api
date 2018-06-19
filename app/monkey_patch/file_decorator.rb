File.class_eval do
  def self.open(*args)
    if args[0].is_a?(StringIO)
      begin
        string = args[0]
        tmp = Tempfile.new
        tmp.binmode
        tmp.write string.read
        tmp.rewind
        args[0] = tmp
        string.rewind
      rescue StandardError
      end
    end

    file = super(*args)
    file
  end
end
