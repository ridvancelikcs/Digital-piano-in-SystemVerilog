# Digital-piano-in-SystemVerilog
This project is compatible for BASYS3 and Beti Board. It has 4 modules (incuding top module). 
It was written in Vivado 2015.4 in SystemVerilog. device: xc7a35tcpg236-1 

Description

In this project, we simply took to pieces our code in four module.

Keyboard Module

  a) Keyboard Module takes inputs from beti board keyboard and sends to top module.

  b) This module has 20 bit local counter in order to divide clock.

  c) It sends one hot signals to JBO ports with approximately 95 Hz frequency. When any
  input detect on JBI ports, it stops to row research upon 4x4 keyboard matrix. Until
  JBI equals zero, it actives a 4 bits element of the matrix (hex). We have 16 elements
  in the matrix. These are 4 bits hexadecimal numbers (from 0 to F).

Display Module

  a) This module takes input from top module and displays current notes letter on seven
  segment display.
  
  b) Display Controller module uses clock in order to show multiple digits. However in
  this project, we need only one digit to show name of notes. We didn’t change
  structure but inactivated 3 enables. Because in the future there would be possibility
  that we need other digits.
  
  c) When the input is entered from Keyboard, Display Module gets this value and show
  the representation of note name (from A to G). if no inputs are entered, it show noting
  (turned off).

Speaker Module
  
  a) This module takes inputs from top module, generates notes frequencies and sends
  them to amplifier circuit
  
  b) Speaker module gets clock input from top module, then uses it some functions.
  
  c) This module gets clock and hexadecimal value as inputs then generates specific
  electric signals according to hex values. In Speaker Module, notes have been defined
  according to their wave length (108 / notes frequency). Notes are starts from A3 (220
  Hz) to B5 (988 Hz). By the way, sharps and flats are not defined.

Top Module
  
  a) This module uses clock signals and controls other modules.
  
  b) Top module actives Basys3 clock which is 100 MHz
  
  c) Module has some local variables. Also it is hierarchically on the top of other
  modules. So there is no specific function for this module.
