`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/16 17:13:53
// Design Name: 
// Module Name: axis_creat
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


module gmii_tx(

    input  wire             clk         ,
    input  wire             rst_n       ,

    input  wire             tx_en       ,

    output reg [7:0]        gmii_txd    ,
    output reg              gmii_tx_en  ,
    output reg              gmii_tx_er  
);

wire [9:0] frame0  [0:73];
wire [9:0] frame1  [0:73];
wire [9:0] frame2  [0:73];
wire [9:0] frame3  [0:73];
assign frame0[0 ]={8'h55,1'b1,1'b0},    frame1[0]  ={8'h55,1'b1,1'b0},   frame2[0]  = {8'h55,1'b1,1'b0},   frame3[0]  ={8'h55,1'b1,1'b0};
assign frame0[1 ]={8'h55,1'b1,1'b0},    frame1[1]  ={8'h55,1'b1,1'b0},   frame2[1]  = {8'h55,1'b1,1'b0},   frame3[1]  ={8'h55,1'b1,1'b0};
assign frame0[2 ]={8'h55,1'b1,1'b0},    frame1[2]  ={8'h55,1'b1,1'b0},   frame2[2]  = {8'h55,1'b1,1'b0},   frame3[2]  ={8'h55,1'b1,1'b0};
assign frame0[3 ]={8'h55,1'b1,1'b0},    frame1[3]  ={8'h55,1'b1,1'b0},   frame2[3]  = {8'h55,1'b1,1'b0},   frame3[3]  ={8'h55,1'b1,1'b0};
assign frame0[4 ]={8'h55,1'b1,1'b0},    frame1[4]  ={8'h55,1'b1,1'b0},   frame2[4]  = {8'h55,1'b1,1'b0},   frame3[4]  ={8'h55,1'b1,1'b0};
assign frame0[5 ]={8'h55,1'b1,1'b0},    frame1[5]  ={8'h55,1'b1,1'b0},   frame2[5]  = {8'h55,1'b1,1'b0},   frame3[5]  ={8'h55,1'b1,1'b0};
assign frame0[6 ]={8'h55,1'b1,1'b0},    frame1[6]  ={8'h55,1'b1,1'b0},   frame2[6]  = {8'h55,1'b1,1'b0},   frame3[6]  ={8'h55,1'b1,1'b0};
assign frame0[7 ]={8'hd5,1'b1,1'b0},    frame1[7]  ={8'hd5,1'b1,1'b0},   frame2[7]  = {8'hd5,1'b1,1'b0},   frame3[7]  ={8'hd5,1'b1,1'b0};
assign frame0[8 ]={8'hda,1'b1,1'b0},    frame1[8]  ={8'hda,1'b1,1'b0},   frame2[8]  = {8'hda,1'b1,1'b0},   frame3[8]  ={8'hda,1'b1,1'b0};
assign frame0[9 ]={8'h02,1'b1,1'b0},    frame1[9]  ={8'h02,1'b1,1'b0},   frame2[9]  = {8'h02,1'b1,1'b0},   frame3[9]  ={8'h02,1'b1,1'b0};
assign frame0[10]={8'h03,1'b1,1'b0},    frame1[10] ={8'h03,1'b1,1'b0},   frame2[10] = {8'h03,1'b1,1'b0},   frame3[10] ={8'h03,1'b1,1'b0};
assign frame0[11]={8'h04,1'b1,1'b0},    frame1[11] ={8'h04,1'b1,1'b0},   frame2[11] = {8'h04,1'b1,1'b0},   frame3[11] ={8'h04,1'b1,1'b0};
assign frame0[12]={8'h05,1'b1,1'b0},    frame1[12] ={8'h05,1'b1,1'b0},   frame2[12] = {8'h05,1'b1,1'b0},   frame3[12] ={8'h05,1'b1,1'b0};
assign frame0[13]={8'h06,1'b1,1'b0},    frame1[13] ={8'h06,1'b1,1'b0},   frame2[13] = {8'h06,1'b1,1'b0},   frame3[13] ={8'h06,1'b1,1'b0};
assign frame0[14]={8'h5a,1'b1,1'b0},    frame1[14] ={8'h5a,1'b1,1'b0},   frame2[14] = {8'h5a,1'b1,1'b0},   frame3[14] ={8'h5a,1'b1,1'b0};
assign frame0[15]={8'h02,1'b1,1'b0},    frame1[15] ={8'h02,1'b1,1'b0},   frame2[15] = {8'h02,1'b1,1'b0},   frame3[15] ={8'h02,1'b1,1'b0};
assign frame0[16]={8'h03,1'b1,1'b0},    frame1[16] ={8'h03,1'b1,1'b0},   frame2[16] = {8'h03,1'b1,1'b0},   frame3[16] ={8'h03,1'b1,1'b0};
assign frame0[17]={8'h04,1'b1,1'b0},    frame1[17] ={8'h04,1'b1,1'b0},   frame2[17] = {8'h04,1'b1,1'b0},   frame3[17] ={8'h04,1'b1,1'b0};
assign frame0[18]={8'h05,1'b1,1'b0},    frame1[18] ={8'h05,1'b1,1'b0},   frame2[18] = {8'h05,1'b1,1'b0},   frame3[18] ={8'h05,1'b1,1'b0};
assign frame0[19]={8'h06,1'b1,1'b0},    frame1[19] ={8'h06,1'b1,1'b0},   frame2[19] = {8'h06,1'b1,1'b0},   frame3[19] ={8'h06,1'b1,1'b0};
assign frame0[20]={8'h00,1'b1,1'b0},    frame1[20] ={8'h80,1'b1,1'b0},   frame2[20] = {8'h00,1'b1,1'b0},   frame3[20] ={8'h00,1'b1,1'b0};
assign frame0[21]={8'h2e,1'b1,1'b0},    frame1[21] ={8'h00,1'b1,1'b0},   frame2[21] = {8'h2e,1'b1,1'b0},   frame3[21] ={8'h03,1'b1,1'b0};
assign frame0[22]={8'h01,1'b1,1'b0},    frame1[22] ={8'h01,1'b1,1'b0},   frame2[22] = {8'h01,1'b1,1'b0},   frame3[22] ={8'h01,1'b1,1'b0};
assign frame0[23]={8'h02,1'b1,1'b0},    frame1[23] ={8'h02,1'b1,1'b0},   frame2[23] = {8'h02,1'b1,1'b0},   frame3[23] ={8'h02,1'b1,1'b0};
assign frame0[24]={8'h03,1'b1,1'b0},    frame1[24] ={8'h03,1'b1,1'b0},   frame2[24] = {8'h03,1'b1,1'b0},   frame3[24] ={8'h03,1'b1,1'b0};
assign frame0[25]={8'h04,1'b1,1'b0},    frame1[25] ={8'h04,1'b1,1'b0},   frame2[25] = {8'h04,1'b1,1'b0},   frame3[25] ={8'h00,1'b1,1'b0};
assign frame0[26]={8'h05,1'b1,1'b0},    frame1[26] ={8'h05,1'b1,1'b0},   frame2[26] = {8'h05,1'b1,1'b0},   frame3[26] ={8'h00,1'b1,1'b0};
assign frame0[27]={8'h06,1'b1,1'b0},    frame1[27] ={8'h06,1'b1,1'b0},   frame2[27] = {8'h06,1'b1,1'b0},   frame3[27] ={8'h00,1'b1,1'b0};
assign frame0[28]={8'h07,1'b1,1'b0},    frame1[28] ={8'h07,1'b1,1'b0},   frame2[28] = {8'h07,1'b1,1'b0},   frame3[28] ={8'h00,1'b1,1'b0};
assign frame0[29]={8'h08,1'b1,1'b0},    frame1[29] ={8'h08,1'b1,1'b0},   frame2[29] = {8'h08,1'b1,1'b0},   frame3[29] ={8'h00,1'b1,1'b0};
assign frame0[30]={8'h09,1'b1,1'b0},    frame1[30] ={8'h09,1'b1,1'b0},   frame2[30] = {8'h09,1'b1,1'b0},   frame3[30] ={8'h00,1'b1,1'b0};
assign frame0[31]={8'h0a,1'b1,1'b0},    frame1[31] ={8'h0a,1'b1,1'b0},   frame2[31] = {8'h0a,1'b1,1'b0},   frame3[31] ={8'h00,1'b1,1'b0};
assign frame0[32]={8'h0b,1'b1,1'b0},    frame1[32] ={8'h0b,1'b1,1'b0},   frame2[32] = {8'h0b,1'b1,1'b0},   frame3[32] ={8'h00,1'b1,1'b0};
assign frame0[33]={8'h0c,1'b1,1'b0},    frame1[33] ={8'h0c,1'b1,1'b0},   frame2[33] = {8'h0c,1'b1,1'b0},   frame3[33] ={8'h00,1'b1,1'b0};
assign frame0[34]={8'h0d,1'b1,1'b0},    frame1[34] ={8'h0d,1'b1,1'b0},   frame2[34] = {8'h0d,1'b1,1'b0},   frame3[34] ={8'h00,1'b1,1'b0};
assign frame0[35]={8'h0e,1'b1,1'b0},    frame1[35] ={8'h0e,1'b1,1'b0},   frame2[35] = {8'h0e,1'b1,1'b0},   frame3[35] ={8'h00,1'b1,1'b0};
assign frame0[36]={8'h0f,1'b1,1'b0},    frame1[36] ={8'h0f,1'b1,1'b0},   frame2[36] = {8'h0f,1'b1,1'b0},   frame3[36] ={8'h00,1'b1,1'b0};
assign frame0[37]={8'h10,1'b1,1'b0},    frame1[37] ={8'h10,1'b1,1'b0},   frame2[37] = {8'h10,1'b1,1'b0},   frame3[37] ={8'h00,1'b1,1'b0};
assign frame0[38]={8'h11,1'b1,1'b0},    frame1[38] ={8'h11,1'b1,1'b0},   frame2[38] = {8'h11,1'b1,1'b0},   frame3[38] ={8'h00,1'b1,1'b0};
assign frame0[39]={8'h12,1'b1,1'b0},    frame1[39] ={8'h12,1'b1,1'b0},   frame2[39] = {8'h12,1'b1,1'b0},   frame3[39] ={8'h00,1'b1,1'b0};
assign frame0[40]={8'h13,1'b1,1'b0},    frame1[40] ={8'h13,1'b1,1'b0},   frame2[40] = {8'h13,1'b1,1'b0},   frame3[40] ={8'h00,1'b1,1'b0};
assign frame0[41]={8'h14,1'b1,1'b0},    frame1[41] ={8'h14,1'b1,1'b0},   frame2[41] = {8'h14,1'b1,1'b0},   frame3[41] ={8'h00,1'b1,1'b0};
assign frame0[42]={8'h15,1'b1,1'b0},    frame1[42] ={8'h15,1'b1,1'b0},   frame2[42] = {8'h15,1'b1,1'b0},   frame3[42] ={8'h00,1'b1,1'b0};
assign frame0[43]={8'h16,1'b1,1'b0},    frame1[43] ={8'h16,1'b1,1'b0},   frame2[43] = {8'h16,1'b1,1'b0},   frame3[43] ={8'h00,1'b1,1'b0};
assign frame0[44]={8'h17,1'b1,1'b0},    frame1[44] ={8'h17,1'b1,1'b0},   frame2[44] = {8'h17,1'b1,1'b0},   frame3[44] ={8'h00,1'b1,1'b0};
assign frame0[45]={8'h18,1'b1,1'b0},    frame1[45] ={8'h18,1'b1,1'b0},   frame2[45] = {8'h18,1'b1,1'b0},   frame3[45] ={8'h00,1'b1,1'b0};
assign frame0[46]={8'h19,1'b1,1'b0},    frame1[46] ={8'h19,1'b1,1'b0},   frame2[46] = {8'h19,1'b1,1'b0},   frame3[46] ={8'h00,1'b1,1'b0};
assign frame0[47]={8'h1a,1'b1,1'b0},    frame1[47] ={8'h1a,1'b1,1'b0},   frame2[47] = {8'h1a,1'b1,1'b1},   frame3[47] ={8'h00,1'b1,1'b0};
assign frame0[48]={8'h1b,1'b1,1'b0},    frame1[48] ={8'h1b,1'b1,1'b0},   frame2[48] = {8'h1b,1'b1,1'b0},   frame3[48] ={8'h00,1'b1,1'b0};
assign frame0[49]={8'h1c,1'b1,1'b0},    frame1[49] ={8'h1c,1'b1,1'b0},   frame2[49] = {8'h1c,1'b1,1'b0},   frame3[49] ={8'h00,1'b1,1'b0};
assign frame0[50]={8'h1d,1'b1,1'b0},    frame1[50] ={8'h1d,1'b1,1'b0},   frame2[50] = {8'h1d,1'b1,1'b0},   frame3[50] ={8'h00,1'b1,1'b0};
assign frame0[51]={8'h1e,1'b1,1'b0},    frame1[51] ={8'h1e,1'b1,1'b0},   frame2[51] = {8'h1e,1'b1,1'b0},   frame3[51] ={8'h00,1'b1,1'b0};
assign frame0[52]={8'h1f,1'b1,1'b0},    frame1[52] ={8'h1f,1'b1,1'b0},   frame2[52] = {8'h1f,1'b1,1'b0},   frame3[52] ={8'h00,1'b1,1'b0};
assign frame0[53]={8'h20,1'b1,1'b0},    frame1[53] ={8'h20,1'b1,1'b0},   frame2[53] = {8'h20,1'b1,1'b0},   frame3[53] ={8'h00,1'b1,1'b0};
assign frame0[54]={8'h21,1'b1,1'b0},    frame1[54] ={8'h21,1'b1,1'b0},   frame2[54] = {8'h21,1'b1,1'b0},   frame3[54] ={8'h00,1'b1,1'b0};
assign frame0[55]={8'h22,1'b1,1'b0},    frame1[55] ={8'h22,1'b1,1'b0},   frame2[55] = {8'h22,1'b1,1'b0},   frame3[55] ={8'h00,1'b1,1'b0};
assign frame0[56]={8'h23,1'b1,1'b0},    frame1[56] ={8'h23,1'b1,1'b0},   frame2[56] = {8'h23,1'b1,1'b0},   frame3[56] ={8'h00,1'b1,1'b0};
assign frame0[57]={8'h24,1'b1,1'b0},    frame1[57] ={8'h24,1'b1,1'b0},   frame2[57] = {8'h24,1'b1,1'b0},   frame3[57] ={8'h00,1'b1,1'b0};
assign frame0[58]={8'h25,1'b1,1'b0},    frame1[58] ={8'h25,1'b1,1'b0},   frame2[58] = {8'h25,1'b1,1'b0},   frame3[58] ={8'h00,1'b1,1'b0};
assign frame0[59]={8'h26,1'b1,1'b0},    frame1[59] ={8'h26,1'b1,1'b0},   frame2[59] = {8'h26,1'b1,1'b0},   frame3[59] ={8'h00,1'b1,1'b0};
assign frame0[60]={8'h27,1'b1,1'b0},    frame1[60] ={8'h27,1'b1,1'b0},   frame2[60] = {8'h27,1'b1,1'b0},   frame3[60] ={8'h00,1'b1,1'b0};
assign frame0[61]={8'h28,1'b1,1'b0},    frame1[61] ={8'h28,1'b1,1'b0},   frame2[61] = {8'h28,1'b1,1'b0},   frame3[61] ={8'h00,1'b1,1'b0};
assign frame0[62]={8'h29,1'b1,1'b0},    frame1[62] ={8'h29,1'b1,1'b0},   frame2[62] = {8'h29,1'b1,1'b0},   frame3[62] ={8'h00,1'b1,1'b0};
assign frame0[63]={8'h2a,1'b1,1'b0},    frame1[63] ={8'h2a,1'b1,1'b0},   frame2[63] = {8'h2a,1'b1,1'b0},   frame3[63] ={8'h00,1'b1,1'b0};
assign frame0[64]={8'h2b,1'b1,1'b0},    frame1[64] ={8'h2b,1'b1,1'b0},   frame2[64] = {8'h2b,1'b1,1'b0},   frame3[64] ={8'h00,1'b1,1'b0};
assign frame0[65]={8'h2c,1'b1,1'b0},    frame1[65] ={8'h2c,1'b1,1'b0},   frame2[65] = {8'h2c,1'b1,1'b0},   frame3[65] ={8'h00,1'b1,1'b0};
assign frame0[66]={8'h2d,1'b1,1'b0},    frame1[66] ={8'h2d,1'b1,1'b0},   frame2[66] = {8'h2d,1'b1,1'b0},   frame3[66] ={8'h00,1'b1,1'b0};
assign frame0[67]={8'h2e,1'b1,1'b0},    frame1[67] ={8'h2e,1'b1,1'b0},   frame2[67] = {8'h2e,1'b1,1'b0},   frame3[67] ={8'h00,1'b1,1'b0};
assign frame0[68]={8'h14,1'b1,1'b0},    frame1[68] ={8'h2f,1'b1,1'b0},   frame2[68] = {8'h14,1'b1,1'b0},   frame3[68] ={8'h73,1'b1,1'b0};
assign frame0[69]={8'h19,1'b1,1'b0},    frame1[69] ={8'h33,1'b1,1'b0},   frame2[69] = {8'h19,1'b1,1'b0},   frame3[69] ={8'h00,1'b1,1'b0};
assign frame0[70]={8'hd1,1'b1,1'b0},    frame1[70] ={8'ha9,1'b1,1'b0},   frame2[70] = {8'hd1,1'b1,1'b0},   frame3[70] ={8'h75,1'b1,1'b0};
assign frame0[71]={8'hdd,1'b1,1'b0},    frame1[71] ={8'haf,1'b1,1'b0},   frame2[71] = {8'hdd,1'b1,1'b0},   frame3[71] ={8'h22,1'b1,1'b0};
assign frame0[72]={8'h00,1'b0,1'b0},    frame1[72] ={8'h1d,1'b1,1'b0},   frame2[72] = {8'h00,1'b0,1'b0},   frame3[72] ={8'h00,1'b0,1'b0};
assign frame0[73]={8'h00,1'b0,1'b0},    frame1[73] ={8'h00,1'b0,1'b0},   frame2[73] = {8'h00,1'b0,1'b0},   frame3[73] ={8'h00,1'b0,1'b0};
                                                                                                                                                     
reg  tx_en_ff0;
wire tx_start;
always  @(posedge clk or negedge rst_n)begin
  if(rst_n==1'b0)begin
    tx_en_ff0 <= 0;
  end else begin
    tx_en_ff0 <= tx_en;
  end
end
assign tx_start = tx_en && (~tx_en_ff0);

reg [7:0] cnt;                                                       
wire add_cnt,end_cnt;                                                
reg       flag;                                                      
always @(posedge clk or negedge rst_n)begin                          
    if(!rst_n)begin                                                  
        cnt <= 0;                                                    
    end                                                              
    else if(add_cnt)begin                                            
        if(end_cnt)                                                  
            cnt <= 0;                                                
        else                                                         
            cnt <= cnt + 1;                                          
    end                                                              
end                                                                  
                                                                     
assign add_cnt = flag ;                                
assign end_cnt = add_cnt && cnt== 73;                                

                                                                     
always  @(posedge clk or negedge rst_n)begin                         
    if(rst_n==1'b0)begin                                             
        flag <= 0;                                                   
    end                                                              
    else if(tx_start)begin                                       
        flag <= 1;                                                   
    end                                                              
    else if(end_cnt)begin                                            
        flag <= 0;                                                   
    end                                                              
end                                                                  

always  @(posedge clk or negedge rst_n)begin
  if(rst_n==1'b0)begin
    gmii_txd   <= 0;
    gmii_tx_en <= 0;
    gmii_tx_er <= 0;
  end else if(flag)begin
    gmii_txd   <= frame0[cnt][9:2];
    gmii_tx_en <= frame0[cnt][1];
    gmii_tx_er <= frame0[cnt][0];
  end
end
                                                                     
/* ila_1 axis_c ( */                                                       
/* 	.clk(clk), // input wire clk */                                       
/* 	.probe0(gmii_txd  ), // input wire [7:0]  probe0 */                   
/* 	.probe1(gmii_tx_en), // input wire [0:0]  probe1 */                  
/* 	.probe2(gmii_tx_er), // input wire [0:0]  probe2 */                  
/* 	.probe3(gmii_rx_dv) // input wire [0:0]  probe3 */                   
/* ); */                                                                   
                                                                     
endmodule                                                            

