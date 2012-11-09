# RMagick-Sprite

## Description

`rmagick-sprite` allows you to easily slice up a spritesheet into `Magick::Image` instances. 

The thought is that a spreadsheet contains many of a character's actions (standing, walking, jumping, etc..) which 
consist of many frames.

This gem provides a DSL for defining those actions and the size/location of each frame on the spritesheet.

Then, you are free to use these images in your favorite game library, save each frame as separate images, or 
even save each action as an animated GIF.

## Install

### Bundler: `gem 'rmagick-sprite'`

### RubyGems: `gem install rmagick-sprite`

## Example

### Example Spritesheet
<hr/ >

In this example, I have one character printed on one spritesheet with only one line of 
evenly spaced/sized sprites.

Here it is: ![Example Spritesheet](http://f.cl.ly/items/1h1T292v2F3N2f1D3c1b/0.png)

### Declaration
<hr/ >

```ruby
require 'rmagick-sprite'

sprite = Sprite.new do
  filename 'foo/bar/character_spritesheet.png'
  
  # The default action that the Sprite will use
  default_action :standing
  
  # These options will be reverse-merged into each frame
  default_frame_options width: 16, height: 25, y: 0
  
  standing do
    frame x: 16 * 1 # Frame 1
    # x: 0, y: 0 is the top-left corner..
    # I'm lazy, so I'm just taking the default_frame_options width and multiplying it by the 
    # frame's offset to calculate the x coordinate.
  end
  
  walking do
    frame x: 16 * 0 # Frame 1
    frame x: 16 * 1 # Frame 2
    frame x: 16 * 2 # Frame 3
    frame x: 16 * 1 # Frame 4
  end
  
  running do
    frame x: 16 * 3 # Frame 1
    frame x: 16 * 4 # Frame 2
    frame x: 16 * 5 # Frame 3
    frame x: 16 * 4 # Frame 4
  end
end
```

### Enumeration
<hr/ >

```ruby
# The :standing action only has one frame, so next_image will loop over the same frame on each call
p sprite.next_image # => Second Image (Magick::Image) - Note that this is the same as: sprite.next_frame.image
p sprite.next_image # => Second Image

sprite.action = :walking

# Here, we loop through the :walking animation.. pump these images right into Gosu or your favorite gaming library
p sprite.next_image # => Image 3 - Frame 1
p sprite.next_image # => Image 4 - Frame 2
p sprite.next_image # => Image 5 - Frame 3
p sprite.next_image # => Image 4 - Frame 4
p sprite.next_image # => Image 3 - Frame 1
```

### Saving Frames and Actions
<hr/ >

#### Save each action's frame as a separate image

```ruby
sprite.actions.each do |action_name, action|
  action.frames.each_with_index do |frame, index|
    frame.image.write "foo/bar/#{action_name}_#{index}.png"
  end
end
```

#### Saving an action as a gif 

> Note: This looks a bit wonky with transparent backgrounds.

```ruby
sprite.actions[:running].write 'foo/bar/running.gif'
```
