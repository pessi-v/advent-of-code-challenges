# This is a solver for the coding challenge at https://adventofcode.com/2016/day/1
# It takes input from a file, parses the steps and moves within a 'taxicab geometry'

bunny_directions = File.read('day1_input.txt').split(',').map(&:strip)

# Initialize coordinate variables, a compass and direction of the traveller
$x = 0
$y = 0
$compass = ['N', 'E', 'S', 'W']
$facing = 'N'

# Helper functions for using the compass
def turn_right
  $compass.push($compass.shift)
  $facing = $compass[0]
end

def turn_left
  $compass.prepend($compass.pop)
  $facing = $compass[0]
end

# Update coordinates after a step
def update_coordinates(distance)
  if $facing == 'N'
    $y += distance
  elsif $facing == 'E'
    $x += distance
  elsif $facing == 'S'
    $y -= distance
  elsif $facing == 'W'
    $x -= distance
  end
end

# Main function
def traveller(directions)
  directions.each do |step|
    step[0] == 'R' ? turn_right : turn_left
    distance = step[1..-1].to_i
    update_coordinates(distance)
  end

  easter_bunny_hq_distance = $x.abs + $y.abs
  puts "I found the Easter Bunny HQ #{easter_bunny_hq_distance} blocks away from where I started"

  return easter_bunny_hq_distance
end

# Run
traveller(bunny_directions)
