# Simulation Banner
puts "\n\n"
puts "###############################################################################"
puts "#                                                                             #"
puts "# CONDUCTORS IN SERIES version 1.09                                           #"
puts "#_____________________________________________________________________________#"
puts "#                                                                             #"
puts "# Copyright 2011-14 by Mark Ciotola; available for use under GNU license      #"
puts "# Last revised on 17 May 2014                                                 #" 
puts "# Website: http://www.heatsuite.com/                                          #"
puts "# Source site: https://github.com/mciotola/conductors_in_series               #"
puts "#_____________________________________________________________________________#"
puts "#                                                                             #"
puts "# Description:                                                                #"
puts "# This simulation calculates the angles of the path of maximum heat flow      #"
puts "# through a series of two conductors that bridge a thermal difference.        #"
puts "#                                                                             #"
puts "###############################################################################"
puts "\n\n"

      ###############################################################################
      #                                                                             #
      # Developed with Ruby 1.9.2                                                   #
      # Takes the following parameters: temperature of reservoirs                   #
      #                                                                             #
      ###############################################################################

puts "================================== Background =================================\n\n"
  
puts " Heat flows through two rectangular conductors in series, arranged parallel"
puts " lengthwise, into the outer left corner of conductor 1 out of the extreme "
puts " opposite corner of conductor 2.  Heat flow is refracted across the boundary"
puts " between the two conductors."
puts " \n"
  
puts " This is essentially combines Fourier's Laws of Conduction with Snell's Law."
puts " The results can then be compared with experiment.  Unlike Snell's Law, the "
puts " heat does not enter at a pre-determined angles.  However the heat does enter"
puts " and leave at particular points.  The angles are a function of the ratio of"
puts " conductivities of each material, and the dimensions of the conductors."
puts " \n"
puts " This simulation uses the Tangent Law disclosed by Tan and Holland (1990)."

puts " \n\n"
      

# Include the Math library
  include Math  
  
  
# Initialize simulation parameters

  material1 = 'copper' # choices: 'copper' 'iron' 'aluminum' 'brass'
  material2 = 'iron'   # choices: 'copper' 'iron' 'aluminum' 'brass'
  length = 0.0500      # in m; decimal point added to tell Ruby to allow floating point calculations
  height = 0.0133       # in m
  width = height       # in m

# Display the parameters. 

puts "================================== Parameters =================================\n\n"

  puts sprintf "  Conductor Length (in m): \t\t %7.3f " , length.to_s
  puts sprintf "  Conductor Height (in m): \t\t %7.3f " , height.to_s
  puts sprintf "  \n"  
  puts sprintf "  Conductor Material 1: \t\t %4s " , material1
  puts sprintf "  Conductor Material 2: \t\t %4s " , material2
  puts sprintf "  \n"  
  
# Look-up the thermal conductivities. 
  
  if material1 == 'iron'
	thermalconductivity1 = 80.0
  elsif material1 == 'copper'
    thermalconductivity1 = 398.0
  elsif material1 == 'aluminum'
    thermalconductivity1 = 237.0
  elsif material1 == 'brass'
    thermalconductivity1 = 109.0
  end
  
  if material2 == 'iron'
	thermalconductivity2 = 80.0
  elsif material2 == 'copper'
    thermalconductivity2 = 398.0
  elsif material2 == 'aluminum'
    thermalconductivity2 = 237.0
  elsif material2 == 'brass'
    thermalconductivity2 = 109.0
  end

# Display the thermal conductivities.
  
  puts sprintf "  Thermal Conductivity of %s %s \t %5.1f", material1, "is", thermalconductivity1	
  puts sprintf "  Thermal Conductivity of %s %s \t %5.1f", material2, "is", thermalconductivity2	
  puts "\n" 
  puts sprintf "  Note: Conductor Width = Conductor Height \n\n\n" 

# Run the simulation. 

  rho1 = 1.0/thermalconductivity1  # rho1 is the thermal resistance of conductor 1.  
  rho2 = 1.0/thermalconductivity2  # rho2 is the thermal resistance of conductor 2.

  x  = length / ((rho1/rho2) + 1.0)   # height h cancels out)
  
  theta1 = atan(x/height)
  theta2 = atan((length - x)/height)
  
# Convert angles and display the output. 

puts "==================================== Output ===================================\n\n"

puts "RESULTS USING TANGENT LAW \n\n"

angle1 = (360.0/(2 * PI)) * theta1
angle2 = (360.0/(2 * PI)) * theta2
  
puts sprintf "  x (in meters): %10.4f (where path of maximum heat flow crosses boundary)" , x.to_s	
puts "\n\n"
    
puts sprintf "  Angle 1 (in radians): \t %10.2f " , theta1.to_s
puts sprintf "  Angle 2 (in radians): \t %10.2f " , theta2.to_s
puts "\n\n"

puts sprintf "  Angle 1 (in degrees): \t %10.1f " , angle1.to_s
puts sprintf "  Angle 2 (in degrees): \t %10.1f " , angle2.to_s
puts "\n\n"

puts "================================== Units Key ==================================\n\n"

puts " Abbreviation \t\t\t Unit"
puts " K \t\t\t\t Kelvin, a unit of temperature"
puts " m \t\t\t\t meters, a unit of length"
puts " W \t\t\t\t Watts, a unit of power"

puts " \n\n"
  
puts "================================= References ==================================\n\n"

puts " Daniel V. Schroeder, \"An Introduction to Thermal Physics.\" (2000)."
puts " A Tan and L. R. Holland, \"Tangent Law of Refraction for Heat Conduction "
puts " Through an Interface and Underlying Variational Principle\", Am. J. Phys.,"
puts " 58, 988-991 (1990)."
puts " Wolfram, \"http://scienceworld.wolfram.com/physics/SnellsLaw.html\""
puts "\n\n"
  

# Table of thermal conductivities (watts/meter/kelvin)
# Material	Thermal Conductivity
# air				      0.026
# wood				      0.08
# water				      0.6
# iron (1)				 80.3
# copper (1)			398
# aluminum (2)			205.0
# brass (2)				109.0

# Source 1: NIST
# Source 2: http://hyperphysics.phy-astr.gsu.edu/hbase/tables/thrcn.html

