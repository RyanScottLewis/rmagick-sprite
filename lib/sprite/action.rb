class Sprite
  
  class Action
    class DSL < ::DSL
      def frame(options)
        @parent.add_frame(options)
      end
    end
    
    attr_reader :sprite, :frames
    attr_accessor :current_index
    
    def initialize(options, &blk)
      raise 'options must be a Hash' unless options.respond_to?(:to_hash) || options.respond_to?(:to_h)
      options = options.to_hash rescue options.to_h
      
      raise 'options[:sprite] must be given' if options[:sprite].nil?
      raise 'options[:sprite] must be a Sprite' unless options[:sprite].instance_of?(Sprite)
      
      @sprite = options[:sprite]
      @current_index, @frames = 0, []
      
      DSL.call(self, &blk)
    end
    
    def add_frame(options)
      raise 'options must be a Hash' unless options.respond_to?(:to_hash) || options.respond_to?(:to_h)
      options = options.to_hash rescue options.to_h
      options = { action: self }.merge(@sprite.default_frame_options).merge(options)
      @frames << Frame.new(options)
    end
        
    def current_frame
      @frames[@current_index]
    end
    
    def current_image
      current_frame.image
    end
    
    def increase_index
      @current_index += 1
      @current_index = 0 if @current_index >= @frames.length
    end
    
    def next_frame
      increase_index
      current_frame
    end
    
    def next_image
      increase_index
      current_image
    end
    
    def write(filename, &blk)
     image_list = Magick::ImageList.new
     @frames.each do |frame|
       image = frame.image
       image_list << image
     end
     
     blk.call(image_list) if block_given?
     
     image_list.write(filename)
    end
  end
  
end
