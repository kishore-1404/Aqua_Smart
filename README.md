# Smart Aqua Project

## Project Overview
The Smart Aqua Project aims to develop an automated system for dispensing water in specified quantities using Verilog. The system accepts only Rs.5 and Rs.10 denominations and can dispense 5 or 10 liters of water at costs of Rs.15 and Rs.25 respectively.

## Features
- **Quantity Selection**: Users can choose between 5 liters or 10 liters.
- **Money Input**: Accepts Rs.5 and Rs.10 denominations.
- **Change Calculation**: Provides change in 5, 10, 15, and 20 Rs.
- **User-Friendly Display**: Uses a 7-segment display for easy reading of the change.

## State Machine
The system uses a state machine with the following states:
- **5 Liters**: 3 states.
- **10 Liters**: 5 states.

## Usage
1. Select the quantity of water.
2. Insert the respective amount of money.
3. Water and change will be dispensed accordingly.

## Files
- `Aquasmart.v`: Contains the Verilog code for the Smart Aqua system.
- `Aquasmart_tb.v`: Testbench for simulating and testing the Smart Aqua system.

## Author
Nariki Om Kishore
Entry No: 2022PH11863
