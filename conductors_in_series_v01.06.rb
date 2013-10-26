# Simulation Banner
puts "\n\n"
puts "###############################################################################"
puts "#                                                                             #"
puts "# CONDUCTORS IN SERIES version 1.06                                           #"
puts "#_____________________________________________________________________________#"
puts "#                                                                             #"
puts "# Copyright 2011-13 by Mark Ciotola; available for use under GNU license      #"
puts "# Last revised on 25 October 2013                                             #" 
puts "# Website: http://www.heatsuite.com                                           #"
puts "# Source site: https://github.com/mciotola/carnot_refrigerator                #"
puts "#_____________________________________________________________________________#"
puts "#                                                                             #"
puts "# Description:                                                                #"
puts "# This simulation calculates the flow of heat energy across 2 thermal         #"
puts "# conductors that connects a warmer object to a cooler object.                #"
puts "#                                                                             #"
puts "###############################################################################"
puts "\n\n"

      ###############################################################################
      #                                                                             #
      # Developed with Ruby 1.9.2                                                   #
      # Takes the following parameters: temperature of reservoirs                   #
      #                                                                             #
      ###############################################################################


  puts "======================== Background ========================\n\n"
  
  puts " Conductors in series describes the flow of heat energy     "
  puts " through two conductors in parallel. "
  puts "\n"
  puts " dQ/dt = (k A ) (d T / d L) \n"  
  puts " k = thermal conductivity of material \n"  
  puts "\n\n"
  
  puts " This variation will involve two conductors in series as to \n" 
  puts " heat energy flow. \n" 
  puts "\n\n"
  
  
  # This is essentially combines Fourier's Laws of Conduction with Snell's Law.
  # The results can then be compared with experiment.
   
  # Unlike Snell's Law, the heat does not enter and exit at present angles.
  # However the heat does enter and leave at particular points.
  
  # The angle is a function of the ratio of conductivities of each material
  # the heat must travel through.
  
  # Ultimately want to compare heat flow for different "alternative" angle sets
  
# Include the Math library
  include Math  
  
  
# Initialize simulation parameters

  warmertemp = 50.0 # in C; decimal point added to tell Ruby to allow floating point calculations
  coolertemp = 30.0 # C
  material = 'copper' #'iron'
  material1 = 'copper' #'iron'
  material2 = 'iron' #'copper'
  thermalconductivity = 80.0 # for iron
  thermalconductivity1 = 400.0 # for copper
  thermalconductivity2 = 80.0 # for iron
  area = 1.0
  length = 1.0

# Display the parameters 

  puts "======================== Parameters ========================\n\n"

  puts sprintf "  Warmer temp (in C): \t\t %7.3f " , warmertemp.to_s
  puts sprintf "  Cooler temp (in C): \t\t %7.3f " , coolertemp.to_s
  puts sprintf "  Thermal conductivity1: \t %7.3f " , thermalconductivity1.to_s
  puts sprintf "  Thermal conductivity2: \t %7.3f " , thermalconductivity2.to_s
  puts sprintf "  Area (in m^2): \t\t %7.3f " , area.to_s
  puts sprintf "  Length (in m): \t\t %7.3f " , length.to_s
  puts sprintf "  Material: \t\t\t %7s " , material
  puts "\n\n"  

# Run the simulation 

  if material == 'iron'
	thermalconductivity = 80.0
  elsif material == 'copper'
    thermalconductivity = 400.0
  elsif material == 'wood'
    thermalconductivity = 0.08
  end
  
  if material1 == 'iron'
	thermalconductivity1 = 80.0
  elsif material1 == 'copper'
    thermalconductivity1 = 400.0
  elsif material1 == 'wood'
    thermalconductivity1 = 0.08
  end
  
  if material2 == 'iron'
	thermalconductivity2 = 80.0
  elsif material2 == 'copper'
    thermalconductivity2 = 400.0
  elsif material2 == 'wood'
    thermalconductivity2 = 0.08
  end

  tempdiff = warmertemp - coolertemp
  
  # Calculate angles
  
  # Do we need to use arcsin?
  
  # Guess: sin(angle1)/sin(angle2) = thermalconductivity1 / thermalconductivity2
  
  # Snell's Law: n1 sin(theta1) = n2 sine(theta2) 
  
  # theta1 = arcsin ( n2 sine(theta2) / n1)  # Yet we don't know angle 2!
  
  # theta1 = arcsin ( (n2 / n1)  sine(theta2) )  # Yet we don't know angle 2!
  
  # Yet we do know beginning and end points.
  
  # So we know the opposite side. Beginning point to incident line (Sine = opposite / hypotenuse)
  # Or do we? No. Incident point can change.
  # We do know the sum of (opposite side of triangle 1) + (opposite side of triangle 2); it is simply horz length of medium 
  # So opposite 1 = (horz length - opposite 2)
  
  # n1 ( (horz length - opposite 2) /hypotenuse1) = n2 (opposite2/hypotenuse2) 

  # We know adjacent. It is simply the vertical thickness of the medium. (Assume conductors are planes)
  
  # So use Pythagorean theorem to find hypotenuse.
  
  # C^2 = A^2 + B^2  # A = opposite, B = adjacent
  
  # C^2 = (opposite)^2 + (adjacent)^2
  
  # C1^2 = (opposite1)^2 + (adjacent1)^2
  
  # C1^2 = ((horz length - opposite 2))^2 + (adjacent1)^2
	
	
  # NOTE: ratio of hypetenuses should be same as ratio of conductivities on order to satisfy principle of least time.
  # If so: hypotenuse1/hypotenuse2 = thermalconductivity1 / thermalconductivity2
  # So if we know one hypotenuse, we should know the other.
  # Can express H in terms of fixed adjacent side and semi-limited opposite.
		
  
  #materialangle1 = (thermalconductivity1 / (thermalconductivity1 + thermalconductivity2) )  # Guess formula; angle?
  #materialangle2 = (thermalconductivity2 / (thermalconductivity1 + thermalconductivity2) )  # Guess formula
  
  theta1 = Math.asin(1)
  
  heatenergyflow = ( (area * thermalconductivity) / length) * tempdiff  # Need to change?


# Display the output 

  puts "========================== Output ==========================\n\n"
  puts sprintf "  Thermal Conductivity of %s %s %4.3f", material, "is", thermalconductivity	
  puts sprintf "  Thermal Conductivity of %s %s %4.3f", material1, "is", thermalconductivity1	
  puts sprintf "  Thermal Conductivity of %s %s %4.3f", material2, "is", thermalconductivity2	
  puts sprintf "  Temp diff (in degrees C): \t %10.3f " , tempdiff.to_s	
  puts sprintf "  Heat energy flow (in J/s): \t %10.3f " , heatenergyflow.to_s  # Change?
  
  # To figure out heat flow, need multiple paths at same time and then to assign an area to each path.
  # Also assign a percent of heat flow to each path.
  # 3 paths might work well enough: diagonal, HW, WH
  # How to assign areas?
  # Or start out with just one path. Assign at an area of 1^2.
  


  puts "\n\n"

  puts "========================= Units Key =========================\n\n"
  puts "  Abbreviation \t\t\t Unit"
  puts "  C \t\t\t\t degrees Celsius, a unit of temperature"
  puts "  J \t\t\t\t Joules, a unit of energy"
  puts "  m \t\t\t\t meters, a unit of length"
  puts " \n\n"

  puts "========================= Reference =========================\n\n"
  puts "Daniel V. Schroeder, 2000, \"An Introduction to Thermal Physics.\""
  puts "Wolfram, \"http://scienceworld.wolfram.com/physics/SnellsLaw.html\""
  
  puts "\n\n"
  



# Table of thermal conductivities (watts/meter/kelvin)
# Material	Thermal Conductivity
# air				  0.026
# wood				  0.08
# water				  0.6
# iron				 80
# copper			400


########################### UNUSED CODE THAT MIGHT BE NEEDED LATER ###############################

#      engine.efficiency = exp( - 6 * ((bubble.period - 1)/periods.to_f ) )



# Try some more:

# For a really long, thin conductor, hypotenuse is about equal to opposite side, so sine is about 1.
# Then as W -> 0, L1/L2 = k1/k2
# L1 ~= L * (k1/ (k1+k2))
# L2 ~= L * (k2/ (k1+k2))

# Then increase by size of W versus L?

# For now, have higher k material at "top"



# Time = H1/k1 + H2/k2

# Need to solve a system of 2 simultaneous equations?


# Note that point where L1 ends, L2 begins.


# Assume H1 ~= L1 = L * (k1/ (k1+k2))

# Assume H2 ~= W

# So, Time ~= L1/k1 + W/k2 = ((L * (k1/ (k1+k2)) )/k1) + W/k2
#          ~=  (L / (k1+k2)) + W/k2


# BETTER APPROACH:
# Do loop to find possibility with ratio of angles for least time.
# Start at 5 degrees, go to 90 degrees. Select fastest.




