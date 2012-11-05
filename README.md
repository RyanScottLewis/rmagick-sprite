# RMagick-Sprite

## Example
In this example, I have one character printed on one spritesheet with only one line of 
evenly spaced/sized sprites.

```ruby
sprite = Sprite.new do
  filename 'foo/bar/character_spritesheet.png'
  
  # The default action that the Sprite will use
  # Default is :default
  default_action :standing
  
  # These options will be reverse-merged into each frame
  default_frame_options width: 16, height: 25, y: 24
  
  standing do
    frame x: 16 * 1 # Frame 1
    # x: 0, y: 0 is the top-left corner..
    # I'm lazy, so I'm just taking the default_frame_options width and multiplying it by the 
    # frame index to calculate the x coordinate.
  end
  
  walking do
    frame x: 16 * 0 # Frame 1
    frame x: 16 * 1 # Frame 2
    frame x: 16 * 2 # Frame 3
  end
  
  running do
    frame x: 16 * 3 # Frame 1
    frame x: 16 * 4 # Frame 2
    frame x: 16 * 5 # Frame 3
    frame x: 16 * 4 # Frame 4
  end
end

p sprite.next_image # => Second Image (Magick::Image) same as: sprite.next_frame.image
p sprite.next_image # => Second Image

sprite.action = :walking

p sprite.next_image # => First Image
p sprite.next_image # => Second Image
p sprite.next_image # => Third Image
p sprite.next_image # => Second Image
p sprite.next_image # => First Image

sprite.actions.each do |action_name, action|
  action.frames.each_with_index do |frame, index|
    frame.image.write "foo/bar/#{action_name}_#{index}.png"
  end
end
```
