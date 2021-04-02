module Bouncing_Ball(
	input Clk, Reset,
	input logic[7:0] keycode,
	output logic [7:0] R,G,B,
	output logic hs,vs,VGA_Clk,blank,sync
);

	logic frame_clk, pixel_clk;
	logic [9:0] Ball_x, Ball_y, Ball_size, Draw_x, Draw_y; 
	logic [7:0] Red,Green,Blue;
	
	vga_controller VGA(.Clk(Clk),.Reset(Reset),
		.hs(hs),.vs(frame_clk), .blank(blank),.sync(sync), .pixel_clk(pixel_clk), .DrawX(Draw_x),.DrawY(Draw_y));
	
	ball myBall(.Reset(Reset),.frame_clk(frame_clk), .keycode(keycode), .BallX(Ball_x), .BallY(Ball_y), .BallS(Ball_size));
	
	color_mapper(.BallX(Ball_x), .BallY(Ball_y), .DrawX(Draw_x), .DrawY(Draw_y), 
		.Ball_size(Ball_size), .Red(Red),.Green(Green),.Blue(Blue));
	
	assign vs = frame_clk;
	assign R = Red;
	assign G = Green;
	assign B = Blue;
	assign VGA_Clk = pixel_clk;
	
endmodule