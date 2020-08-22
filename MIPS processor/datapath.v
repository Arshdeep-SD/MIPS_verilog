`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/16/2020 02:31:52 PM
// Design Name: 
// Module Name: datapath
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


module datapath(
    input clk, reset, 
    input reg_dst, reg_write,
    input alu_src, pc_src, 
    input mem_read, mem_write,
    input mem_to_reg, 
    input [3:0] ALU_Control, 
    input branch, jump,
    output [31:0] datapath_result,
    output [5:0] inst_31_26, 
    output [5:0] inst_5_0
    );
    
    reg [9:0] pc; 
    wire [9:0] pc_plus4;// = 6'b000000;
    wire [31:0] instr;
    wire [4:0] write_reg_addr;
    wire [31:0] write_back_data;
    wire [31:0] reg1, reg2;
    wire [31:0] imm_value;
    wire [31:0] alu_in2;
    wire zero;
    wire [31:0] alu_result;
    wire [31:0] mem_read_data;
    
    wire [9:0] branch_result, branch_mux1_result, 
               branch_mux2_result, sifted_imm, shifted_instr;
    
    wire mux1_sel;
    
    always @(posedge clk or posedge reset)  
 begin   
      if(reset)   
           pc <= 10'b0000000000;  
      else  
           pc <= branch_mux2_result;  
 end  
 
 assign pc_plus4 = pc + 10'b0000000100;
        
    instruction_mem inst_mem (
        .read_addr(pc),
        .data(instr));
        
    assign inst_31_26 = instr[31:26];
    assign inst_5_0 = instr[5:0];
    
    mux2 #(.mux_width(5)) reg_mux 
    (   .a(instr[20:16]),
        .b(instr[15:11]),
        .sel(reg_dst),
        .y(write_reg_addr));
        
    register_file reg_file (
        .clk(clk),  
        .reset(reset),  
        .reg_write_en(reg_write),  
        .reg_write_dest(write_reg_addr),  
        .reg_write_data(write_back_data),  
        .reg_read_addr_1(instr[25:21]), 
        .reg_read_addr_2(instr[20:16]), 
        .reg_read_data_1(reg1),
        .reg_read_data_2(reg2));  
        
    sign_extend sign_ex_inst (
        .sign_ex_in(instr[15:0]),
        .sign_ex_out(imm_value));
        
    mux2 #(.mux_width(32)) alu_mux 
    (   .a(reg2),
        .b(imm_value),
        .sel(alu_src),
        .y(alu_in2));
        
    ALU alu_inst (
        .a(reg1),
        .b(alu_in2),
        .alu_control(ALU_Control),
        .zero(zero),
        .alu_result(alu_result));
        
    data_memory data_mem (
        .clk(clk),
        .mem_access_addr(alu_result),
        .mem_write_data(reg2),
        .mem_write_en(mem_write),
        .mem_read_en(mem_read),
        .mem_read_data(mem_read_data));
        
    mux2 #(.mux_width(32)) writeback_mux 
    (   .a(alu_result),
        .b(mem_read_data),
        .sel(mem_to_reg),
        .y(write_back_data));  
        
   ////// ///////////////////////////////////////////
       
    assign sifted_imm = imm_value[9:0] << 2;    
                
    assign mux1_sel = branch & zero;
    
    assign shifted_instr = instr[9:0] << 2;
    
    assign branch_result = pc_plus4 + sifted_imm;            

        
    mux2 #(.mux_width(10)) branch_mux_1
    (   .a(pc_plus4),
        .b(branch_result),
        .sel(mux1_sel),
        .y(branch_mux1_result));
        
    mux2 #(.mux_width(10)) branch_mux_2
    (   .a(branch_mux1_result),
        .b(shifted_instr),
        .sel(jump),
        .y(branch_mux2_result));
        
           
        
    assign datapath_result = write_back_data;
endmodule
