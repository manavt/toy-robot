# Toy Robot Simulator

The application is a simulation of a toy robot moving on a square table-top, of dimensions 5 units x 5 units.
There are no other obstructions on the table surface.
The robot is free to roam around the surface of the table, but must be prevented from falling to destruction. Any movement that would result in the robot falling from the table must be prevented, however further valid movement commands must still be allowed.

Instructions

Create an application that can read in commands of the following form -
PLACE X,Y,F
MOVE
LEFT
RIGHT
REPORT

PLACE will put the toy robot on the table in position (X, Y) and facing NORTH, SOUTH, EAST or WEST.

The origin (0,0) should be considered to be the SOUTH WEST most corner.

The first valid command to the robot is a PLACE command, after that, any sequence of commands may be issued, in any order, including another PLACE command. The application should discard all commands in the sequence until a valid PLACE command has been executed.

MOVE will move the toy robot one unit forward in the direction it is currently facing.

LEFT and RIGHT will rotate the robot 90 degrees in the specified direction without changing the position of the robot.

REPORT will announce the X, Y and F of the robot. This can be in any form, but standard output is sufficient.

A robot that is not on the table can choose the ignore the MOVE, LEFT, RIGHT and REPORT
commands.

Input can be from a file, or from standard input, as the developer chooses.

Provide test data to exercise the application.

Constraints
The toy robot must not fall off the table during movement. This also includes the initial placement of the toy robot. Any move that would cause the robot to fall must be ignored.


## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.


### Installing

A step by step series of examples that tell you have to get a development env running

1. Clone / Download the code.
2. You may change gemset in .ruby-gemset if you want.
3. Code is tested in ruby version 2.4.2. It may work in other versions as well. You can change, ruby version in .ruby-version file.
4. Open terminal and cd in root directory.
5. It will create gemset and will ask to install rvm version, if already not installed.
6. Install bundler and gems:

```
gem install bundler
bundle install
```

## Running the tests

Please run command:

```
rspec spec/bot_test.rb
```

