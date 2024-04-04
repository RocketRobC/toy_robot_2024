# ToyRobot2024

The Toy Robot exercise involves creating program that will simulate a robot moving around a board of given dimensions. There are several conditions to the and limitations as to where and when the robot can move and full requirements can be found here [toy_robot](./toy_robot.md).

## Usage

Movement commands for the robot can be provided as a file with each command placed on a new line. The commands should use uppercase letters and the robot will not acknowledge any movements untill a valid `PLACE` command is received.
```
PLACE 2,2,EAST
MOVE
RIGHT
LEFT
REPORT
```

To run the program call the `run` script and pass the path of the commands file as the first argument.
```bash
bin/run <path to file>
```

The final position of the robot will be printed to the terminal.

## Assumptions

### Invalid Commands

The requirements don't make mention of handling invalid commands however they do specify that any command that would cause the robot to fall off the board should be ignored. In this version, that idea has been extended to also ignore any invalid command passed to the robot. 

How could invalid commands be handled? 

A strict approach might be to halt the program if an invalid command is received and return an error to the user. This would force the user to correct the commands before attempting to move the robot again. 

Another might be to continue to ignore invalid commands and provide a warning comment or generate a log when an invalid command is received. This is a looser approach allowing the robot to continue regardless of the commands it's provided.

### Multiple Reports

The sample command sets in the requirements provide a list of commands where the last command is `REPORT`. In reality, it's possible to place a `REPORT` anywhere in the list of commands and the program will print the current position of the robot to the command line. For the purpose of testing the robot it's been assumed that the only position needed is the final position of the robot.

An enhancement might be to capture all the reported positions of the robot and output a list rather than just the final position. 
