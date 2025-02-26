/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_DigitalLogicLab2 (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  // All output pins must be assigned. If not used, assign to 0.
  if (ui_in[7] == 1) assign uo_out = 8'b11110000;
  else if (ui_in[6] == 1) assign uo_out = 8'b11100000;
  else if (ui_in[5] == 1) assign uo_out = 8'b11010000;
  else if (ui_in[4] == 1) assign uo_out = 8'b11000000;
  else if (ui_in[3] == 1) assign uo_out = 8'b10110000;
  else if (ui_in[2] == 1) assign uo_out = 8'b10100000;
  else if (ui_in[1] == 1) assign uo_out = 8'b10010000;
  else if (ui_in[0] == 1) assign uo_out = 8'b10000000;
  else if (uio_in[7] == 1) assign uo_out = 8'b01110000;
  else if (uio_in[6] == 1) assign uo_out = 8'b01100000;
  else if (uio_in[5] == 1) assign uo_out = 8'b01010000;
  else if (uio_in[4] == 1) assign uo_out = 8'b01000000;
  else if (uio_in[3] == 1) assign uo_out = 8'b00110000;
  else if (uio_in[2] == 1) assign uo_out = 8'b00100000;
  else if (uio_in[1] == 1) assign uo_out = 8'b00010000;
  else if (uio_in[0] == 1) assign uo_out = 8'b00000000; 
  else                     assign uo_out = 8'b11110000;
  
  // assign uo_out  = ui_in + uio_in;  // Example: ou_out is the sum of ui_in and uio_in
  assign uio_out = 0;
  assign uio_oe  = 0;

  // List all unused inputs to prevent warnings
  wire _unused = &{ena, clk, rst_n, 1'b0};

endmodule
