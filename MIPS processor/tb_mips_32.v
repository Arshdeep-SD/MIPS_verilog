`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/17/2020 11:41:22 AM
// Design Name: 
// Module Name: tb_mips_32
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_mips_32;
      reg clk;  
      reg reset;  
      // Outputs  

      wire [31:0] result;//,reg3,reg4;  
      // Instantiate the Unit Under Test (UUT)  
      mips_32 uut (  
           .clk(clk),   
           .reset(reset),     
           .result(result)    
      );  
      
      real points = 0;
      
//      assign uut.datapath_unit.data_mem.ram[0]= 32'b00000000000000000000000000000001;
      initial begin  
           clk = 0;  
           forever #10 clk = ~clk;  
      end  
      initial begin  
           // Initialize Inputs  
 
           reset = 1;  
           // Wait 100 ns for global reset to finish  
           #100;  
           reset = 0;  
           // store some data in data memory
           uut.datapath_unit.data_mem.ram[0]= 32'b00000000000000000000000000000001;// 00000001
           uut.datapath_unit.data_mem.ram[1]= 32'b00001111110101110110111000010000;// 0fd76e10 
           uut.datapath_unit.data_mem.ram[2]= 32'b01011010000000000100001010011011;// 5a00429b 
           uut.datapath_unit.data_mem.ram[3]= 32'b00010100001100110011111111111100;// 14333ffc 
           uut.datapath_unit.data_mem.ram[4]= 32'b00110010000111111110110111001011;// 321fedcb 
           uut.datapath_unit.data_mem.ram[5]= 32'b10000000000000000000000000000000;// 80000000 
           uut.datapath_unit.data_mem.ram[6]= 32'b10010000000100101111110101100101;// 9012fd65
           uut.datapath_unit.data_mem.ram[7]= 32'b10101011110000000000001000110111;// abc00237
           uut.datapath_unit.data_mem.ram[8]= 32'b10110101010010111100000000110001;// b54bc031
           uut.datapath_unit.data_mem.ram[9]= 32'b11000001100001111010011000000110;// c187a606 
          
          #2670; 
          if(uut.datapath_unit.data_mem.ram[11]==32'h5a004203) begin $display("ANDI 1		success!\n"); points =points + 1; end else $display("ANDI 1		failed!\n");
          if(uut.datapath_unit.data_mem.ram[12]==32'hf02891ee) begin $display("NOR  1		success!\n"); points =points + 1; end else $display("NOR  1		failed!\n");
          if(uut.datapath_unit.data_mem.ram[13]==32'h00000001) begin $display("SLT  1		success!\n"); points =points + 1; end else $display("SLT  1		failed!\n");
          if(uut.datapath_unit.data_mem.ram[14]==32'h7ebb7080) begin $display("SLL  1		success!\n"); points =points + 1; end else $display("SLL  1		failed!\n");
          if(uut.datapath_unit.data_mem.ram[15]==32'h00000000) begin $display("SRL  1		success!\n"); points =points + 1; end else $display("SRL  1		failed!\n");
          if(uut.datapath_unit.data_mem.ram[16]==32'hfe000000) begin $display("SRA  1		success!\n"); points =points + 1; end else $display("SRA  1		failed!\n");
          if(uut.datapath_unit.data_mem.ram[17]==32'h55d72c8b) begin $display("XOR  1		success!\n"); points =points + 1; end else $display("XOR  1		failed!\n");
          if(uut.datapath_unit.data_mem.ram[18]==32'h0fd76e10) begin $display("MULT 1		success!\n"); points =points + 1; end else $display("MULT 1		failed!\n");
          if(uut.datapath_unit.data_mem.ram[19]==32'h0fd76e10) begin $display("DIV  1		success!\n"); points =points + 1; end else $display("DIV  1		failed!\n");
          
          if(uut.datapath_unit.data_mem.ram[20]==32'h00000d61) begin $display("ANDI 2		success!\n"); points =points + 1; end else $display("ANDI 2		failed!\n");
          if(uut.datapath_unit.data_mem.ram[21]==32'h6028008a) begin $display("NOR  2		success!\n"); points =points + 1; end else $display("NOR  2		failed!\n");
          if(uut.datapath_unit.data_mem.ram[22]==32'h00000001) begin $display("SLT  2		success!\n"); points =points + 1; end else $display("SLT  2		failed!\n");
          if(uut.datapath_unit.data_mem.ram[23]==32'h5faca000) begin $display("SLL  2		success!\n"); points =points + 1; end else $display("SLL  2		failed!\n");
          if(uut.datapath_unit.data_mem.ram[24]==32'h01578004) begin $display("SRL  2		success!\n"); points =points + 1; end else $display("SRL  2		failed!\n");
          if(uut.datapath_unit.data_mem.ram[25]==32'hed52f00c) begin $display("SRA  2		success!\n"); points =points + 1; end else $display("SRA  2		failed!\n");
          if(uut.datapath_unit.data_mem.ram[26]==32'h9fc59375) begin $display("XOR  2		success!\n"); points =points + 1; end else $display("XOR  2		failed!\n");
          if(uut.datapath_unit.data_mem.ram[27]==32'he4e43c50) begin $display("MULT 2		success!\n"); points =points + 1; end else $display("MULT 2		failed!\n");
          if(uut.datapath_unit.data_mem.ram[28]==32'h00000009) begin $display("DIV  2		success!\n"); points =points + 1; end else $display("DIV  2		failed!\n");
          
          if(uut.datapath_unit.data_mem.ram[29]==32'hc187a006) begin $display("ANDI 3		success!\n"); points =points + 1; end else $display("ANDI 3		failed!\n");
          if(uut.datapath_unit.data_mem.ram[30]==32'h043fbd40) begin $display("NOR  3		success!\n"); points =points + 1; end else $display("NOR  3		failed!\n");
          if(uut.datapath_unit.data_mem.ram[31]==32'h00000000) begin $display("SLT  3		success!\n"); points =points + 1; end else $display("SLT  3		failed!\n");
          if(uut.datapath_unit.data_mem.ram[32]==32'h85360000) begin $display("SLL  3		success!\n"); points =points + 1; end else $display("SLL  3		failed!\n");
          if(uut.datapath_unit.data_mem.ram[33]==32'h00000abc) begin $display("SRL  3		success!\n"); points =points + 1; end else $display("SRL  3		failed!\n");
          if(uut.datapath_unit.data_mem.ram[34]==32'hd5e0011b) begin $display("SRA  3		success!\n"); points =points + 1; end else $display("SRA  3		failed!\n");
          if(uut.datapath_unit.data_mem.ram[35]==32'hf1c040ac) begin $display("XOR  3		success!\n"); points =points + 1; end else $display("XOR  3		failed!\n");
          if(uut.datapath_unit.data_mem.ram[36]==32'hd3d3854d) begin $display("MULT 3		success!\n"); points =points + 1; end else $display("MULT 3		failed!\n");
          if(uut.datapath_unit.data_mem.ram[37]==32'h00000001) begin $display("DIV  3		success!\n"); points =points + 1; end else $display("DIV  3		failed!\n");
          
          if(uut.datapath_unit.data_mem.ram[38]==32'habc00002) begin $display("ANDI 4		success!\n"); points =points + 1; end else $display("ANDI 4		failed!\n");
          if(uut.datapath_unit.data_mem.ram[39]==32'h442d0088) begin $display("NOR  4		success!\n"); points =points + 1; end else $display("NOR  4		failed!\n");
          if(uut.datapath_unit.data_mem.ram[40]==32'h00000000) begin $display("SLT  4		success!\n"); points =points + 1; end else $display("SLT  4		failed!\n");
          if(uut.datapath_unit.data_mem.ram[41]==32'h097eb280) begin $display("SLL  4		success!\n"); points =points + 1; end else $display("SLL  4		failed!\n");
          if(uut.datapath_unit.data_mem.ram[42]==32'h16a97806) begin $display("SRL  4		success!\n"); points =points + 1; end else $display("SRL  4		failed!\n");
          if(uut.datapath_unit.data_mem.ram[43]==32'hfdaa5e01) begin $display("SRA  4		success!\n"); points =points + 1; end else $display("SRA  4		failed!\n");
          if(uut.datapath_unit.data_mem.ram[44]==32'h3bd2ff52) begin $display("XOR  4		success!\n"); points =points + 1; end else $display("XOR  4		failed!\n");
          if(uut.datapath_unit.data_mem.ram[45]==32'h9ccf3ab3) begin $display("MULT 4		success!\n"); points =points + 1; end else $display("MULT 4		failed!\n");
          if(uut.datapath_unit.data_mem.ram[46]==32'h00000001) begin $display("DIV  4		success!\n"); points =points + 1; end else $display("DIV  4		failed!\n");
          
          if(uut.datapath_unit.data_mem.ram[47]==32'h00000000) begin $display("ANDI 5		success!\n"); points =points + 1; end else $display("ANDI 5		failed!\n");
          if(uut.datapath_unit.data_mem.ram[48]==32'h3e7859f9) begin $display("NOR  5		success!\n"); points =points + 1; end else $display("NOR  5		failed!\n");
          if(uut.datapath_unit.data_mem.ram[49]==32'h00000001) begin $display("SLT  5		success!\n"); points =points + 1; end else $display("SLT  5		failed!\n");
          if(uut.datapath_unit.data_mem.ram[50]==32'h80000000) begin $display("SLL  5		success!\n"); points =points + 1; end else $display("SLL  5		failed!\n");
          if(uut.datapath_unit.data_mem.ram[51]==32'h00000001) begin $display("SRL  5		success!\n"); points =points + 1; end else $display("SRL  5		failed!\n");
          if(uut.datapath_unit.data_mem.ram[52]==32'hffffffff) begin $display("SRA  5		success!\n"); points =points + 1; end else $display("SRA  5		failed!\n");
          if(uut.datapath_unit.data_mem.ram[53]==32'h74cc6637) begin $display("XOR  5		success!\n"); points =points + 1; end else $display("XOR  5		failed!\n");
          if(uut.datapath_unit.data_mem.ram[54]==32'ha93d4726) begin $display("MULT 5		success!\n"); points =points + 1; end else $display("MULT 5		failed!\n");
          if(uut.datapath_unit.data_mem.ram[55]==32'h00000000) begin $display("DIV  5		success!\n"); points =points + 1; end else $display("DIV  5		failed!\n");
          
          if(uut.datapath_unit.data_mem.ram[56]==32'hc187a606) begin $display("BEQ  1		success!\n"); points =points + 2.5; end else $display("BEQ  1		failed!\n");
          if(uut.datapath_unit.data_mem.ram[57]==32'h14333ffd) begin $display("BEQ  2		success!\n"); points =points + 2.5; end else $display("BEQ  2		failed!\n");
          if(uut.datapath_unit.data_mem.ram[58]==32'h00000000) begin $display("BEQ  3		success!\n"); points =points + 2.5; end else $display("BEQ  3		failed!\n");
          if(uut.datapath_unit.data_mem.ram[59]==32'h00000005) begin $display("BEQ  4		success!\n"); points =points + 2.5; end else $display("BEQ  4		failed!\n");
          if(uut.datapath_unit.data_mem.ram[60]==32'hffffffff) begin $display("BEQ  5		success!\n"); points =points + 2.5; end else $display("BEQ  5		failed!\n");
          
          if(uut.datapath_unit.data_mem.ram[61]==32'hc187a606) begin $display("j  1		success!\n"); points =points + 2.5; end else $display("j  1		failed!\n");
          if(uut.datapath_unit.data_mem.ram[62]==32'hb54bc031) begin $display("j  2		success!\n"); points =points + 2.5; end else $display("j  2		failed!\n");
          if(uut.datapath_unit.data_mem.ram[63]==32'habc00237) begin $display("j  3		success!\n"); points =points + 2.5; end else $display("j  3		failed!\n");
          if(uut.datapath_unit.data_mem.ram[64]==32'h9012fd65) begin $display("j  4		success!\n"); points =points + 2.5; end else $display("j  4		failed!\n");
          if(uut.datapath_unit.data_mem.ram[65]==32'h80000000) begin $display("j  5		success!\n"); points =points + 2.5; end else $display("j  5		failed!\n");
          
         $display("points : ", points);
           
      end  
endmodule
