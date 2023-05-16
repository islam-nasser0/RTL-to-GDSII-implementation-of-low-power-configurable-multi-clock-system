/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06
// Date      : Sun Aug 21 03:42:44 2022
/////////////////////////////////////////////////////////////


module mux2X1_0 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X6M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_5 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X6M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_4 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X6M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_3 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_2 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_1 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module RST_SYNC_test_0 ( RST, CLK, SYNC_RST, test_si, test_se );
  input RST, CLK, test_si, test_se;
  output SYNC_RST;
  wire   meta_flop;

  SDFFRQX2M meta_flop_reg ( .D(1'b1), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(meta_flop) );
  SDFFRQX1M sync_flop_reg ( .D(meta_flop), .SI(meta_flop), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(SYNC_RST) );
endmodule


module RST_SYNC_test_1 ( RST, CLK, SYNC_RST, test_si, test_se );
  input RST, CLK, test_si, test_se;
  output SYNC_RST;
  wire   meta_flop;

  SDFFRQX2M meta_flop_reg ( .D(1'b1), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(meta_flop) );
  SDFFRQX1M sync_flop_reg ( .D(meta_flop), .SI(meta_flop), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(SYNC_RST) );
endmodule


module DATA_SYNC_test_0 ( dest_clk, dest_rst, unsync_bus, bus_enable, sync_bus, 
        enable_pulse_d, test_si, test_so, test_se );
  input [7:0] unsync_bus;
  output [7:0] sync_bus;
  input dest_clk, dest_rst, bus_enable, test_si, test_se;
  output enable_pulse_d, test_so;
  wire   n5, sync_flop, meta_flop, enable_flop, n1, n4, n6, n8, n10, n12, n14,
         n16, n18, n34, n35, n36, n37, n40, n42, n43, n2;

  SDFFRQX2M \sync_bus_reg[0]  ( .D(n4), .SI(meta_flop), .SE(test_se), .CK(
        dest_clk), .RN(n35), .Q(sync_bus[0]) );
  INVX4M U27 ( .A(n1), .Y(n37) );
  BUFX4M U28 ( .A(n1), .Y(n34) );
  INVX6M U29 ( .A(n36), .Y(n35) );
  INVX2M U30 ( .A(dest_rst), .Y(n36) );
  NAND2BX2M U31 ( .AN(enable_flop), .B(sync_flop), .Y(n1) );
  AO22X1M U32 ( .A0(unsync_bus[2]), .A1(n37), .B0(sync_bus[2]), .B1(n34), .Y(
        n8) );
  AO22X1M U33 ( .A0(unsync_bus[1]), .A1(n37), .B0(sync_bus[1]), .B1(n34), .Y(
        n6) );
  AO22X1M U34 ( .A0(unsync_bus[6]), .A1(n37), .B0(sync_bus[6]), .B1(n34), .Y(
        n16) );
  AO22X1M U35 ( .A0(unsync_bus[4]), .A1(n37), .B0(sync_bus[4]), .B1(n34), .Y(
        n12) );
  AO22X1M U36 ( .A0(unsync_bus[5]), .A1(n37), .B0(sync_bus[5]), .B1(n34), .Y(
        n14) );
  AO22X1M U37 ( .A0(unsync_bus[0]), .A1(n37), .B0(n34), .B1(n40), .Y(n4) );
  AO22X1M U38 ( .A0(unsync_bus[3]), .A1(n37), .B0(n42), .B1(n34), .Y(n10) );
  AO22X1M U39 ( .A0(unsync_bus[7]), .A1(n37), .B0(n43), .B1(n34), .Y(n18) );
  DLY1X1M U40 ( .A(sync_bus[0]), .Y(n40) );
  DLY1X1M U42 ( .A(sync_bus[3]), .Y(n42) );
  DLY1X1M U43 ( .A(sync_bus[7]), .Y(n43) );
  SDFFRQX1M enable_flop_reg ( .D(sync_flop), .SI(test_si), .SE(test_se), .CK(
        dest_clk), .RN(n35), .Q(enable_flop) );
  SDFFRQX1M enable_pulse_d_reg ( .D(n37), .SI(enable_flop), .SE(test_se), .CK(
        dest_clk), .RN(dest_rst), .Q(n5) );
  SDFFRQX1M meta_flop_reg ( .D(bus_enable), .SI(enable_pulse_d), .SE(test_se), 
        .CK(dest_clk), .RN(n35), .Q(meta_flop) );
  SDFFRQX1M \sync_bus_reg[7]  ( .D(n18), .SI(sync_bus[6]), .SE(test_se), .CK(
        dest_clk), .RN(n35), .Q(sync_bus[7]) );
  SDFFRQX1M \sync_bus_reg[3]  ( .D(n10), .SI(sync_bus[2]), .SE(test_se), .CK(
        dest_clk), .RN(n35), .Q(sync_bus[3]) );
  SDFFRQX4M \sync_bus_reg[1]  ( .D(n6), .SI(n40), .SE(test_se), .CK(dest_clk), 
        .RN(n35), .Q(sync_bus[1]) );
  SDFFRQX4M \sync_bus_reg[2]  ( .D(n8), .SI(sync_bus[1]), .SE(test_se), .CK(
        dest_clk), .RN(n35), .Q(sync_bus[2]) );
  SDFFRQX4M \sync_bus_reg[4]  ( .D(n12), .SI(n42), .SE(test_se), .CK(dest_clk), 
        .RN(n35), .Q(sync_bus[4]) );
  SDFFRQX4M \sync_bus_reg[5]  ( .D(n14), .SI(sync_bus[4]), .SE(test_se), .CK(
        dest_clk), .RN(n35), .Q(sync_bus[5]) );
  SDFFRQX4M \sync_bus_reg[6]  ( .D(n16), .SI(sync_bus[5]), .SE(test_se), .CK(
        dest_clk), .RN(n35), .Q(sync_bus[6]) );
  SDFFRQX2M sync_flop_reg ( .D(meta_flop), .SI(n43), .SE(test_se), .CK(
        dest_clk), .RN(dest_rst), .Q(sync_flop) );
  BUFX2M U3 ( .A(sync_flop), .Y(test_so) );
  INVXLM U4 ( .A(n5), .Y(n2) );
  INVX6M U5 ( .A(n2), .Y(enable_pulse_d) );
endmodule


module DATA_SYNC_test_1 ( dest_clk, dest_rst, unsync_bus, bus_enable, sync_bus, 
        enable_pulse_d, test_si, test_so, test_se );
  input [7:0] unsync_bus;
  output [7:0] sync_bus;
  input dest_clk, dest_rst, bus_enable, test_si, test_se;
  output enable_pulse_d, test_so;
  wire   sync_flop, meta_flop, enable_flop, n34, n35, n36, n37, n41, n43, n45,
         n47, n49, n51, n53, n55, n58, n61;
  assign test_so = sync_flop;

  SDFFRQX1M sync_flop_reg ( .D(meta_flop), .SI(sync_bus[7]), .SE(test_se), 
        .CK(dest_clk), .RN(dest_rst), .Q(sync_flop) );
  SDFFRQX1M enable_flop_reg ( .D(n61), .SI(test_si), .SE(test_se), .CK(
        dest_clk), .RN(n35), .Q(enable_flop) );
  SDFFRQX1M meta_flop_reg ( .D(bus_enable), .SI(enable_pulse_d), .SE(test_se), 
        .CK(dest_clk), .RN(n35), .Q(meta_flop) );
  SDFFRQX2M enable_pulse_d_reg ( .D(n37), .SI(enable_flop), .SE(test_se), .CK(
        dest_clk), .RN(n35), .Q(enable_pulse_d) );
  SDFFRQX2M \sync_bus_reg[6]  ( .D(n43), .SI(sync_bus[5]), .SE(test_se), .CK(
        dest_clk), .RN(n35), .Q(sync_bus[6]) );
  SDFFRQX2M \sync_bus_reg[5]  ( .D(n45), .SI(sync_bus[4]), .SE(test_se), .CK(
        dest_clk), .RN(n35), .Q(sync_bus[5]) );
  SDFFRQX2M \sync_bus_reg[4]  ( .D(n47), .SI(sync_bus[3]), .SE(test_se), .CK(
        dest_clk), .RN(n35), .Q(sync_bus[4]) );
  SDFFRQX2M \sync_bus_reg[3]  ( .D(n49), .SI(sync_bus[2]), .SE(test_se), .CK(
        dest_clk), .RN(n35), .Q(sync_bus[3]) );
  SDFFRQX2M \sync_bus_reg[2]  ( .D(n51), .SI(sync_bus[1]), .SE(test_se), .CK(
        dest_clk), .RN(n35), .Q(sync_bus[2]) );
  SDFFRQX2M \sync_bus_reg[1]  ( .D(n53), .SI(sync_bus[0]), .SE(test_se), .CK(
        dest_clk), .RN(n35), .Q(sync_bus[1]) );
  SDFFRQX2M \sync_bus_reg[0]  ( .D(n55), .SI(meta_flop), .SE(test_se), .CK(
        dest_clk), .RN(n35), .Q(sync_bus[0]) );
  SDFFRQX2M \sync_bus_reg[7]  ( .D(n41), .SI(sync_bus[6]), .SE(test_se), .CK(
        dest_clk), .RN(n35), .Q(sync_bus[7]) );
  INVX4M U27 ( .A(n58), .Y(n37) );
  BUFX4M U28 ( .A(n58), .Y(n34) );
  INVX6M U29 ( .A(n36), .Y(n35) );
  INVX2M U30 ( .A(dest_rst), .Y(n36) );
  AO22X1M U31 ( .A0(unsync_bus[0]), .A1(n37), .B0(sync_bus[0]), .B1(n34), .Y(
        n55) );
  AO22X1M U32 ( .A0(unsync_bus[1]), .A1(n37), .B0(sync_bus[1]), .B1(n34), .Y(
        n53) );
  AO22X1M U33 ( .A0(unsync_bus[2]), .A1(n37), .B0(sync_bus[2]), .B1(n34), .Y(
        n51) );
  AO22X1M U34 ( .A0(unsync_bus[3]), .A1(n37), .B0(sync_bus[3]), .B1(n34), .Y(
        n49) );
  AO22X1M U35 ( .A0(unsync_bus[4]), .A1(n37), .B0(sync_bus[4]), .B1(n34), .Y(
        n47) );
  AO22X1M U36 ( .A0(unsync_bus[5]), .A1(n37), .B0(sync_bus[5]), .B1(n34), .Y(
        n45) );
  AO22X1M U37 ( .A0(unsync_bus[6]), .A1(n37), .B0(sync_bus[6]), .B1(n34), .Y(
        n43) );
  AO22X1M U38 ( .A0(unsync_bus[7]), .A1(n37), .B0(sync_bus[7]), .B1(n34), .Y(
        n41) );
  NAND2BX2M U39 ( .AN(enable_flop), .B(n61), .Y(n58) );
  DLY1X1M U40 ( .A(sync_flop), .Y(n61) );
endmodule


module BIT_SYNC_test_1 ( dest_clk, dest_rst, unsync_bit, sync_bit, test_si, 
        test_se );
  input dest_clk, dest_rst, unsync_bit, test_si, test_se;
  output sync_bit;
  wire   meta_flop, n5;

  SDFFRQX2M sync_flop_reg ( .D(meta_flop), .SI(meta_flop), .SE(test_se), .CK(
        dest_clk), .RN(n5), .Q(sync_bit) );
  BUFX2M U5 ( .A(dest_rst), .Y(n5) );
  SDFFRQX1M meta_flop_reg ( .D(unsync_bit), .SI(test_si), .SE(test_se), .CK(
        dest_clk), .RN(n5), .Q(meta_flop) );
endmodule


module ClkDiv_test_1 ( i_ref_clk, i_rst, i_clk_en, i_div_ratio, o_div_clk, 
        test_si, test_so, test_se );
  input [3:0] i_div_ratio;
  input i_ref_clk, i_rst, i_clk_en, test_si, test_se;
  output o_div_clk, test_so;
  wire   div_clk, odd_edge_tog, n19, n20, n21, n22, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n36, n38, n39, n40, n41, n42, n11, n12,
         n13, n14, n15, n16, n17, n18, n23, n35, n37, n43, n44, n47;
  wire   [2:0] count;
  assign test_so = odd_edge_tog;

  SDFFRQX2M \count_reg[0]  ( .D(n42), .SI(test_si), .SE(test_se), .CK(
        i_ref_clk), .RN(n14), .Q(count[0]) );
  SDFFRQX2M \count_reg[2]  ( .D(n38), .SI(n43), .SE(test_se), .CK(i_ref_clk), 
        .RN(n14), .Q(count[2]) );
  SDFFRQX2M \count_reg[1]  ( .D(n39), .SI(n37), .SE(test_se), .CK(i_ref_clk), 
        .RN(n14), .Q(count[1]) );
  SDFFSQX2M odd_edge_tog_reg ( .D(n40), .SI(n47), .SE(test_se), .CK(i_ref_clk), 
        .SN(i_rst), .Q(odd_edge_tog) );
  INVX2M U8 ( .A(n15), .Y(n14) );
  OAI21X6M U9 ( .A0(i_div_ratio[3]), .A1(n36), .B0(i_clk_en), .Y(n22) );
  XOR2X1M U10 ( .A(i_div_ratio[3]), .B(count[2]), .Y(n33) );
  CLKXOR2X2M U16 ( .A(n11), .B(n43), .Y(n31) );
  OA21X2M U17 ( .A0(n35), .A1(n18), .B0(n36), .Y(n11) );
  AOI21X2M U18 ( .A0(n37), .A1(n17), .B0(n22), .Y(n21) );
  INVX2M U19 ( .A(n22), .Y(n16) );
  INVX2M U20 ( .A(n26), .Y(n17) );
  NAND2X2M U21 ( .A(n18), .B(n35), .Y(n36) );
  INVX2M U22 ( .A(n32), .Y(n23) );
  INVX2M U23 ( .A(i_rst), .Y(n15) );
  OAI32X2M U24 ( .A0(n22), .A1(count[0]), .A2(n26), .B0(n16), .B1(n37), .Y(n42) );
  OAI32X2M U25 ( .A0(n19), .A1(count[2]), .A2(n43), .B0(n20), .B1(n44), .Y(n38) );
  INVX2M U26 ( .A(count[2]), .Y(n44) );
  AOI21BX2M U27 ( .A0(n17), .A1(n43), .B0N(n21), .Y(n20) );
  XNOR2X4M U28 ( .A(n35), .B(count[0]), .Y(n32) );
  OAI21X2M U29 ( .A0(n28), .A1(n29), .B0(i_div_ratio[0]), .Y(n24) );
  NOR4X2M U30 ( .A(odd_edge_tog), .B(n32), .C(n33), .D(n34), .Y(n28) );
  NOR4BX2M U31 ( .AN(odd_edge_tog), .B(n23), .C(n30), .D(n31), .Y(n29) );
  CLKXOR2X2M U32 ( .A(n12), .B(count[2]), .Y(n30) );
  AND2X2M U33 ( .A(i_div_ratio[3]), .B(n36), .Y(n12) );
  CLKXOR2X2M U34 ( .A(i_div_ratio[2]), .B(count[1]), .Y(n34) );
  OAI22X1M U35 ( .A0(n21), .A1(n43), .B0(count[1]), .B1(n19), .Y(n39) );
  CLKXOR2X2M U36 ( .A(odd_edge_tog), .B(n13), .Y(n40) );
  NOR2X2M U37 ( .A(n24), .B(n22), .Y(n13) );
  CLKXOR2X2M U38 ( .A(n25), .B(div_clk), .Y(n41) );
  NOR2X2M U39 ( .A(n17), .B(n22), .Y(n25) );
  INVX2M U40 ( .A(i_div_ratio[1]), .Y(n35) );
  NAND2X2M U41 ( .A(n27), .B(n24), .Y(n26) );
  OR4X1M U42 ( .A(n30), .B(n31), .C(n23), .D(i_div_ratio[0]), .Y(n27) );
  NAND3X2M U43 ( .A(n17), .B(count[0]), .C(n16), .Y(n19) );
  INVX2M U44 ( .A(i_div_ratio[2]), .Y(n18) );
  INVX2M U45 ( .A(count[1]), .Y(n43) );
  INVX2M U46 ( .A(count[0]), .Y(n37) );
  MX2XLM U47 ( .A(i_ref_clk), .B(n47), .S0(n16), .Y(o_div_clk) );
  DLY1X1M U48 ( .A(div_clk), .Y(n47) );
  SDFFSRX2M div_clk_reg ( .D(n41), .SI(n44), .SE(test_se), .CK(i_ref_clk), 
        .SN(1'b1), .RN(n14), .Q(div_clk) );
endmodule


module uart_tx_fsm_test_1 ( CLK, RST, Data_Valid, ser_done, parity_enable, 
        Ser_enable, mux_sel, busy, test_si, test_so, test_se );
  output [1:0] mux_sel;
  input CLK, RST, Data_Valid, ser_done, parity_enable, test_si, test_se;
  output Ser_enable, busy, test_so;
  wire   n23, busy_c, n8, n9, n10, n11, n12, n13, n15, n16, n17, n18, n22;
  wire   [2:0] current_state;
  wire   [2:0] next_state;
  assign test_so = current_state[2];

  SDFFRQX4M \current_state_reg[0]  ( .D(next_state[0]), .SI(n22), .SE(test_se), 
        .CK(CLK), .RN(n15), .Q(current_state[0]) );
  INVX2M U7 ( .A(current_state[0]), .Y(n17) );
  OAI21X2M U8 ( .A0(Data_Valid), .A1(current_state[0]), .B0(n18), .Y(n11) );
  OAI21X2M U9 ( .A0(current_state[2]), .A1(current_state[0]), .B0(n12), .Y(
        mux_sel[1]) );
  BUFX2M U14 ( .A(RST), .Y(n15) );
  INVX2M U15 ( .A(n13), .Y(n16) );
  AOI2B1X1M U17 ( .A1N(parity_enable), .A0(ser_done), .B0(n17), .Y(n8) );
  NOR3X4M U18 ( .A(n9), .B(ser_done), .C(current_state[2]), .Y(Ser_enable) );
  OAI21X4M U19 ( .A0(current_state[1]), .A1(n17), .B0(n12), .Y(n13) );
  NAND2X2M U20 ( .A(current_state[1]), .B(n17), .Y(n12) );
  NAND2X2M U21 ( .A(n16), .B(current_state[0]), .Y(n9) );
  OAI2B2X4M U22 ( .A1N(current_state[2]), .A0(n12), .B0(current_state[2]), 
        .B1(n13), .Y(mux_sel[0]) );
  AOI21X2M U23 ( .A0(n16), .A1(n9), .B0(current_state[2]), .Y(next_state[1])
         );
  OAI21X2M U24 ( .A0(current_state[2]), .A1(n17), .B0(n12), .Y(busy_c) );
  AOI21X2M U25 ( .A0(n10), .A1(n11), .B0(current_state[2]), .Y(next_state[0])
         );
  NAND2BX2M U26 ( .AN(ser_done), .B(current_state[0]), .Y(n10) );
  DLY1X1M U28 ( .A(n23), .Y(busy) );
  DLY1X1M U29 ( .A(n23), .Y(n22) );
  SDFFRQX1M busy_reg ( .D(busy_c), .SI(test_si), .SE(test_se), .CK(CLK), .RN(
        n15), .Q(n23) );
  SDFFSRX2M \current_state_reg[1]  ( .D(next_state[1]), .SI(current_state[0]), 
        .SE(test_se), .CK(CLK), .SN(1'b1), .RN(RST), .Q(current_state[1]), 
        .QN(n18) );
  SDFFRHQX8M \current_state_reg[2]  ( .D(next_state[2]), .SI(n18), .SE(test_se), .CK(CLK), .RN(n15), .Q(current_state[2]) );
  NOR3X2M U3 ( .A(n18), .B(current_state[2]), .C(n8), .Y(next_state[2]) );
endmodule


module Serializer_test_1 ( CLK, RST, DATA, Enable, Busy, Data_Valid, ser_out, 
        ser_done, test_si, test_so, test_se );
  input [7:0] DATA;
  input CLK, RST, Enable, Busy, Data_Valid, test_si, test_se;
  output ser_out, ser_done, test_so;
  wire   N23, N24, N25, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n44, n45, n46, n47,
         n48, n49, n52, n53, n54, n55, n56, n57, n58, n59, n60;
  wire   [7:1] DATA_V;
  wire   [2:0] ser_count;
  assign test_so = n49;

  SDFFRQX2M \ser_count_reg[0]  ( .D(N23), .SI(n59), .SE(test_se), .CK(CLK), 
        .RN(n45), .Q(ser_count[0]) );
  CLKBUFX6M U25 ( .A(n18), .Y(n44) );
  INVX6M U26 ( .A(n46), .Y(n45) );
  INVX2M U27 ( .A(RST), .Y(n46) );
  NOR2X8M U28 ( .A(n47), .B(n44), .Y(n17) );
  NOR2X8M U29 ( .A(n44), .B(n17), .Y(n15) );
  INVX2M U30 ( .A(Enable), .Y(n47) );
  OAI2BB1X2M U31 ( .A0N(n15), .A1N(n58), .B0(n16), .Y(n28) );
  AOI22X1M U32 ( .A0(DATA_V[1]), .A1(n17), .B0(DATA[0]), .B1(n44), .Y(n16) );
  OAI2BB1X2M U33 ( .A0N(n15), .A1N(n60), .B0(n24), .Y(n35) );
  AOI22X1M U34 ( .A0(n17), .A1(DATA_V[2]), .B0(DATA[1]), .B1(n44), .Y(n24) );
  OAI2BB1X2M U35 ( .A0N(n15), .A1N(n53), .B0(n23), .Y(n34) );
  AOI22X1M U36 ( .A0(n17), .A1(DATA_V[3]), .B0(DATA[2]), .B1(n44), .Y(n23) );
  OAI2BB1X2M U37 ( .A0N(n15), .A1N(n54), .B0(n22), .Y(n33) );
  AOI22X1M U38 ( .A0(n17), .A1(DATA_V[4]), .B0(DATA[3]), .B1(n44), .Y(n22) );
  OAI2BB1X2M U39 ( .A0N(n15), .A1N(n55), .B0(n21), .Y(n32) );
  AOI22X1M U40 ( .A0(n17), .A1(DATA_V[5]), .B0(DATA[4]), .B1(n44), .Y(n21) );
  OAI2BB1X2M U41 ( .A0N(n15), .A1N(n56), .B0(n20), .Y(n31) );
  AOI22X1M U42 ( .A0(n17), .A1(DATA_V[6]), .B0(DATA[5]), .B1(n44), .Y(n20) );
  OAI2BB1X2M U43 ( .A0N(n15), .A1N(n57), .B0(n19), .Y(n30) );
  AOI22X1M U44 ( .A0(n17), .A1(DATA_V[7]), .B0(DATA[6]), .B1(n44), .Y(n19) );
  AO22X1M U45 ( .A0(n15), .A1(n59), .B0(DATA[7]), .B1(n44), .Y(n29) );
  OAI32X2M U46 ( .A0(n25), .A1(n48), .A2(n47), .B0(n26), .B1(n49), .Y(N25) );
  NAND2X2M U47 ( .A(ser_count[0]), .B(n49), .Y(n25) );
  AOI21X2M U48 ( .A0(Enable), .A1(n48), .B0(N23), .Y(n26) );
  INVX2M U49 ( .A(ser_count[2]), .Y(n49) );
  AND3X2M U50 ( .A(ser_count[0]), .B(ser_count[2]), .C(ser_count[1]), .Y(
        ser_done) );
  NOR2X2M U51 ( .A(n47), .B(ser_count[0]), .Y(N23) );
  NOR2X2M U52 ( .A(n27), .B(n47), .Y(N24) );
  CLKXOR2X2M U53 ( .A(n48), .B(n52), .Y(n27) );
  NOR2BX2M U54 ( .AN(Data_Valid), .B(Busy), .Y(n18) );
  INVX2M U55 ( .A(ser_count[1]), .Y(n48) );
  DLY1X1M U56 ( .A(ser_count[0]), .Y(n52) );
  DLY1X1M U57 ( .A(DATA_V[2]), .Y(n53) );
  DLY1X1M U58 ( .A(DATA_V[3]), .Y(n54) );
  DLY1X1M U59 ( .A(DATA_V[4]), .Y(n55) );
  DLY1X1M U60 ( .A(DATA_V[5]), .Y(n56) );
  DLY1X1M U61 ( .A(DATA_V[6]), .Y(n57) );
  DLY1X1M U62 ( .A(ser_out), .Y(n58) );
  DLY1X1M U63 ( .A(DATA_V[7]), .Y(n59) );
  DLY1X1M U64 ( .A(DATA_V[1]), .Y(n60) );
  SDFFRQX1M \ser_count_reg[1]  ( .D(N24), .SI(n52), .SE(test_se), .CK(CLK), 
        .RN(n45), .Q(ser_count[1]) );
  SDFFRQX1M \ser_count_reg[2]  ( .D(N25), .SI(n48), .SE(test_se), .CK(CLK), 
        .RN(n45), .Q(ser_count[2]) );
  SDFFRQX1M \DATA_V_reg[6]  ( .D(n30), .SI(n56), .SE(test_se), .CK(CLK), .RN(
        n45), .Q(DATA_V[6]) );
  SDFFRQX1M \DATA_V_reg[5]  ( .D(n31), .SI(n55), .SE(test_se), .CK(CLK), .RN(
        n45), .Q(DATA_V[5]) );
  SDFFRQX1M \DATA_V_reg[4]  ( .D(n32), .SI(n54), .SE(test_se), .CK(CLK), .RN(
        n45), .Q(DATA_V[4]) );
  SDFFRQX1M \DATA_V_reg[3]  ( .D(n33), .SI(n53), .SE(test_se), .CK(CLK), .RN(
        n45), .Q(DATA_V[3]) );
  SDFFRQX1M \DATA_V_reg[2]  ( .D(n34), .SI(n60), .SE(test_se), .CK(CLK), .RN(
        n45), .Q(DATA_V[2]) );
  SDFFRQX1M \DATA_V_reg[1]  ( .D(n35), .SI(n58), .SE(test_se), .CK(CLK), .RN(
        n45), .Q(DATA_V[1]) );
  SDFFRQX1M \DATA_V_reg[7]  ( .D(n29), .SI(n57), .SE(test_se), .CK(CLK), .RN(
        n45), .Q(DATA_V[7]) );
  SDFFRQX1M \DATA_V_reg[0]  ( .D(n28), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(n45), .Q(ser_out) );
endmodule


module mux_test_1 ( CLK, RST, IN_0, IN_1, IN_2, IN_3, SEL, OUT, test_si, 
        test_se );
  input [1:0] SEL;
  input CLK, RST, IN_0, IN_1, IN_2, IN_3, test_si, test_se;
  output OUT;
  wire   mux_out, n3, n4, n5;

  INVX2M U5 ( .A(SEL[0]), .Y(n5) );
  OAI2B2X1M U6 ( .A1N(SEL[1]), .A0(n3), .B0(SEL[1]), .B1(n4), .Y(mux_out) );
  AOI22X1M U7 ( .A0(IN_0), .A1(n5), .B0(SEL[0]), .B1(IN_1), .Y(n4) );
  AOI22X1M U8 ( .A0(IN_2), .A1(n5), .B0(IN_3), .B1(SEL[0]), .Y(n3) );
  SDFFRQX1M OUT_reg ( .D(mux_out), .SI(test_si), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(OUT) );
endmodule


module parity_calc_test_1 ( CLK, RST, parity_enable, parity_type, DATA, 
        Data_Valid, parity, test_si, test_se );
  input [7:0] DATA;
  input CLK, RST, parity_enable, parity_type, Data_Valid, test_si, test_se;
  output parity;
  wire   n51, n1, n3, n4, n5, n6, n8, n10, n12, n14, n16, n18, n20, n22, n24,
         n33, n34, n35, n36, n37, n38, n42, n43, n44, n45, n46, n47, n48, n49,
         n50;
  wire   [7:0] DATA_V;

  INVX4M U2 ( .A(n37), .Y(n36) );
  INVX2M U12 ( .A(RST), .Y(n37) );
  INVX4M U13 ( .A(n33), .Y(n34) );
  INVX4M U14 ( .A(n33), .Y(n35) );
  OAI2BB2X1M U15 ( .B0(n1), .B1(n38), .A0N(n42), .A1N(n38), .Y(n8) );
  INVX2M U16 ( .A(parity_enable), .Y(n38) );
  XOR3XLM U26 ( .A(n3), .B(parity_type), .C(n4), .Y(n1) );
  XOR3XLM U27 ( .A(DATA_V[1]), .B(DATA_V[0]), .C(n5), .Y(n4) );
  XNOR2X2M U28 ( .A(DATA_V[2]), .B(DATA_V[3]), .Y(n5) );
  XOR3XLM U29 ( .A(DATA_V[5]), .B(DATA_V[4]), .C(n6), .Y(n3) );
  CLKXOR2X2M U30 ( .A(DATA_V[7]), .B(DATA_V[6]), .Y(n6) );
  AO2B2X2M U31 ( .B0(n34), .B1(DATA[0]), .A0(n47), .A1N(n34), .Y(n10) );
  AO2B2X2M U32 ( .B0(DATA[1]), .B1(n35), .A0(n44), .A1N(n35), .Y(n12) );
  AO2B2X2M U33 ( .B0(DATA[2]), .B1(n34), .A0(n48), .A1N(n34), .Y(n14) );
  AO2B2X2M U34 ( .B0(DATA[3]), .B1(n35), .A0(n49), .A1N(n35), .Y(n16) );
  AO2B2X2M U35 ( .B0(DATA[4]), .B1(n34), .A0(n46), .A1N(n34), .Y(n18) );
  AO2B2X2M U36 ( .B0(DATA[5]), .B1(n35), .A0(n45), .A1N(n35), .Y(n20) );
  AO2B2X2M U37 ( .B0(DATA[6]), .B1(n34), .A0(n43), .A1N(n34), .Y(n22) );
  AO2B2X2M U38 ( .B0(DATA[7]), .B1(n35), .A0(n50), .A1N(n35), .Y(n24) );
  INVX2M U39 ( .A(Data_Valid), .Y(n33) );
  DLY1X1M U40 ( .A(n51), .Y(parity) );
  DLY1X1M U41 ( .A(n51), .Y(n42) );
  DLY1X1M U42 ( .A(DATA_V[6]), .Y(n43) );
  DLY1X1M U43 ( .A(DATA_V[1]), .Y(n44) );
  DLY1X1M U44 ( .A(DATA_V[5]), .Y(n45) );
  DLY1X1M U45 ( .A(DATA_V[4]), .Y(n46) );
  DLY1X1M U46 ( .A(DATA_V[0]), .Y(n47) );
  DLY1X1M U47 ( .A(DATA_V[2]), .Y(n48) );
  DLY1X1M U48 ( .A(DATA_V[3]), .Y(n49) );
  DLY1X1M U49 ( .A(DATA_V[7]), .Y(n50) );
  SDFFRQX1M \DATA_V_reg[7]  ( .D(n24), .SI(n43), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(DATA_V[7]) );
  SDFFRQX1M \DATA_V_reg[5]  ( .D(n20), .SI(n46), .SE(test_se), .CK(CLK), .RN(
        n36), .Q(DATA_V[5]) );
  SDFFRQX1M \DATA_V_reg[3]  ( .D(n16), .SI(n48), .SE(test_se), .CK(CLK), .RN(
        n36), .Q(DATA_V[3]) );
  SDFFRQX1M \DATA_V_reg[1]  ( .D(n12), .SI(n47), .SE(test_se), .CK(CLK), .RN(
        n36), .Q(DATA_V[1]) );
  SDFFRQX1M \DATA_V_reg[6]  ( .D(n22), .SI(n45), .SE(test_se), .CK(CLK), .RN(
        n36), .Q(DATA_V[6]) );
  SDFFRQX1M \DATA_V_reg[4]  ( .D(n18), .SI(n49), .SE(test_se), .CK(CLK), .RN(
        n36), .Q(DATA_V[4]) );
  SDFFRQX1M \DATA_V_reg[2]  ( .D(n14), .SI(n44), .SE(test_se), .CK(CLK), .RN(
        n36), .Q(DATA_V[2]) );
  SDFFRQX1M \DATA_V_reg[0]  ( .D(n10), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(n36), .Q(DATA_V[0]) );
  SDFFRQX1M parity_reg ( .D(n8), .SI(n50), .SE(test_se), .CK(CLK), .RN(n36), 
        .Q(n51) );
endmodule


module UART_TX_test_1 ( CLK, RST, P_DATA, Data_Valid, parity_enable, 
        parity_type, TX_OUT, busy, test_si, test_so, test_se );
  input [7:0] P_DATA;
  input CLK, RST, Data_Valid, parity_enable, parity_type, test_si, test_se;
  output TX_OUT, busy, test_so;
  wire   seriz_en, seriz_done, ser_data, parity, n1, n2, n3, n4, n5, n6, n7;
  wire   [1:0] mux_sel;
  assign test_so = parity;

  CLKINVX1M U1 ( .A(n5), .Y(n1) );
  INVXLM U3 ( .A(n5), .Y(n3) );
  INVX2M U4 ( .A(n5), .Y(n4) );
  INVX2M U5 ( .A(RST), .Y(n5) );
  uart_tx_fsm_test_1 U0_fsm ( .CLK(CLK), .RST(n2), .Data_Valid(Data_Valid), 
        .ser_done(seriz_done), .parity_enable(parity_enable), .Ser_enable(
        seriz_en), .mux_sel(mux_sel), .busy(busy), .test_si(n7), .test_so(n6), 
        .test_se(test_se) );
  Serializer_test_1 U0_Serializer ( .CLK(CLK), .RST(n3), .DATA(P_DATA), 
        .Enable(seriz_en), .Busy(busy), .Data_Valid(Data_Valid), .ser_out(
        ser_data), .ser_done(seriz_done), .test_si(test_si), .test_so(n7), 
        .test_se(test_se) );
  mux_test_1 U0_mux ( .CLK(CLK), .RST(n4), .IN_0(1'b0), .IN_1(ser_data), 
        .IN_2(parity), .IN_3(1'b1), .SEL(mux_sel), .OUT(TX_OUT), .test_si(n6), 
        .test_se(test_se) );
  parity_calc_test_1 U0_parity_calc ( .CLK(CLK), .RST(n1), .parity_enable(
        parity_enable), .parity_type(parity_type), .DATA(P_DATA), .Data_Valid(
        Data_Valid), .parity(parity), .test_si(TX_OUT), .test_se(test_se) );
  INVX2M U2 ( .A(n5), .Y(n2) );
endmodule


module uart_rx_fsm_test_1 ( CLK, RST, S_DATA, parity_enable, bit_count, 
        edge_count, par_err, stp_err, strt_glitch, strt_chk_en, edge_bit_en, 
        deser_en, par_chk_en, stp_chk_en, dat_samp_en, data_valid, test_so, 
        test_se );
  input [3:0] bit_count;
  input [2:0] edge_count;
  input CLK, RST, S_DATA, parity_enable, par_err, stp_err, strt_glitch,
         test_se;
  output strt_chk_en, edge_bit_en, deser_en, par_chk_en, stp_chk_en,
         dat_samp_en, data_valid, test_so;
  wire   n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n7, n24, n25, n26, n27, n28, n29, n31, n1, n2;
  wire   [2:0] current_state;
  wire   [2:0] next_state;
  assign test_so = n28;

  SDFFRQX2M \current_state_reg[2]  ( .D(next_state[2]), .SI(n27), .SE(test_se), 
        .CK(CLK), .RN(n25), .Q(current_state[2]) );
  SDFFRQX2M \current_state_reg[0]  ( .D(next_state[0]), .SI(strt_glitch), .SE(
        test_se), .CK(CLK), .RN(n25), .Q(current_state[0]) );
  NOR3BX2M U6 ( .AN(edge_count[1]), .B(n22), .C(bit_count[1]), .Y(n13) );
  INVX2M U7 ( .A(n13), .Y(n7) );
  INVX2M U8 ( .A(n7), .Y(n24) );
  NOR4BBX2M U9 ( .AN(strt_glitch), .BN(n24), .C(bit_count[3]), .D(bit_count[0]), .Y(n23) );
  NOR3X2M U10 ( .A(bit_count[0]), .B(strt_glitch), .C(bit_count[3]), .Y(n16)
         );
  NAND3BX2M U11 ( .AN(bit_count[2]), .B(edge_count[0]), .C(edge_count[2]), .Y(
        n22) );
  OAI21X2M U12 ( .A0(current_state[2]), .A1(n15), .B0(n9), .Y(next_state[1])
         );
  AND4XLM U13 ( .A(n21), .B(bit_count[3]), .C(bit_count[1]), .D(stp_chk_en), 
        .Y(n20) );
  NAND3BX1M U18 ( .AN(bit_count[0]), .B(n24), .C(bit_count[3]), .Y(n14) );
  OAI21X4M U19 ( .A0(current_state[0]), .A1(n29), .B0(n28), .Y(n8) );
  INVX2M U20 ( .A(n2), .Y(n27) );
  BUFX2M U21 ( .A(RST), .Y(n25) );
  NAND2X2M U22 ( .A(n9), .B(n8), .Y(edge_bit_en) );
  INVX2M U23 ( .A(S_DATA), .Y(n29) );
  NAND2X2M U24 ( .A(n27), .B(n8), .Y(dat_samp_en) );
  NOR2X4M U25 ( .A(n28), .B(n9), .Y(stp_chk_en) );
  NOR3X4M U26 ( .A(n28), .B(n2), .C(n26), .Y(data_valid) );
  INVX4M U27 ( .A(current_state[0]), .Y(n26) );
  INVX4M U28 ( .A(current_state[2]), .Y(n28) );
  NAND4BBX1M U29 ( .AN(n10), .BN(stp_chk_en), .C(n11), .D(n12), .Y(
        next_state[2]) );
  NAND4BX1M U30 ( .AN(n9), .B(bit_count[3]), .C(bit_count[0]), .D(n24), .Y(n11) );
  NOR3BX2M U31 ( .AN(deser_en), .B(parity_enable), .C(n14), .Y(n10) );
  NOR2X2M U32 ( .A(current_state[2]), .B(n9), .Y(par_chk_en) );
  NOR2X2M U33 ( .A(n2), .B(n8), .Y(strt_chk_en) );
  OAI22X1M U34 ( .A0(current_state[0]), .A1(S_DATA), .B0(n23), .B1(n26), .Y(
        n19) );
  OAI211X2M U35 ( .A0(n26), .A1(n12), .B0(n17), .C0(n18), .Y(next_state[0]) );
  AOI31X2M U36 ( .A0(n27), .A1(n28), .A2(n19), .B0(n20), .Y(n17) );
  AOI22X1M U37 ( .A0(deser_en), .A1(n14), .B0(data_valid), .B1(n29), .Y(n18)
         );
  NAND2X4M U38 ( .A(n2), .B(n26), .Y(n9) );
  AOI31X1M U39 ( .A0(current_state[0]), .A1(n24), .A2(n16), .B0(n2), .Y(n15)
         );
  NOR3X6M U40 ( .A(n26), .B(current_state[2]), .C(n31), .Y(deser_en) );
  OR4X1M U41 ( .A(n27), .B(n28), .C(stp_err), .D(par_err), .Y(n12) );
  SDFFSRX1M \current_state_reg[1]  ( .D(next_state[1]), .SI(n26), .SE(test_se), 
        .CK(CLK), .SN(1'b1), .RN(RST), .Q(current_state[1]), .QN(n31) );
  INVXLM U3 ( .A(current_state[1]), .Y(n1) );
  INVX4M U4 ( .A(n1), .Y(n2) );
  NOR3X1M U5 ( .A(edge_count[1]), .B(bit_count[0]), .C(n22), .Y(n21) );
endmodule


module edge_bit_counter_test_1 ( CLK, RST, Enable, bit_count, edge_count, 
        test_si, test_se );
  output [3:0] bit_count;
  output [2:0] edge_count;
  input CLK, RST, Enable, test_si, test_se;
  wire   n43, n44, n45, n46, n47, N13, N14, n11, n16, n17, n18, n19, n20, n21,
         n23, n24, n25, n26, n27, n8, n9, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n1, n3, n5, n7, n12;

  SDFFRQX2M \bit_count_reg[2]  ( .D(n37), .SI(n39), .SE(test_se), .CK(CLK), 
        .RN(n33), .Q(bit_count[2]) );
  OR2X4M U10 ( .A(n32), .B(n9), .Y(n8) );
  OR2X2M U11 ( .A(n30), .B(n31), .Y(n9) );
  AOI32X1M U12 ( .A0(n8), .A1(edge_count[0]), .A2(edge_count[1]), .B0(
        edge_count[2]), .B1(n8), .Y(n23) );
  AOI32X1M U13 ( .A0(bit_count[1]), .A1(n40), .A2(n18), .B0(n19), .B1(
        bit_count[2]), .Y(n20) );
  NAND4X2M U14 ( .A(bit_count[2]), .B(bit_count[1]), .C(n18), .D(n11), .Y(n17)
         );
  INVX2M U24 ( .A(n8), .Y(n35) );
  NOR2X1M U25 ( .A(edge_count[1]), .B(n41), .Y(n30) );
  NOR2X1M U26 ( .A(edge_count[0]), .B(n41), .Y(n31) );
  NOR2X1M U27 ( .A(edge_count[2]), .B(n41), .Y(n32) );
  NOR3X6M U28 ( .A(n41), .B(n8), .C(n38), .Y(n18) );
  INVX4M U29 ( .A(Enable), .Y(n41) );
  INVX4M U30 ( .A(n34), .Y(n33) );
  INVX2M U31 ( .A(RST), .Y(n34) );
  AOI21X2M U32 ( .A0(n38), .A1(Enable), .B0(n8), .Y(n21) );
  OAI32X2M U33 ( .A0(n41), .A1(bit_count[0]), .A2(n8), .B0(n38), .B1(n35), .Y(
        n27) );
  OAI21X2M U34 ( .A0(bit_count[1]), .A1(n41), .B0(n21), .Y(n19) );
  OAI21X2M U35 ( .A0(n16), .A1(n11), .B0(n17), .Y(n25) );
  AOI21X2M U36 ( .A0(Enable), .A1(n40), .B0(n19), .Y(n16) );
  NOR2X2M U37 ( .A(n24), .B(n35), .Y(N14) );
  XNOR2X2M U38 ( .A(edge_count[1]), .B(edge_count[0]), .Y(n24) );
  NOR2X2M U39 ( .A(edge_count[0]), .B(n35), .Y(N13) );
  INVX2M U40 ( .A(n23), .Y(n36) );
  INVX2M U41 ( .A(n20), .Y(n37) );
  OAI2BB2X1M U42 ( .B0(n21), .B1(n39), .A0N(n39), .A1N(n18), .Y(n26) );
  INVX2M U44 ( .A(bit_count[2]), .Y(n40) );
  SDFFSRX2M \bit_count_reg[3]  ( .D(n25), .SI(n40), .SE(test_se), .CK(CLK), 
        .SN(1'b1), .RN(RST), .Q(n43), .QN(n11) );
  SDFFSRX2M \bit_count_reg[0]  ( .D(n27), .SI(test_si), .SE(test_se), .CK(CLK), 
        .SN(1'b1), .RN(n33), .Q(n45), .QN(n38) );
  SDFFSRX2M \bit_count_reg[1]  ( .D(n26), .SI(bit_count[0]), .SE(test_se), 
        .CK(CLK), .SN(1'b1), .RN(n33), .Q(n44), .QN(n39) );
  SDFFSRX4M \edge_count_reg[1]  ( .D(N14), .SI(edge_count[0]), .SE(test_se), 
        .CK(CLK), .SN(1'b1), .RN(n33), .Q(edge_count[1]) );
  SDFFSRX1M \edge_count_reg[0]  ( .D(N13), .SI(n11), .SE(test_se), .CK(CLK), 
        .SN(1'b1), .RN(n33), .Q(n47) );
  SDFFSRX1M \edge_count_reg[2]  ( .D(n36), .SI(edge_count[1]), .SE(test_se), 
        .CK(CLK), .SN(1'b1), .RN(n33), .Q(n46) );
  INVXLM U3 ( .A(n44), .Y(n1) );
  INVX4M U4 ( .A(n1), .Y(bit_count[1]) );
  INVXLM U5 ( .A(n43), .Y(n3) );
  INVX4M U6 ( .A(n3), .Y(bit_count[3]) );
  INVXLM U7 ( .A(n45), .Y(n5) );
  INVX4M U8 ( .A(n5), .Y(bit_count[0]) );
  INVXLM U9 ( .A(n46), .Y(n7) );
  INVX4M U15 ( .A(n7), .Y(edge_count[2]) );
  INVXLM U16 ( .A(n47), .Y(n12) );
  INVX4M U17 ( .A(n12), .Y(edge_count[0]) );
endmodule


module data_sampling_test_1 ( CLK, RST, S_DATA, Prescale, edge_count, Enable, 
        sampled_bit, test_si, test_se );
  input [4:0] Prescale;
  input [2:0] edge_count;
  input CLK, RST, S_DATA, Enable, test_si, test_se;
  output sampled_bit;
  wire   N58, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n40, n41, n42, n43, n44,
         n5, n6, n11, n12, n13, n14, n15, n16, n46;
  wire   [2:0] Samples;

  SDFFRQX2M sampled_bit_reg ( .D(N58), .SI(n46), .SE(test_se), .CK(CLK), .RN(
        n6), .Q(sampled_bit) );
  SDFFRQX2M \Samples_reg[1]  ( .D(n43), .SI(n12), .SE(test_se), .CK(CLK), .RN(
        n6), .Q(Samples[1]) );
  SDFFRQX2M \Samples_reg[0]  ( .D(n42), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(n6), .Q(Samples[0]) );
  OAI21X2M U7 ( .A0(Samples[0]), .A1(Samples[1]), .B0(Samples[2]), .Y(n41) );
  NAND2XLM U8 ( .A(Samples[1]), .B(Samples[0]), .Y(n40) );
  XNOR2X4M U9 ( .A(Prescale[1]), .B(edge_count[0]), .Y(n21) );
  CLKXOR2X2M U14 ( .A(n37), .B(Prescale[3]), .Y(n25) );
  XOR3XLM U15 ( .A(n26), .B(edge_count[2]), .C(n25), .Y(n19) );
  BUFX2M U16 ( .A(RST), .Y(n6) );
  INVX2M U17 ( .A(Enable), .Y(n15) );
  CLKXOR2X2M U18 ( .A(n23), .B(n24), .Y(n20) );
  NOR2X2M U19 ( .A(n25), .B(n26), .Y(n24) );
  INVX2M U20 ( .A(n25), .Y(n16) );
  NOR2X2M U21 ( .A(n16), .B(n35), .Y(n36) );
  NAND2X2M U22 ( .A(S_DATA), .B(Enable), .Y(n17) );
  OAI32X2M U23 ( .A0(n12), .A1(n14), .A2(n15), .B0(n17), .B1(n18), .Y(n42) );
  INVX2M U24 ( .A(Samples[0]), .Y(n12) );
  INVX2M U25 ( .A(n18), .Y(n14) );
  NAND4X2M U26 ( .A(n19), .B(n20), .C(n21), .D(n22), .Y(n18) );
  OAI32X2M U27 ( .A0(n11), .A1(n13), .A2(n15), .B0(n17), .B1(n27), .Y(n43) );
  INVX2M U28 ( .A(Samples[1]), .Y(n11) );
  INVX2M U29 ( .A(n27), .Y(n13) );
  NAND4BX2M U30 ( .AN(n21), .B(n28), .C(n23), .D(n29), .Y(n27) );
  AOI21X4M U31 ( .A0(Prescale[1]), .A1(Prescale[2]), .B0(n37), .Y(n30) );
  CLKXOR2X2M U32 ( .A(n38), .B(Prescale[4]), .Y(n23) );
  NAND2BX2M U33 ( .AN(Prescale[3]), .B(n37), .Y(n38) );
  CLKXOR2X2M U34 ( .A(n5), .B(edge_count[1]), .Y(n22) );
  AND2X2M U35 ( .A(n35), .B(n26), .Y(n5) );
  NOR2X4M U36 ( .A(Prescale[2]), .B(Prescale[1]), .Y(n37) );
  CLKXOR2X2M U38 ( .A(n16), .B(edge_count[2]), .Y(n28) );
  NAND2X2M U39 ( .A(n30), .B(Prescale[1]), .Y(n26) );
  OAI2BB2X1M U40 ( .B0(n31), .B1(n17), .A0N(n46), .A1N(n31), .Y(n44) );
  AND2X2M U41 ( .A(n32), .B(Enable), .Y(n31) );
  NAND4BX1M U42 ( .AN(n22), .B(n33), .C(n34), .D(n21), .Y(n32) );
  CLKXOR2X2M U43 ( .A(n23), .B(n36), .Y(n33) );
  OR2X2M U44 ( .A(Prescale[1]), .B(n30), .Y(n35) );
  XOR3XLM U45 ( .A(edge_count[2]), .B(n35), .C(n25), .Y(n34) );
  AOI21X2M U46 ( .A0(n40), .A1(n41), .B0(n15), .Y(N58) );
  DLY1X1M U47 ( .A(Samples[2]), .Y(n46) );
  SDFFSRX2M \Samples_reg[2]  ( .D(n44), .SI(n11), .SE(test_se), .CK(CLK), .SN(
        1'b1), .RN(n6), .Q(Samples[2]) );
  XOR2X1M U3 ( .A(edge_count[1]), .B(n30), .Y(n29) );
endmodule


module deserializer_test_1 ( CLK, RST, sampled_bit, Enable, edge_count, P_DATA, 
        test_so, test_se );
  input [2:0] edge_count;
  output [7:0] P_DATA;
  input CLK, RST, sampled_bit, Enable, test_se;
  output test_so;
  wire   n1, n11, n13, n15, n17, n19, n21, n23, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36;
  assign test_so = n29;

  SDFFRQX2M \P_DATA_reg[6]  ( .D(n23), .SI(n31), .SE(test_se), .CK(CLK), .RN(
        n27), .Q(P_DATA[6]) );
  SDFFRQX2M \P_DATA_reg[2]  ( .D(n15), .SI(n35), .SE(test_se), .CK(CLK), .RN(
        n27), .Q(P_DATA[2]) );
  SDFFRQX2M \P_DATA_reg[4]  ( .D(n19), .SI(n33), .SE(test_se), .CK(CLK), .RN(
        n27), .Q(P_DATA[4]) );
  SDFFRQX2M \P_DATA_reg[5]  ( .D(n21), .SI(n32), .SE(test_se), .CK(CLK), .RN(
        n27), .Q(P_DATA[5]) );
  SDFFRQX2M \P_DATA_reg[1]  ( .D(n13), .SI(P_DATA[0]), .SE(test_se), .CK(CLK), 
        .RN(n27), .Q(P_DATA[1]) );
  SDFFRQX2M \P_DATA_reg[7]  ( .D(n25), .SI(n30), .SE(test_se), .CK(CLK), .RN(
        n27), .Q(P_DATA[7]) );
  SDFFRQX2M \P_DATA_reg[3]  ( .D(n17), .SI(n34), .SE(test_se), .CK(CLK), .RN(
        n27), .Q(P_DATA[3]) );
  SDFFRQX2M \P_DATA_reg[0]  ( .D(n11), .SI(sampled_bit), .SE(test_se), .CK(CLK), .RN(n27), .Q(P_DATA[0]) );
  INVX4M U11 ( .A(n28), .Y(n27) );
  INVX2M U12 ( .A(RST), .Y(n28) );
  INVX4M U13 ( .A(n26), .Y(n36) );
  OAI22X1M U14 ( .A0(n36), .A1(n35), .B0(n26), .B1(n34), .Y(n13) );
  OAI22X1M U15 ( .A0(n36), .A1(n34), .B0(n26), .B1(n33), .Y(n15) );
  OAI22X1M U16 ( .A0(n36), .A1(n33), .B0(n26), .B1(n32), .Y(n17) );
  OAI22X1M U17 ( .A0(n36), .A1(n32), .B0(n26), .B1(n31), .Y(n19) );
  OAI22X1M U18 ( .A0(n36), .A1(n31), .B0(n26), .B1(n30), .Y(n21) );
  OAI22X1M U27 ( .A0(n36), .A1(n30), .B0(n26), .B1(n29), .Y(n23) );
  OAI2BB2X1M U28 ( .B0(n36), .B1(n29), .A0N(sampled_bit), .A1N(n36), .Y(n25)
         );
  CLKBUFX6M U29 ( .A(n1), .Y(n26) );
  OAI2BB2X1M U30 ( .B0(n26), .B1(n35), .A0N(P_DATA[0]), .A1N(n26), .Y(n11) );
  INVX2M U31 ( .A(P_DATA[2]), .Y(n34) );
  INVX2M U32 ( .A(P_DATA[6]), .Y(n30) );
  INVX2M U33 ( .A(P_DATA[7]), .Y(n29) );
  INVX2M U34 ( .A(P_DATA[3]), .Y(n33) );
  INVX2M U35 ( .A(P_DATA[1]), .Y(n35) );
  INVX2M U36 ( .A(P_DATA[4]), .Y(n32) );
  INVX2M U37 ( .A(P_DATA[5]), .Y(n31) );
  NAND4X1M U2 ( .A(edge_count[2]), .B(edge_count[1]), .C(edge_count[0]), .D(
        Enable), .Y(n1) );
endmodule


module strt_chk_test_1 ( CLK, RST, sampled_bit, Enable, strt_glitch, test_si, 
        test_se );
  input CLK, RST, sampled_bit, Enable, test_si, test_se;
  output strt_glitch;
  wire   n2;

  SDFFRQX2M strt_glitch_reg ( .D(n2), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(strt_glitch) );
  AO2B2X1M U2 ( .B0(sampled_bit), .B1(Enable), .A0(strt_glitch), .A1N(Enable), 
        .Y(n2) );
endmodule


module par_chk_test_1 ( CLK, RST, parity_type, sampled_bit, Enable, P_DATA, 
        par_err, test_si, test_se );
  input [7:0] P_DATA;
  input CLK, RST, parity_type, sampled_bit, Enable, test_si, test_se;
  output par_err;
  wire   n1, n3, n4, n5, n6, n7, n9, n10;

  SDFFRQX2M par_err_reg ( .D(n9), .SI(test_si), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(par_err) );
  XNOR2X2M U2 ( .A(P_DATA[3]), .B(P_DATA[2]), .Y(n7) );
  XNOR2X2M U3 ( .A(P_DATA[7]), .B(P_DATA[6]), .Y(n6) );
  XNOR2X1M U4 ( .A(sampled_bit), .B(parity_type), .Y(n5) );
  OAI2BB2X1M U6 ( .B0(n1), .B1(n10), .A0N(par_err), .A1N(n10), .Y(n9) );
  INVX2M U7 ( .A(Enable), .Y(n10) );
  XOR3XLM U8 ( .A(n3), .B(n4), .C(n5), .Y(n1) );
  XOR3XLM U9 ( .A(P_DATA[5]), .B(P_DATA[4]), .C(n6), .Y(n4) );
  XOR3XLM U11 ( .A(P_DATA[1]), .B(P_DATA[0]), .C(n7), .Y(n3) );
endmodule


module stp_chk_test_1 ( CLK, RST, sampled_bit, Enable, stp_err, test_si, 
        test_se );
  input CLK, RST, sampled_bit, Enable, test_si, test_se;
  output stp_err;
  wire   n3, n4;

  SDFFRQX2M stp_err_reg ( .D(n3), .SI(test_si), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(stp_err) );
  OAI2BB2X1M U2 ( .B0(sampled_bit), .B1(n4), .A0N(stp_err), .A1N(n4), .Y(n3)
         );
  INVX2M U5 ( .A(Enable), .Y(n4) );
endmodule


module UART_RX_test_1 ( CLK, RST, RX_IN, Prescale, parity_enable, parity_type, 
        P_DATA, data_valid, parity_error, framing_error, test_si2, test_si1, 
        test_so1, test_se );
  input [4:0] Prescale;
  output [7:0] P_DATA;
  input CLK, RST, RX_IN, parity_enable, parity_type, test_si2, test_si1,
         test_se;
  output data_valid, parity_error, framing_error, test_so1;
  wire   strt_glitch, strt_chk_en, edge_bit_en, deser_en, par_chk_en,
         stp_chk_en, dat_samp_en, sampled_bit, n1, n2, n4, n8, n9, n10, n11;
  wire   [3:0] bit_count;
  wire   [2:0] edge_count;

  INVX4M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(RST), .Y(n2) );
  DLY1X1M U3 ( .A(sampled_bit), .Y(n8) );
  DLY1X1M U4 ( .A(sampled_bit), .Y(n9) );
  DLY1X1M U5 ( .A(sampled_bit), .Y(n10) );
  DLY1X1M U6 ( .A(sampled_bit), .Y(n11) );
  uart_rx_fsm_test_1 U0_uart_fsm ( .CLK(CLK), .RST(n1), .S_DATA(RX_IN), 
        .parity_enable(parity_enable), .bit_count(bit_count), .edge_count(
        edge_count), .par_err(parity_error), .stp_err(framing_error), 
        .strt_glitch(strt_glitch), .strt_chk_en(strt_chk_en), .edge_bit_en(
        edge_bit_en), .deser_en(deser_en), .par_chk_en(par_chk_en), 
        .stp_chk_en(stp_chk_en), .dat_samp_en(dat_samp_en), .data_valid(
        data_valid), .test_so(test_so1), .test_se(test_se) );
  edge_bit_counter_test_1 U0_edge_bit_counter ( .CLK(CLK), .RST(n1), .Enable(
        edge_bit_en), .bit_count(bit_count), .edge_count(edge_count), 
        .test_si(n4), .test_se(test_se) );
  data_sampling_test_1 U0_data_sampling ( .CLK(CLK), .RST(n1), .S_DATA(RX_IN), 
        .Prescale(Prescale), .edge_count(edge_count), .Enable(dat_samp_en), 
        .sampled_bit(sampled_bit), .test_si(test_si1), .test_se(test_se) );
  deserializer_test_1 U0_deserializer ( .CLK(CLK), .RST(n1), .sampled_bit(n11), 
        .Enable(deser_en), .edge_count(edge_count), .P_DATA(P_DATA), .test_so(
        n4), .test_se(test_se) );
  strt_chk_test_1 U0_strt_chk ( .CLK(CLK), .RST(n1), .sampled_bit(n10), 
        .Enable(strt_chk_en), .strt_glitch(strt_glitch), .test_si(parity_error), .test_se(test_se) );
  par_chk_test_1 U0_par_chk ( .CLK(CLK), .RST(n1), .parity_type(parity_type), 
        .sampled_bit(n8), .Enable(par_chk_en), .P_DATA(P_DATA), .par_err(
        parity_error), .test_si(edge_count[2]), .test_se(test_se) );
  stp_chk_test_1 U0_stp_chk ( .CLK(CLK), .RST(n1), .sampled_bit(n9), .Enable(
        stp_chk_en), .stp_err(framing_error), .test_si(test_si2), .test_se(
        test_se) );
endmodule


module UART_test_1 ( RST, TX_CLK, RX_CLK, RX_IN_S, RX_OUT_P, RX_OUT_V, TX_IN_P, 
        TX_IN_V, TX_OUT_S, TX_OUT_V, Prescale, parity_enable, parity_type, 
        parity_error, framing_error, test_si2, test_si1, test_so1, test_se );
  output [7:0] RX_OUT_P;
  input [7:0] TX_IN_P;
  input [4:0] Prescale;
  input RST, TX_CLK, RX_CLK, RX_IN_S, TX_IN_V, parity_enable, parity_type,
         test_si2, test_si1, test_se;
  output RX_OUT_V, TX_OUT_S, TX_OUT_V, parity_error, framing_error, test_so1;
  wire   n1, n2, n4;

  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(RST), .Y(n2) );
  UART_TX_test_1 U0_UART_TX ( .CLK(TX_CLK), .RST(n1), .P_DATA(TX_IN_P), 
        .Data_Valid(TX_IN_V), .parity_enable(parity_enable), .parity_type(
        parity_type), .TX_OUT(TX_OUT_S), .busy(TX_OUT_V), .test_si(n4), 
        .test_so(test_so1), .test_se(test_se) );
  UART_RX_test_1 U0_UART_RX ( .CLK(RX_CLK), .RST(n1), .RX_IN(RX_IN_S), 
        .Prescale(Prescale), .parity_enable(parity_enable), .parity_type(
        parity_type), .P_DATA(RX_OUT_P), .data_valid(RX_OUT_V), .parity_error(
        parity_error), .framing_error(framing_error), .test_si2(test_si2), 
        .test_si1(test_si1), .test_so1(n4), .test_se(test_se) );
endmodule


module CTRL_RX_test_1 ( CLK, RST, RF_RdData, RF_RdData_VLD, ALU_OUT, 
        ALU_OUT_VLD, UART_RX_DATA, UART_RX_VLD, ALU_EN, ALU_FUN, CLKG_EN, 
        CLKDIV_EN, RF_WrEn, RF_RdEn, RF_Address, RF_WrData, UART_RF_SEND, 
        UART_ALU_SEND, UART_SEND_RF_DATA, UART_SEND_ALU_DATA, test_si, test_so, 
        test_se );
  input [7:0] RF_RdData;
  input [15:0] ALU_OUT;
  input [7:0] UART_RX_DATA;
  output [3:0] ALU_FUN;
  output [3:0] RF_Address;
  output [7:0] RF_WrData;
  output [7:0] UART_SEND_RF_DATA;
  output [15:0] UART_SEND_ALU_DATA;
  input CLK, RST, RF_RdData_VLD, ALU_OUT_VLD, UART_RX_VLD, test_si, test_se;
  output ALU_EN, CLKG_EN, CLKDIV_EN, RF_WrEn, RF_RdEn, UART_RF_SEND,
         UART_ALU_SEND, test_so;
  wire   n155, n45, n46, n47, n48, n57, n58, n59, n60, n61, n62, n63, n64, n65,
         n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79,
         n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93,
         n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n129, n131,
         n132, n133, n134, n135, n136, n137, n138, n139, n140, n141, n142,
         n143, n144, n145, n146, n147, n148, n149, n150, n151, n152, n153,
         n154, n156, n157, n158, n159, n162, n163, n164, n165, n166, n167,
         n168, n169, n170, n171, n172, n173, n174, n175, n176, n177, n178,
         n179, n180, n181, n182, n183, n184, n185, n186;
  wire   [3:0] current_state;
  wire   [3:0] next_state;
  assign test_so = n145;

  NOR2X12M U101 ( .A(n85), .B(n45), .Y(RF_Address[3]) );
  NOR2X12M U102 ( .A(n85), .B(n46), .Y(RF_Address[2]) );
  SDFFRX1M \RF_ADDR_REG_reg[3]  ( .D(n114), .SI(n157), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(n156), .QN(n45) );
  SDFFRX1M \RF_ADDR_REG_reg[2]  ( .D(n113), .SI(n158), .SE(test_se), .CK(CLK), 
        .RN(n132), .Q(n157), .QN(n46) );
  SDFFRX1M \RF_ADDR_REG_reg[1]  ( .D(n112), .SI(n159), .SE(test_se), .CK(CLK), 
        .RN(n132), .Q(n158), .QN(n47) );
  SDFFRX1M \RF_ADDR_REG_reg[0]  ( .D(n111), .SI(test_si), .SE(test_se), .CK(
        CLK), .RN(n132), .Q(n159), .QN(n48) );
  NOR2X8M U37 ( .A(n151), .B(n59), .Y(ALU_FUN[2]) );
  NOR4X6M U38 ( .A(n144), .B(n146), .C(current_state[0]), .D(current_state[3]), 
        .Y(RF_RdEn) );
  NAND4X2M U41 ( .A(UART_RX_DATA[4]), .B(UART_RX_DATA[2]), .C(UART_RX_DATA[6]), 
        .D(n74), .Y(n58) );
  NOR2X1M U42 ( .A(UART_RX_DATA[6]), .B(UART_RX_DATA[2]), .Y(n78) );
  NAND4X1M U43 ( .A(UART_RX_DATA[2]), .B(n142), .C(UART_RX_DATA[6]), .D(n77), 
        .Y(n76) );
  NOR3X4M U44 ( .A(current_state[1]), .B(current_state[2]), .C(n145), .Y(n86)
         );
  NOR2X4M U45 ( .A(current_state[0]), .B(current_state[2]), .Y(n61) );
  NOR4X4M U46 ( .A(n162), .B(n139), .C(current_state[2]), .D(current_state[3]), 
        .Y(n84) );
  AND4X1M U47 ( .A(UART_RX_DATA[5]), .B(UART_RX_DATA[1]), .C(n78), .D(n142), 
        .Y(n70) );
  INVX2M U48 ( .A(current_state[1]), .Y(n144) );
  OAI22X1M U49 ( .A0(current_state[2]), .A1(UART_RX_VLD), .B0(current_state[0]), .B1(RF_RdData_VLD), .Y(n71) );
  CLKINVX2M U50 ( .A(current_state[0]), .Y(n139) );
  NOR2X6M U83 ( .A(n153), .B(n59), .Y(ALU_FUN[0]) );
  NOR2X4M U84 ( .A(n152), .B(n59), .Y(ALU_FUN[1]) );
  NOR2X4M U85 ( .A(n59), .B(n154), .Y(ALU_EN) );
  INVX2M U86 ( .A(UART_RX_DATA[3]), .Y(n150) );
  OAI21X2M U87 ( .A0(UART_RX_VLD), .A1(n62), .B0(n76), .Y(n68) );
  NAND2X2M U88 ( .A(current_state[1]), .B(n61), .Y(n69) );
  CLKBUFX8M U89 ( .A(n134), .Y(n133) );
  CLKBUFX8M U90 ( .A(n134), .Y(n132) );
  BUFX2M U91 ( .A(RST), .Y(n134) );
  BUFX4M U92 ( .A(n83), .Y(n129) );
  INVX8M U93 ( .A(UART_ALU_SEND), .Y(n141) );
  INVX2M U94 ( .A(n75), .Y(n142) );
  INVX2M U95 ( .A(n63), .Y(n137) );
  NOR2X2M U96 ( .A(n150), .B(n59), .Y(ALU_FUN[3]) );
  NOR2X6M U97 ( .A(n84), .B(RF_RdEn), .Y(n85) );
  NAND2X2M U98 ( .A(n86), .B(n139), .Y(n57) );
  NOR2X2M U99 ( .A(n129), .B(n154), .Y(RF_WrEn) );
  AND3X2M U100 ( .A(n57), .B(n62), .C(n138), .Y(n83) );
  INVX2M U103 ( .A(n84), .Y(n138) );
  NOR2X2M U104 ( .A(n129), .B(n153), .Y(RF_WrData[0]) );
  NOR2X2M U105 ( .A(n83), .B(n152), .Y(RF_WrData[1]) );
  NOR2X2M U106 ( .A(n129), .B(n149), .Y(RF_WrData[4]) );
  NOR2X2M U107 ( .A(n129), .B(n148), .Y(RF_WrData[7]) );
  INVX4M U108 ( .A(n131), .Y(n143) );
  INVX2M U109 ( .A(n81), .Y(n136) );
  BUFX10M U110 ( .A(n155), .Y(UART_ALU_SEND) );
  NOR3X2M U111 ( .A(n69), .B(n145), .C(n147), .Y(n155) );
  NAND2X2M U112 ( .A(n82), .B(n144), .Y(n63) );
  NAND4X2M U113 ( .A(n79), .B(n145), .C(n61), .D(n144), .Y(n75) );
  NOR3X2M U114 ( .A(n154), .B(n150), .C(n148), .Y(n79) );
  NOR2X2M U115 ( .A(n129), .B(n150), .Y(RF_WrData[3]) );
  NOR2X2M U116 ( .A(n129), .B(n151), .Y(RF_WrData[2]) );
  INVX2M U117 ( .A(n131), .Y(UART_RF_SEND) );
  INVX2M U118 ( .A(n69), .Y(n140) );
  NAND2X6M U119 ( .A(current_state[0]), .B(n86), .Y(n59) );
  INVX4M U120 ( .A(current_state[3]), .Y(n145) );
  INVX4M U121 ( .A(UART_RX_DATA[0]), .Y(n153) );
  INVX2M U122 ( .A(UART_RX_DATA[1]), .Y(n152) );
  INVX2M U123 ( .A(UART_RX_DATA[2]), .Y(n151) );
  INVX2M U124 ( .A(current_state[2]), .Y(n146) );
  NOR2X2M U125 ( .A(n85), .B(n47), .Y(RF_Address[1]) );
  OAI21X2M U126 ( .A0(n85), .A1(n48), .B0(n57), .Y(RF_Address[0]) );
  NOR3X4M U127 ( .A(n139), .B(current_state[3]), .C(n146), .Y(n82) );
  NAND2X2M U128 ( .A(current_state[1]), .B(n82), .Y(n62) );
  OAI21X6M U129 ( .A0(n65), .A1(n137), .B0(UART_RX_VLD), .Y(n81) );
  AOI31X2M U130 ( .A0(n70), .A1(UART_RX_DATA[0]), .A2(UART_RX_DATA[4]), .B0(
        n68), .Y(n64) );
  OAI2B11X2M U131 ( .A1N(RF_RdEn), .A0(RF_RdData_VLD), .B0(n63), .C0(n64), .Y(
        next_state[2]) );
  NOR2X4M U132 ( .A(n69), .B(current_state[3]), .Y(n65) );
  NOR2BX2M U133 ( .AN(UART_RX_DATA[5]), .B(n129), .Y(RF_WrData[5]) );
  NOR2BX2M U134 ( .AN(UART_RX_DATA[6]), .B(n83), .Y(RF_WrData[6]) );
  NAND4BX1M U135 ( .AN(n72), .B(n64), .C(n73), .D(n58), .Y(next_state[0]) );
  OAI2B1X2M U136 ( .A1N(n57), .A0(n65), .B0(UART_RX_VLD), .Y(n73) );
  AOI31X2M U137 ( .A0(n138), .A1(n59), .A2(n63), .B0(UART_RX_VLD), .Y(n72) );
  OAI22X1M U138 ( .A0(n153), .A1(n81), .B0(n136), .B1(n48), .Y(n111) );
  OAI22X1M U139 ( .A0(n152), .A1(n81), .B0(n136), .B1(n47), .Y(n112) );
  OAI22X1M U140 ( .A0(n151), .A1(n81), .B0(n136), .B1(n46), .Y(n113) );
  OAI22X1M U141 ( .A0(n150), .A1(n81), .B0(n136), .B1(n45), .Y(n114) );
  INVX2M U142 ( .A(UART_RX_VLD), .Y(n154) );
  NAND4BBX1M U143 ( .AN(n65), .BN(ALU_EN), .C(n66), .D(n67), .Y(next_state[1])
         );
  AOI33X2M U144 ( .A0(n153), .A1(n149), .A2(n70), .B0(n71), .B1(n145), .B2(
        current_state[1]), .Y(n66) );
  AOI221X2M U145 ( .A0(n140), .A1(n147), .B0(n137), .B1(UART_RX_VLD), .C0(n68), 
        .Y(n67) );
  CLKBUFX6M U146 ( .A(n80), .Y(n131) );
  NAND2X2M U147 ( .A(RF_RdData_VLD), .B(RF_RdEn), .Y(n80) );
  NAND4X2M U148 ( .A(n57), .B(n58), .C(n59), .D(n60), .Y(next_state[3]) );
  AOI32X1M U149 ( .A0(n61), .A1(n147), .A2(current_state[3]), .B0(n135), .B1(
        UART_RX_VLD), .Y(n60) );
  INVX2M U150 ( .A(n62), .Y(n135) );
  AO22X1M U151 ( .A0(RF_RdData[0]), .A1(n143), .B0(n131), .B1(n163), .Y(n103)
         );
  AO22X1M U152 ( .A0(RF_RdData[1]), .A1(n143), .B0(n131), .B1(n164), .Y(n104)
         );
  AO22X1M U153 ( .A0(RF_RdData[2]), .A1(n143), .B0(n131), .B1(n165), .Y(n105)
         );
  AO22X1M U154 ( .A0(RF_RdData[3]), .A1(n143), .B0(n131), .B1(n166), .Y(n106)
         );
  AO22X1M U155 ( .A0(RF_RdData[4]), .A1(n143), .B0(n131), .B1(n167), .Y(n107)
         );
  AO22X1M U156 ( .A0(RF_RdData[5]), .A1(n143), .B0(n131), .B1(n168), .Y(n108)
         );
  AO22X1M U157 ( .A0(RF_RdData[6]), .A1(n143), .B0(n131), .B1(n169), .Y(n109)
         );
  AO22X1M U158 ( .A0(RF_RdData[7]), .A1(n143), .B0(n131), .B1(n170), .Y(n110)
         );
  AO22X1M U159 ( .A0(ALU_OUT[0]), .A1(UART_ALU_SEND), .B0(n141), .B1(n171), 
        .Y(n87) );
  AO22X1M U160 ( .A0(ALU_OUT[1]), .A1(UART_ALU_SEND), .B0(n141), .B1(n172), 
        .Y(n88) );
  AO22X1M U161 ( .A0(ALU_OUT[2]), .A1(UART_ALU_SEND), .B0(n141), .B1(n173), 
        .Y(n89) );
  AO22X1M U162 ( .A0(ALU_OUT[3]), .A1(UART_ALU_SEND), .B0(n141), .B1(n174), 
        .Y(n90) );
  AO22X1M U163 ( .A0(ALU_OUT[4]), .A1(UART_ALU_SEND), .B0(n141), .B1(n175), 
        .Y(n91) );
  AO22X1M U164 ( .A0(ALU_OUT[5]), .A1(UART_ALU_SEND), .B0(n141), .B1(n176), 
        .Y(n92) );
  AO22X1M U165 ( .A0(ALU_OUT[6]), .A1(UART_ALU_SEND), .B0(n141), .B1(n177), 
        .Y(n93) );
  AO22X1M U166 ( .A0(ALU_OUT[7]), .A1(UART_ALU_SEND), .B0(n141), .B1(n178), 
        .Y(n94) );
  AO22X1M U167 ( .A0(ALU_OUT[8]), .A1(UART_ALU_SEND), .B0(n141), .B1(n179), 
        .Y(n95) );
  AO22X1M U168 ( .A0(ALU_OUT[9]), .A1(UART_ALU_SEND), .B0(n141), .B1(n180), 
        .Y(n96) );
  AO22X1M U169 ( .A0(ALU_OUT[10]), .A1(UART_ALU_SEND), .B0(n141), .B1(n181), 
        .Y(n97) );
  AO22X1M U170 ( .A0(ALU_OUT[11]), .A1(UART_ALU_SEND), .B0(n141), .B1(n182), 
        .Y(n98) );
  AO22X1M U171 ( .A0(ALU_OUT[12]), .A1(UART_ALU_SEND), .B0(n141), .B1(n183), 
        .Y(n99) );
  AO22X1M U172 ( .A0(ALU_OUT[13]), .A1(UART_ALU_SEND), .B0(n141), .B1(n184), 
        .Y(n100) );
  AO22X1M U173 ( .A0(ALU_OUT[14]), .A1(UART_ALU_SEND), .B0(n141), .B1(n185), 
        .Y(n101) );
  AO22X1M U174 ( .A0(ALU_OUT[15]), .A1(UART_ALU_SEND), .B0(n141), .B1(n186), 
        .Y(n102) );
  OAI21X2M U175 ( .A0(n145), .A1(n69), .B0(n59), .Y(CLKG_EN) );
  INVX2M U176 ( .A(ALU_OUT_VLD), .Y(n147) );
  INVX2M U177 ( .A(UART_RX_DATA[4]), .Y(n149) );
  INVX2M U178 ( .A(UART_RX_DATA[7]), .Y(n148) );
  INVXLM U179 ( .A(current_state[1]), .Y(n162) );
  DLY1X1M U180 ( .A(UART_SEND_RF_DATA[0]), .Y(n163) );
  DLY1X1M U181 ( .A(UART_SEND_RF_DATA[1]), .Y(n164) );
  DLY1X1M U182 ( .A(UART_SEND_RF_DATA[2]), .Y(n165) );
  DLY1X1M U183 ( .A(UART_SEND_RF_DATA[3]), .Y(n166) );
  DLY1X1M U184 ( .A(UART_SEND_RF_DATA[4]), .Y(n167) );
  DLY1X1M U185 ( .A(UART_SEND_RF_DATA[5]), .Y(n168) );
  DLY1X1M U186 ( .A(UART_SEND_RF_DATA[6]), .Y(n169) );
  DLY1X1M U187 ( .A(UART_SEND_RF_DATA[7]), .Y(n170) );
  DLY1X1M U188 ( .A(UART_SEND_ALU_DATA[0]), .Y(n171) );
  DLY1X1M U189 ( .A(UART_SEND_ALU_DATA[1]), .Y(n172) );
  DLY1X1M U190 ( .A(UART_SEND_ALU_DATA[2]), .Y(n173) );
  DLY1X1M U191 ( .A(UART_SEND_ALU_DATA[3]), .Y(n174) );
  DLY1X1M U192 ( .A(UART_SEND_ALU_DATA[4]), .Y(n175) );
  DLY1X1M U193 ( .A(UART_SEND_ALU_DATA[5]), .Y(n176) );
  DLY1X1M U194 ( .A(UART_SEND_ALU_DATA[6]), .Y(n177) );
  DLY1X1M U195 ( .A(UART_SEND_ALU_DATA[7]), .Y(n178) );
  DLY1X1M U196 ( .A(UART_SEND_ALU_DATA[8]), .Y(n179) );
  DLY1X1M U197 ( .A(UART_SEND_ALU_DATA[9]), .Y(n180) );
  DLY1X1M U198 ( .A(UART_SEND_ALU_DATA[10]), .Y(n181) );
  DLY1X1M U199 ( .A(UART_SEND_ALU_DATA[11]), .Y(n182) );
  DLY1X1M U200 ( .A(UART_SEND_ALU_DATA[12]), .Y(n183) );
  DLY1X1M U201 ( .A(UART_SEND_ALU_DATA[13]), .Y(n184) );
  DLY1X1M U202 ( .A(UART_SEND_ALU_DATA[14]), .Y(n185) );
  DLY1X1M U203 ( .A(UART_SEND_ALU_DATA[15]), .Y(n186) );
  SDFFRQX1M \UART_SEND_ALU_DATA_reg[2]  ( .D(n89), .SI(n172), .SE(test_se), 
        .CK(CLK), .RN(n132), .Q(UART_SEND_ALU_DATA[2]) );
  SDFFRQX1M \UART_SEND_ALU_DATA_reg[1]  ( .D(n88), .SI(n171), .SE(test_se), 
        .CK(CLK), .RN(n132), .Q(UART_SEND_ALU_DATA[1]) );
  SDFFRQX1M \UART_SEND_ALU_DATA_reg[0]  ( .D(n87), .SI(n156), .SE(test_se), 
        .CK(CLK), .RN(n133), .Q(UART_SEND_ALU_DATA[0]) );
  SDFFRQX1M \UART_SEND_RF_DATA_reg[7]  ( .D(n110), .SI(n169), .SE(test_se), 
        .CK(CLK), .RN(n134), .Q(UART_SEND_RF_DATA[7]) );
  SDFFRQX1M \UART_SEND_RF_DATA_reg[6]  ( .D(n109), .SI(n168), .SE(test_se), 
        .CK(CLK), .RN(n134), .Q(UART_SEND_RF_DATA[6]) );
  SDFFRQX1M \UART_SEND_RF_DATA_reg[5]  ( .D(n108), .SI(n167), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(UART_SEND_RF_DATA[5]) );
  SDFFRQX1M \UART_SEND_RF_DATA_reg[4]  ( .D(n107), .SI(n166), .SE(test_se), 
        .CK(CLK), .RN(n133), .Q(UART_SEND_RF_DATA[4]) );
  SDFFRQX1M \UART_SEND_RF_DATA_reg[3]  ( .D(n106), .SI(n165), .SE(test_se), 
        .CK(CLK), .RN(n133), .Q(UART_SEND_RF_DATA[3]) );
  SDFFRQX1M \UART_SEND_RF_DATA_reg[2]  ( .D(n105), .SI(n164), .SE(test_se), 
        .CK(CLK), .RN(n133), .Q(UART_SEND_RF_DATA[2]) );
  SDFFRQX1M \UART_SEND_RF_DATA_reg[1]  ( .D(n104), .SI(n163), .SE(test_se), 
        .CK(CLK), .RN(n133), .Q(UART_SEND_RF_DATA[1]) );
  SDFFRQX1M \UART_SEND_RF_DATA_reg[0]  ( .D(n103), .SI(n186), .SE(test_se), 
        .CK(CLK), .RN(n133), .Q(UART_SEND_RF_DATA[0]) );
  SDFFRQX1M \UART_SEND_ALU_DATA_reg[15]  ( .D(n102), .SI(n185), .SE(test_se), 
        .CK(CLK), .RN(n133), .Q(UART_SEND_ALU_DATA[15]) );
  SDFFRQX1M \UART_SEND_ALU_DATA_reg[14]  ( .D(n101), .SI(n184), .SE(test_se), 
        .CK(CLK), .RN(n133), .Q(UART_SEND_ALU_DATA[14]) );
  SDFFRQX1M \UART_SEND_ALU_DATA_reg[13]  ( .D(n100), .SI(n183), .SE(test_se), 
        .CK(CLK), .RN(n133), .Q(UART_SEND_ALU_DATA[13]) );
  SDFFRQX1M \UART_SEND_ALU_DATA_reg[12]  ( .D(n99), .SI(n182), .SE(test_se), 
        .CK(CLK), .RN(n133), .Q(UART_SEND_ALU_DATA[12]) );
  SDFFRQX1M \UART_SEND_ALU_DATA_reg[11]  ( .D(n98), .SI(n181), .SE(test_se), 
        .CK(CLK), .RN(n133), .Q(UART_SEND_ALU_DATA[11]) );
  SDFFRQX1M \UART_SEND_ALU_DATA_reg[10]  ( .D(n97), .SI(n180), .SE(test_se), 
        .CK(CLK), .RN(n133), .Q(UART_SEND_ALU_DATA[10]) );
  SDFFRQX1M \UART_SEND_ALU_DATA_reg[9]  ( .D(n96), .SI(n179), .SE(test_se), 
        .CK(CLK), .RN(n133), .Q(UART_SEND_ALU_DATA[9]) );
  SDFFRQX1M \UART_SEND_ALU_DATA_reg[8]  ( .D(n95), .SI(n178), .SE(test_se), 
        .CK(CLK), .RN(n132), .Q(UART_SEND_ALU_DATA[8]) );
  SDFFRQX1M \UART_SEND_ALU_DATA_reg[7]  ( .D(n94), .SI(n177), .SE(test_se), 
        .CK(CLK), .RN(n132), .Q(UART_SEND_ALU_DATA[7]) );
  SDFFRQX1M \UART_SEND_ALU_DATA_reg[6]  ( .D(n93), .SI(n176), .SE(test_se), 
        .CK(CLK), .RN(n132), .Q(UART_SEND_ALU_DATA[6]) );
  SDFFRQX1M \UART_SEND_ALU_DATA_reg[5]  ( .D(n92), .SI(n175), .SE(test_se), 
        .CK(CLK), .RN(n132), .Q(UART_SEND_ALU_DATA[5]) );
  SDFFRQX1M \UART_SEND_ALU_DATA_reg[4]  ( .D(n91), .SI(n174), .SE(test_se), 
        .CK(CLK), .RN(n132), .Q(UART_SEND_ALU_DATA[4]) );
  SDFFRQX1M \UART_SEND_ALU_DATA_reg[3]  ( .D(n90), .SI(n173), .SE(test_se), 
        .CK(CLK), .RN(n132), .Q(UART_SEND_ALU_DATA[3]) );
  SDFFRQX4M \current_state_reg[3]  ( .D(next_state[3]), .SI(current_state[2]), 
        .SE(test_se), .CK(CLK), .RN(n132), .Q(current_state[3]) );
  SDFFRQX4M \current_state_reg[2]  ( .D(next_state[2]), .SI(n144), .SE(test_se), .CK(CLK), .RN(n132), .Q(current_state[2]) );
  SDFFRQX4M \current_state_reg[0]  ( .D(next_state[0]), .SI(n170), .SE(test_se), .CK(CLK), .RN(n132), .Q(current_state[0]) );
  SDFFRQX4M \current_state_reg[1]  ( .D(next_state[1]), .SI(current_state[0]), 
        .SE(test_se), .CK(CLK), .RN(n133), .Q(current_state[1]) );
  INVX2M U3 ( .A(1'b0), .Y(CLKDIV_EN) );
  NOR4X2M U5 ( .A(UART_RX_DATA[5]), .B(UART_RX_DATA[1]), .C(n75), .D(n153), 
        .Y(n74) );
  NOR4X2M U6 ( .A(UART_RX_DATA[5]), .B(UART_RX_DATA[4]), .C(UART_RX_DATA[1]), 
        .D(UART_RX_DATA[0]), .Y(n77) );
endmodule


module CTRL_TX_test_1 ( CLK, RST, UART_RF_SEND, UART_SEND_RF_DATA, 
        UART_ALU_SEND, UART_SEND_ALU_DATA, UART_TX_Busy, UART_TX_DATA, 
        UART_TX_VLD, test_si, test_so, test_se );
  input [7:0] UART_SEND_RF_DATA;
  input [15:0] UART_SEND_ALU_DATA;
  output [7:0] UART_TX_DATA;
  input CLK, RST, UART_RF_SEND, UART_ALU_SEND, UART_TX_Busy, test_si, test_se;
  output UART_TX_VLD, test_so;
  wire   n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n34, n35;
  wire   [2:0] current_state;
  wire   [2:0] next_state;
  assign test_so = current_state[2];

  SDFFRQX2M \current_state_reg[0]  ( .D(next_state[0]), .SI(test_si), .SE(
        test_se), .CK(CLK), .RN(n28), .Q(current_state[0]) );
  SDFFRQX2M \current_state_reg[1]  ( .D(next_state[1]), .SI(n34), .SE(test_se), 
        .CK(CLK), .RN(n28), .Q(current_state[1]) );
  BUFX4M U9 ( .A(n17), .Y(n25) );
  NOR3X2M U10 ( .A(current_state[0]), .B(current_state[1]), .C(n31), .Y(n17)
         );
  BUFX4M U11 ( .A(n13), .Y(n26) );
  INVX2M U12 ( .A(current_state[2]), .Y(n31) );
  INVX2M U13 ( .A(current_state[1]), .Y(n30) );
  INVX2M U14 ( .A(current_state[0]), .Y(n29) );
  BUFX2M U15 ( .A(RST), .Y(n28) );
  NAND3BX2M U16 ( .AN(n27), .B(n11), .C(n12), .Y(next_state[1]) );
  NAND4BX1M U17 ( .AN(UART_RF_SEND), .B(UART_ALU_SEND), .C(n31), .D(n29), .Y(
        n12) );
  NOR2X2M U18 ( .A(n30), .B(n29), .Y(n9) );
  OAI2BB1X2M U19 ( .A0N(UART_SEND_RF_DATA[0]), .A1N(n26), .B0(n24), .Y(
        UART_TX_DATA[0]) );
  AOI22X1M U20 ( .A0(UART_SEND_ALU_DATA[8]), .A1(n25), .B0(
        UART_SEND_ALU_DATA[0]), .B1(n27), .Y(n24) );
  OAI2BB1X2M U21 ( .A0N(UART_SEND_RF_DATA[1]), .A1N(n26), .B0(n23), .Y(
        UART_TX_DATA[1]) );
  AOI22X1M U22 ( .A0(UART_SEND_ALU_DATA[9]), .A1(n25), .B0(
        UART_SEND_ALU_DATA[1]), .B1(n27), .Y(n23) );
  OAI2BB1X2M U23 ( .A0N(UART_SEND_RF_DATA[2]), .A1N(n26), .B0(n22), .Y(
        UART_TX_DATA[2]) );
  AOI22X1M U24 ( .A0(UART_SEND_ALU_DATA[10]), .A1(n25), .B0(
        UART_SEND_ALU_DATA[2]), .B1(n27), .Y(n22) );
  OAI2BB1X2M U25 ( .A0N(UART_SEND_RF_DATA[3]), .A1N(n26), .B0(n21), .Y(
        UART_TX_DATA[3]) );
  AOI22X1M U26 ( .A0(UART_SEND_ALU_DATA[11]), .A1(n25), .B0(
        UART_SEND_ALU_DATA[3]), .B1(n27), .Y(n21) );
  OAI2BB1X2M U27 ( .A0N(UART_SEND_RF_DATA[4]), .A1N(n26), .B0(n20), .Y(
        UART_TX_DATA[4]) );
  AOI22X1M U28 ( .A0(UART_SEND_ALU_DATA[12]), .A1(n25), .B0(
        UART_SEND_ALU_DATA[4]), .B1(n27), .Y(n20) );
  OAI2BB1X2M U29 ( .A0N(UART_SEND_RF_DATA[5]), .A1N(n26), .B0(n19), .Y(
        UART_TX_DATA[5]) );
  AOI22X1M U30 ( .A0(UART_SEND_ALU_DATA[13]), .A1(n25), .B0(
        UART_SEND_ALU_DATA[5]), .B1(n27), .Y(n19) );
  OAI2BB1X2M U31 ( .A0N(UART_SEND_RF_DATA[6]), .A1N(n26), .B0(n18), .Y(
        UART_TX_DATA[6]) );
  AOI22X1M U32 ( .A0(UART_SEND_ALU_DATA[14]), .A1(n25), .B0(
        UART_SEND_ALU_DATA[6]), .B1(n27), .Y(n18) );
  OAI2B11X2M U33 ( .A1N(n26), .A0(UART_TX_Busy), .B0(n14), .C0(n11), .Y(
        next_state[0]) );
  NAND4X2M U34 ( .A(UART_RF_SEND), .B(n34), .C(n35), .D(n31), .Y(n14) );
  OAI2BB1X2M U35 ( .A0N(UART_SEND_RF_DATA[7]), .A1N(n26), .B0(n16), .Y(
        UART_TX_DATA[7]) );
  AOI22X1M U36 ( .A0(UART_SEND_ALU_DATA[15]), .A1(n25), .B0(
        UART_SEND_ALU_DATA[7]), .B1(n27), .Y(n16) );
  XNOR2X4M U37 ( .A(n30), .B(current_state[0]), .Y(n7) );
  NOR3X2M U38 ( .A(n7), .B(UART_TX_Busy), .C(n8), .Y(next_state[2]) );
  XNOR2X2M U39 ( .A(n9), .B(current_state[2]), .Y(n8) );
  CLKBUFX6M U40 ( .A(n10), .Y(n27) );
  NOR3X2M U41 ( .A(current_state[0]), .B(current_state[2]), .C(n30), .Y(n10)
         );
  NOR3X2M U42 ( .A(current_state[1]), .B(current_state[2]), .C(n29), .Y(n13)
         );
  NOR2X2M U43 ( .A(n9), .B(n15), .Y(UART_TX_VLD) );
  XNOR2X2M U44 ( .A(n7), .B(current_state[2]), .Y(n15) );
  NAND3X2M U45 ( .A(current_state[1]), .B(n31), .C(UART_TX_Busy), .Y(n11) );
  DLY1X1M U46 ( .A(n29), .Y(n34) );
  DLY1X1M U47 ( .A(n30), .Y(n35) );
  SDFFRQX4M \current_state_reg[2]  ( .D(next_state[2]), .SI(n35), .SE(test_se), 
        .CK(CLK), .RN(n28), .Q(current_state[2]) );
endmodule


module SYS_CTRL_test_1 ( CLK, RST, RF_RdData, RF_RdData_VLD, RF_WrEn, RF_RdEn, 
        RF_Address, RF_WrData, ALU_OUT, ALU_OUT_VLD, ALU_EN, ALU_FUN, CLKG_EN, 
        CLKDIV_EN, UART_RX_DATA, UART_RX_VLD, UART_TX_Busy, UART_TX_DATA, 
        UART_TX_VLD, test_si, test_so, test_se );
  input [7:0] RF_RdData;
  output [3:0] RF_Address;
  output [7:0] RF_WrData;
  input [15:0] ALU_OUT;
  output [3:0] ALU_FUN;
  input [7:0] UART_RX_DATA;
  output [7:0] UART_TX_DATA;
  input CLK, RST, RF_RdData_VLD, ALU_OUT_VLD, UART_RX_VLD, UART_TX_Busy,
         test_si, test_se;
  output RF_WrEn, RF_RdEn, ALU_EN, CLKG_EN, CLKDIV_EN, UART_TX_VLD, test_so;
  wire   n7, n8, UART_RF_SEND, UART_ALU_SEND, n5, n6, n11;
  wire   [7:0] UART_SEND_RF_DATA;
  wire   [15:0] UART_SEND_ALU_DATA;

  INVX2M U3 ( .A(n6), .Y(n5) );
  INVX2M U4 ( .A(RST), .Y(n6) );
  BUFX2M U5 ( .A(n7), .Y(RF_Address[1]) );
  BUFX2M U6 ( .A(n8), .Y(RF_Address[0]) );
  CTRL_RX_test_1 U0_CTRL_RX ( .CLK(CLK), .RST(n5), .RF_RdData(RF_RdData), 
        .RF_RdData_VLD(RF_RdData_VLD), .ALU_OUT(ALU_OUT), .ALU_OUT_VLD(
        ALU_OUT_VLD), .UART_RX_DATA(UART_RX_DATA), .UART_RX_VLD(UART_RX_VLD), 
        .ALU_EN(ALU_EN), .ALU_FUN(ALU_FUN), .CLKG_EN(CLKG_EN), .RF_WrEn(
        RF_WrEn), .RF_RdEn(RF_RdEn), .RF_Address({RF_Address[3:2], n7, n8}), 
        .RF_WrData(RF_WrData), .UART_RF_SEND(UART_RF_SEND), .UART_ALU_SEND(
        UART_ALU_SEND), .UART_SEND_RF_DATA(UART_SEND_RF_DATA), 
        .UART_SEND_ALU_DATA(UART_SEND_ALU_DATA), .test_si(test_si), .test_so(
        n11), .test_se(test_se) );
  CTRL_TX_test_1 U0_CTRL_TX ( .CLK(CLK), .RST(n5), .UART_RF_SEND(UART_RF_SEND), 
        .UART_SEND_RF_DATA(UART_SEND_RF_DATA), .UART_ALU_SEND(UART_ALU_SEND), 
        .UART_SEND_ALU_DATA(UART_SEND_ALU_DATA), .UART_TX_Busy(UART_TX_Busy), 
        .UART_TX_DATA(UART_TX_DATA), .UART_TX_VLD(UART_TX_VLD), .test_si(n11), 
        .test_so(test_so), .test_se(test_se) );
  INVX2M U1 ( .A(1'b0), .Y(CLKDIV_EN) );
endmodule


module RegFile_test_1 ( CLK, RST, WrEn, RdEn, Address, WrData, RdData, 
        RdData_VLD, REG0, REG1, REG2, REG3, test_si, test_so, test_se );
  input [3:0] Address;
  input [7:0] WrData;
  output [7:0] RdData;
  output [7:0] REG0;
  output [7:0] REG1;
  output [7:0] REG2;
  output [7:0] REG3;
  input CLK, RST, WrEn, RdEn, test_si, test_se;
  output RdData_VLD, test_so;
  wire   N11, N12, N13, N14, n661, n662, n663, n664, n665, n666, n667, n668,
         n535, n536, n537, n538, n539, n669, n670, n671, n672, n673, n674,
         \regArr[15][7] , \regArr[15][6] , \regArr[15][5] , \regArr[15][4] ,
         \regArr[15][3] , \regArr[15][2] , \regArr[15][1] , \regArr[15][0] ,
         \regArr[14][7] , \regArr[14][6] , \regArr[14][5] , \regArr[14][4] ,
         \regArr[14][3] , \regArr[14][2] , \regArr[14][1] , \regArr[14][0] ,
         \regArr[13][7] , \regArr[13][6] , \regArr[13][5] , \regArr[13][4] ,
         \regArr[13][3] , \regArr[13][2] , \regArr[13][1] , \regArr[13][0] ,
         \regArr[12][7] , \regArr[12][6] , \regArr[12][5] , \regArr[12][4] ,
         \regArr[12][3] , \regArr[12][2] , \regArr[12][1] , \regArr[12][0] ,
         \regArr[11][7] , \regArr[11][6] , \regArr[11][5] , \regArr[11][4] ,
         \regArr[11][3] , \regArr[11][2] , \regArr[11][1] , \regArr[11][0] ,
         \regArr[10][7] , \regArr[10][6] , \regArr[10][5] , \regArr[10][4] ,
         \regArr[10][3] , \regArr[10][2] , \regArr[10][1] , \regArr[10][0] ,
         \regArr[9][7] , \regArr[9][6] , \regArr[9][5] , \regArr[9][4] ,
         \regArr[9][3] , \regArr[9][2] , \regArr[9][1] , \regArr[9][0] ,
         \regArr[8][7] , \regArr[8][6] , \regArr[8][5] , \regArr[8][4] ,
         \regArr[8][3] , \regArr[8][2] , \regArr[8][1] , \regArr[8][0] ,
         \regArr[7][7] , \regArr[7][6] , \regArr[7][5] , \regArr[7][4] ,
         \regArr[7][3] , \regArr[7][2] , \regArr[7][1] , \regArr[7][0] ,
         \regArr[6][7] , \regArr[6][6] , \regArr[6][5] , \regArr[6][4] ,
         \regArr[6][3] , \regArr[6][2] , \regArr[6][1] , \regArr[6][0] ,
         \regArr[5][7] , \regArr[5][6] , \regArr[5][5] , \regArr[5][4] ,
         \regArr[5][3] , \regArr[5][2] , \regArr[5][1] , \regArr[5][0] ,
         \regArr[4][7] , \regArr[4][6] , \regArr[4][5] , \regArr[4][4] ,
         \regArr[4][3] , \regArr[4][2] , \regArr[4][1] , \regArr[4][0] , N36,
         N37, N38, N39, N40, N41, N42, N43, n151, n152, n153, n154, n155, n156,
         n157, n158, n159, n160, n161, n162, n163, n164, n165, n166, n167,
         n168, n169, n170, n171, n172, n173, n174, n175, n176, n177, n178,
         n179, n180, n181, n182, n183, n184, n185, n186, n187, n188, n189,
         n190, n191, n192, n193, n194, n195, n196, n197, n198, n199, n200,
         n201, n202, n203, n204, n205, n206, n207, n208, n209, n210, n211,
         n212, n213, n214, n215, n216, n217, n218, n219, n220, n221, n222,
         n223, n224, n225, n226, n227, n228, n229, n230, n231, n232, n233,
         n234, n235, n236, n237, n238, n239, n240, n241, n242, n243, n244,
         n245, n246, n247, n248, n249, n250, n251, n252, n253, n254, n255,
         n256, n257, n258, n259, n260, n261, n262, n263, n264, n265, n266,
         n267, n268, n269, n270, n271, n272, n273, n274, n275, n276, n277,
         n278, n279, n280, n281, n282, n283, n284, n285, n286, n287, n288,
         n289, n290, n291, n292, n293, n294, n295, n296, n297, n298, n299,
         n300, n301, n302, n303, n304, n305, n306, n307, n308, n309, n310,
         n311, n312, n313, n314, n315, n433, n437, n438, n439, n440, n441,
         n442, n443, n444, n445, n446, n447, n448, n449, n450, n451, n452,
         n453, n454, n455, n456, n457, n458, n459, n460, n461, n462, n463,
         n464, n465, n466, n467, n468, n469, n470, n471, n472, n473, n474,
         n475, n476, n477, n478, n479, n480, n481, n482, n483, n484, n485,
         n486, n487, n488, n489, n490, n491, n492, n493, n494, n495, n496,
         n497, n498, n499, n500, n501, n502, n503, n504, n505, n506, n507,
         n508, n509, n510, n511, n512, n513, n514, n515, n516, n517, n518,
         n519, n520, n521, n522, n523, n524, n525, n526, n527, n528, n529,
         n530, n531, n532, n533, n534, n543, n544, n545, n546, n547, n548,
         n549, n564, n565, n566, n567, n568, n569, n570, n571, n572, n573,
         n574, n575, n576, n577, n578, n579, n580, n581, n582, n583, n584,
         n585, n586, n587, n588, n589, n590, n591, n592, n593, n594, n595,
         n596, n597, n598, n599, n600, n601, n602, n603, n604, n605, n606,
         n607, n608, n609, n610, n611, n612, n613, n614, n615, n616, n617,
         n618, n619, n620, n621, n622, n623, n624, n625, n626, n627, n628,
         n629, n630, n631, n632, n633, n634, n636, n637, n638, n639, n640,
         n641, n642, n643, n644, n645, n646, n647, n648, n649, n650, n651,
         n652, n653, n654, n655, n656, n657, n658, n659, n660;
  assign N11 = Address[0];
  assign N12 = Address[1];
  assign N13 = Address[2];
  assign N14 = Address[3];

  SDFFRHQX8M \regArr_reg[1][1]  ( .D(n197), .SI(REG1[0]), .SE(test_se), .CK(
        CLK), .RN(n511), .Q(REG1[1]) );
  SDFFRQX4M \regArr_reg[2][3]  ( .D(n207), .SI(REG2[2]), .SE(test_se), .CK(CLK), .RN(n512), .Q(REG2[3]) );
  SDFFRQX4M \regArr_reg[0][6]  ( .D(n194), .SI(REG0[5]), .SE(test_se), .CK(CLK), .RN(n511), .Q(REG0[6]) );
  SDFFRQX4M \regArr_reg[0][7]  ( .D(n195), .SI(REG0[6]), .SE(test_se), .CK(CLK), .RN(n511), .Q(REG0[7]) );
  SDFFSQX2M \regArr_reg[2][5]  ( .D(n209), .SI(n547), .SE(test_se), .CK(CLK), 
        .SN(RST), .Q(REG2[5]) );
  SDFFSQX2M \regArr_reg[2][0]  ( .D(n204), .SI(REG1[7]), .SE(test_se), .CK(CLK), .SN(n510), .Q(REG2[0]) );
  SDFFRQX1M \regArr_reg[10][6]  ( .D(n274), .SI(n585), .SE(test_se), .CK(CLK), 
        .RN(n517), .Q(\regArr[10][6] ) );
  SDFFRQX1M \regArr_reg[10][5]  ( .D(n273), .SI(n584), .SE(test_se), .CK(CLK), 
        .RN(n517), .Q(\regArr[10][5] ) );
  SDFFRQX1M \regArr_reg[10][4]  ( .D(n272), .SI(n583), .SE(test_se), .CK(CLK), 
        .RN(n517), .Q(\regArr[10][4] ) );
  SDFFRQX1M \regArr_reg[10][3]  ( .D(n271), .SI(n582), .SE(test_se), .CK(CLK), 
        .RN(n517), .Q(\regArr[10][3] ) );
  SDFFRQX1M \regArr_reg[10][2]  ( .D(n270), .SI(n581), .SE(test_se), .CK(CLK), 
        .RN(n517), .Q(\regArr[10][2] ) );
  SDFFRQX1M \regArr_reg[10][1]  ( .D(n269), .SI(n579), .SE(test_se), .CK(CLK), 
        .RN(n517), .Q(\regArr[10][1] ) );
  SDFFRQX1M \regArr_reg[15][7]  ( .D(n315), .SI(n634), .SE(test_se), .CK(CLK), 
        .RN(n510), .Q(\regArr[15][7] ) );
  SDFFRQX1M \regArr_reg[15][6]  ( .D(n314), .SI(n633), .SE(test_se), .CK(CLK), 
        .RN(n520), .Q(\regArr[15][6] ) );
  SDFFRQX1M \regArr_reg[15][5]  ( .D(n313), .SI(n632), .SE(test_se), .CK(CLK), 
        .RN(n520), .Q(\regArr[15][5] ) );
  SDFFRQX1M \regArr_reg[15][4]  ( .D(n312), .SI(n631), .SE(test_se), .CK(CLK), 
        .RN(n520), .Q(\regArr[15][4] ) );
  SDFFRQX1M \regArr_reg[15][3]  ( .D(n311), .SI(n630), .SE(test_se), .CK(CLK), 
        .RN(n520), .Q(\regArr[15][3] ) );
  SDFFRQX1M \regArr_reg[15][2]  ( .D(n310), .SI(n629), .SE(test_se), .CK(CLK), 
        .RN(n520), .Q(\regArr[15][2] ) );
  SDFFRQX1M \regArr_reg[15][1]  ( .D(n309), .SI(n621), .SE(test_se), .CK(CLK), 
        .RN(n520), .Q(\regArr[15][1] ) );
  SDFFRQX1M \regArr_reg[9][7]  ( .D(n267), .SI(n610), .SE(test_se), .CK(CLK), 
        .RN(n516), .Q(\regArr[9][7] ) );
  SDFFRQX1M \regArr_reg[9][6]  ( .D(n266), .SI(n609), .SE(test_se), .CK(CLK), 
        .RN(n516), .Q(\regArr[9][6] ) );
  SDFFRQX1M \regArr_reg[9][5]  ( .D(n265), .SI(n608), .SE(test_se), .CK(CLK), 
        .RN(n516), .Q(\regArr[9][5] ) );
  SDFFRQX1M \regArr_reg[9][4]  ( .D(n264), .SI(n607), .SE(test_se), .CK(CLK), 
        .RN(n516), .Q(\regArr[9][4] ) );
  SDFFRQX1M \regArr_reg[9][3]  ( .D(n263), .SI(n606), .SE(test_se), .CK(CLK), 
        .RN(n516), .Q(\regArr[9][3] ) );
  SDFFRQX1M \regArr_reg[9][2]  ( .D(n262), .SI(n605), .SE(test_se), .CK(CLK), 
        .RN(n516), .Q(\regArr[9][2] ) );
  SDFFRQX1M \regArr_reg[9][1]  ( .D(n261), .SI(n604), .SE(test_se), .CK(CLK), 
        .RN(n516), .Q(\regArr[9][1] ) );
  SDFFRQX1M \regArr_reg[11][7]  ( .D(n283), .SI(n627), .SE(test_se), .CK(CLK), 
        .RN(n518), .Q(\regArr[11][7] ) );
  SDFFRQX1M \regArr_reg[11][6]  ( .D(n282), .SI(n626), .SE(test_se), .CK(CLK), 
        .RN(n518), .Q(\regArr[11][6] ) );
  SDFFRQX1M \regArr_reg[11][5]  ( .D(n281), .SI(n625), .SE(test_se), .CK(CLK), 
        .RN(n517), .Q(\regArr[11][5] ) );
  SDFFRQX1M \regArr_reg[11][4]  ( .D(n280), .SI(n624), .SE(test_se), .CK(CLK), 
        .RN(n517), .Q(\regArr[11][4] ) );
  SDFFRQX1M \regArr_reg[11][3]  ( .D(n279), .SI(n623), .SE(test_se), .CK(CLK), 
        .RN(n517), .Q(\regArr[11][3] ) );
  SDFFRQX1M \regArr_reg[11][2]  ( .D(n278), .SI(n622), .SE(test_se), .CK(CLK), 
        .RN(n517), .Q(\regArr[11][2] ) );
  SDFFRQX1M \regArr_reg[11][1]  ( .D(n277), .SI(n620), .SE(test_se), .CK(CLK), 
        .RN(n517), .Q(\regArr[11][1] ) );
  SDFFRQX1M \regArr_reg[12][0]  ( .D(n284), .SI(n628), .SE(test_se), .CK(CLK), 
        .RN(n518), .Q(\regArr[12][0] ) );
  SDFFRQX1M \regArr_reg[12][3]  ( .D(n287), .SI(n653), .SE(test_se), .CK(CLK), 
        .RN(n518), .Q(\regArr[12][3] ) );
  SDFFRQX1M \regArr_reg[12][1]  ( .D(n285), .SI(n656), .SE(test_se), .CK(CLK), 
        .RN(n518), .Q(\regArr[12][1] ) );
  SDFFRQX1M \regArr_reg[12][2]  ( .D(n286), .SI(n654), .SE(test_se), .CK(CLK), 
        .RN(n518), .Q(\regArr[12][2] ) );
  SDFFRQX1M \regArr_reg[12][7]  ( .D(n291), .SI(n650), .SE(test_se), .CK(CLK), 
        .RN(n518), .Q(\regArr[12][7] ) );
  SDFFRQX1M \regArr_reg[12][4]  ( .D(n288), .SI(n655), .SE(test_se), .CK(CLK), 
        .RN(n518), .Q(\regArr[12][4] ) );
  SDFFRQX1M \regArr_reg[12][6]  ( .D(n290), .SI(n649), .SE(test_se), .CK(CLK), 
        .RN(n518), .Q(\regArr[12][6] ) );
  SDFFRQX1M \regArr_reg[12][5]  ( .D(n289), .SI(n651), .SE(test_se), .CK(CLK), 
        .RN(n518), .Q(\regArr[12][5] ) );
  SDFFRQX1M \regArr_reg[14][0]  ( .D(n300), .SI(n603), .SE(test_se), .CK(CLK), 
        .RN(n519), .Q(\regArr[14][0] ) );
  SDFFRQX1M \regArr_reg[8][0]  ( .D(n252), .SI(n619), .SE(test_se), .CK(CLK), 
        .RN(n515), .Q(\regArr[8][0] ) );
  SDFFRQX1M \regArr_reg[10][0]  ( .D(n268), .SI(n611), .SE(test_se), .CK(CLK), 
        .RN(n516), .Q(\regArr[10][0] ) );
  SDFFRQX1M \regArr_reg[15][0]  ( .D(n308), .SI(n570), .SE(test_se), .CK(CLK), 
        .RN(n520), .Q(\regArr[15][0] ) );
  SDFFRQX1M \regArr_reg[9][0]  ( .D(n260), .SI(n639), .SE(test_se), .CK(CLK), 
        .RN(n516), .Q(\regArr[9][0] ) );
  SDFFRQX1M \regArr_reg[11][0]  ( .D(n276), .SI(n587), .SE(test_se), .CK(CLK), 
        .RN(n517), .Q(\regArr[11][0] ) );
  SDFFRQX1M \regArr_reg[13][7]  ( .D(n299), .SI(n602), .SE(test_se), .CK(CLK), 
        .RN(n519), .Q(\regArr[13][7] ) );
  SDFFRQX1M \regArr_reg[13][6]  ( .D(n298), .SI(n601), .SE(test_se), .CK(CLK), 
        .RN(n519), .Q(\regArr[13][6] ) );
  SDFFRQX1M \regArr_reg[13][5]  ( .D(n297), .SI(n600), .SE(test_se), .CK(CLK), 
        .RN(n519), .Q(\regArr[13][5] ) );
  SDFFRQX1M \regArr_reg[13][4]  ( .D(n296), .SI(n598), .SE(test_se), .CK(CLK), 
        .RN(n519), .Q(\regArr[13][4] ) );
  SDFFRQX1M \regArr_reg[13][0]  ( .D(n292), .SI(n652), .SE(test_se), .CK(CLK), 
        .RN(n518), .Q(\regArr[13][0] ) );
  SDFFRQX1M \regArr_reg[13][3]  ( .D(n295), .SI(n596), .SE(test_se), .CK(CLK), 
        .RN(n519), .Q(\regArr[13][3] ) );
  SDFFRQX1M \regArr_reg[13][1]  ( .D(n293), .SI(n599), .SE(test_se), .CK(CLK), 
        .RN(n518), .Q(\regArr[13][1] ) );
  SDFFRQX1M \regArr_reg[13][2]  ( .D(n294), .SI(n597), .SE(test_se), .CK(CLK), 
        .RN(n518), .Q(\regArr[13][2] ) );
  SDFFRQX1M \regArr_reg[2][7]  ( .D(n211), .SI(REG2[6]), .SE(test_se), .CK(CLK), .RN(n512), .Q(n669) );
  SDFFRQX1M \regArr_reg[2][2]  ( .D(n206), .SI(n543), .SE(test_se), .CK(CLK), 
        .RN(n512), .Q(n670) );
  SDFFRQX1M \regArr_reg[3][7]  ( .D(n219), .SI(REG3[6]), .SE(test_se), .CK(CLK), .RN(n513), .Q(n671) );
  SDFFRQX1M \regArr_reg[3][6]  ( .D(n218), .SI(REG3[5]), .SE(test_se), .CK(CLK), .RN(n513), .Q(n672) );
  SDFFRQX1M \regArr_reg[3][5]  ( .D(n217), .SI(REG3[4]), .SE(test_se), .CK(CLK), .RN(n512), .Q(n673) );
  SDFFRQX1M \regArr_reg[3][4]  ( .D(n216), .SI(REG3[3]), .SE(test_se), .CK(CLK), .RN(n512), .Q(n674) );
  SDFFRQX1M \regArr_reg[6][7]  ( .D(n243), .SI(n577), .SE(test_se), .CK(CLK), 
        .RN(n514), .Q(\regArr[6][7] ) );
  SDFFRQX1M \regArr_reg[6][6]  ( .D(n242), .SI(n576), .SE(test_se), .CK(CLK), 
        .RN(n514), .Q(\regArr[6][6] ) );
  SDFFRQX1M \regArr_reg[6][5]  ( .D(n241), .SI(n575), .SE(test_se), .CK(CLK), 
        .RN(n514), .Q(\regArr[6][5] ) );
  SDFFRQX1M \regArr_reg[6][4]  ( .D(n240), .SI(n574), .SE(test_se), .CK(CLK), 
        .RN(n514), .Q(\regArr[6][4] ) );
  SDFFRQX1M \regArr_reg[6][3]  ( .D(n239), .SI(n573), .SE(test_se), .CK(CLK), 
        .RN(n514), .Q(\regArr[6][3] ) );
  SDFFRQX1M \regArr_reg[6][2]  ( .D(n238), .SI(n572), .SE(test_se), .CK(CLK), 
        .RN(n514), .Q(\regArr[6][2] ) );
  SDFFRQX1M \regArr_reg[6][1]  ( .D(n237), .SI(n571), .SE(test_se), .CK(CLK), 
        .RN(n514), .Q(\regArr[6][1] ) );
  SDFFRQX1M \regArr_reg[4][7]  ( .D(n227), .SI(n646), .SE(test_se), .CK(CLK), 
        .RN(n513), .Q(\regArr[4][7] ) );
  SDFFRQX1M \regArr_reg[4][6]  ( .D(n226), .SI(n645), .SE(test_se), .CK(CLK), 
        .RN(n513), .Q(\regArr[4][6] ) );
  SDFFRQX1M \regArr_reg[4][5]  ( .D(n225), .SI(n644), .SE(test_se), .CK(CLK), 
        .RN(n513), .Q(\regArr[4][5] ) );
  SDFFRQX1M \regArr_reg[4][4]  ( .D(n224), .SI(n643), .SE(test_se), .CK(CLK), 
        .RN(n513), .Q(\regArr[4][4] ) );
  SDFFRQX1M \regArr_reg[4][3]  ( .D(n223), .SI(n642), .SE(test_se), .CK(CLK), 
        .RN(n513), .Q(\regArr[4][3] ) );
  SDFFRQX1M \regArr_reg[4][2]  ( .D(n222), .SI(n641), .SE(test_se), .CK(CLK), 
        .RN(n513), .Q(\regArr[4][2] ) );
  SDFFRQX1M \regArr_reg[4][1]  ( .D(n221), .SI(n640), .SE(test_se), .CK(CLK), 
        .RN(n513), .Q(\regArr[4][1] ) );
  SDFFRQX1M \regArr_reg[7][7]  ( .D(n251), .SI(n618), .SE(test_se), .CK(CLK), 
        .RN(n515), .Q(\regArr[7][7] ) );
  SDFFRQX1M \regArr_reg[7][6]  ( .D(n250), .SI(n617), .SE(test_se), .CK(CLK), 
        .RN(n515), .Q(\regArr[7][6] ) );
  SDFFRQX1M \regArr_reg[7][5]  ( .D(n249), .SI(n616), .SE(test_se), .CK(CLK), 
        .RN(n515), .Q(\regArr[7][5] ) );
  SDFFRQX1M \regArr_reg[7][4]  ( .D(n248), .SI(n615), .SE(test_se), .CK(CLK), 
        .RN(n515), .Q(\regArr[7][4] ) );
  SDFFRQX1M \regArr_reg[7][3]  ( .D(n247), .SI(n614), .SE(test_se), .CK(CLK), 
        .RN(n515), .Q(\regArr[7][3] ) );
  SDFFRQX1M \regArr_reg[7][2]  ( .D(n246), .SI(n613), .SE(test_se), .CK(CLK), 
        .RN(n515), .Q(\regArr[7][2] ) );
  SDFFRQX1M \regArr_reg[7][1]  ( .D(n245), .SI(n612), .SE(test_se), .CK(CLK), 
        .RN(n515), .Q(\regArr[7][1] ) );
  SDFFRQX1M \regArr_reg[5][7]  ( .D(n235), .SI(n594), .SE(test_se), .CK(CLK), 
        .RN(n514), .Q(\regArr[5][7] ) );
  SDFFRQX1M \regArr_reg[5][6]  ( .D(n234), .SI(n593), .SE(test_se), .CK(CLK), 
        .RN(n514), .Q(\regArr[5][6] ) );
  SDFFRQX1M \regArr_reg[5][5]  ( .D(n233), .SI(n592), .SE(test_se), .CK(CLK), 
        .RN(n514), .Q(\regArr[5][5] ) );
  SDFFRQX1M \regArr_reg[5][4]  ( .D(n232), .SI(n591), .SE(test_se), .CK(CLK), 
        .RN(n514), .Q(\regArr[5][4] ) );
  SDFFRQX1M \regArr_reg[5][3]  ( .D(n231), .SI(n590), .SE(test_se), .CK(CLK), 
        .RN(n514), .Q(\regArr[5][3] ) );
  SDFFRQX1M \regArr_reg[5][2]  ( .D(n230), .SI(n589), .SE(test_se), .CK(CLK), 
        .RN(n513), .Q(\regArr[5][2] ) );
  SDFFRQX1M \regArr_reg[5][1]  ( .D(n229), .SI(n588), .SE(test_se), .CK(CLK), 
        .RN(n513), .Q(\regArr[5][1] ) );
  SDFFRQX1M \regArr_reg[6][0]  ( .D(n236), .SI(n595), .SE(test_se), .CK(CLK), 
        .RN(n514), .Q(\regArr[6][0] ) );
  SDFFRQX1M \regArr_reg[4][0]  ( .D(n220), .SI(REG3[7]), .SE(test_se), .CK(CLK), .RN(n513), .Q(\regArr[4][0] ) );
  SDFFRQX1M \regArr_reg[7][0]  ( .D(n244), .SI(n578), .SE(test_se), .CK(CLK), 
        .RN(n515), .Q(\regArr[7][0] ) );
  SDFFRQX1M \regArr_reg[5][0]  ( .D(n228), .SI(n647), .SE(test_se), .CK(CLK), 
        .RN(n513), .Q(\regArr[5][0] ) );
  SDFFRQX2M \regArr_reg[2][4]  ( .D(n208), .SI(REG2[3]), .SE(test_se), .CK(CLK), .RN(n512), .Q(REG2[4]) );
  SDFFRQX2M \regArr_reg[3][2]  ( .D(n214), .SI(REG3[1]), .SE(test_se), .CK(CLK), .RN(n512), .Q(REG3[2]) );
  SDFFRQX2M RdData_VLD_reg ( .D(n187), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(n510), .Q(RdData_VLD) );
  SDFFRQX2M \regArr_reg[2][1]  ( .D(n205), .SI(n660), .SE(test_se), .CK(CLK), 
        .RN(n512), .Q(REG2[1]) );
  SDFFRQX2M \regArr_reg[3][0]  ( .D(n212), .SI(REG2[7]), .SE(test_se), .CK(CLK), .RN(n512), .Q(REG3[0]) );
  SDFFRQX2M \regArr_reg[0][5]  ( .D(n193), .SI(REG0[4]), .SE(test_se), .CK(CLK), .RN(n511), .Q(REG0[5]) );
  SDFFRQX2M \regArr_reg[0][4]  ( .D(n192), .SI(REG0[3]), .SE(test_se), .CK(CLK), .RN(n511), .Q(REG0[4]) );
  SDFFRQX2M \regArr_reg[0][0]  ( .D(n188), .SI(RdData[7]), .SE(test_se), .CK(
        CLK), .RN(n511), .Q(REG0[0]) );
  SDFFRQX2M \regArr_reg[3][1]  ( .D(n213), .SI(n544), .SE(test_se), .CK(CLK), 
        .RN(n512), .Q(REG3[1]) );
  SDFFRQX2M \regArr_reg[0][3]  ( .D(n191), .SI(REG0[2]), .SE(test_se), .CK(CLK), .RN(n511), .Q(REG0[3]) );
  SDFFRQX2M \regArr_reg[0][2]  ( .D(n190), .SI(REG0[1]), .SE(test_se), .CK(CLK), .RN(n511), .Q(REG0[2]) );
  SDFFRQX2M \regArr_reg[0][1]  ( .D(n189), .SI(REG0[0]), .SE(test_se), .CK(CLK), .RN(n510), .Q(REG0[1]) );
  SDFFRQX2M \regArr_reg[2][6]  ( .D(n210), .SI(REG2[5]), .SE(test_se), .CK(CLK), .RN(n512), .Q(REG2[6]) );
  SDFFRQX2M \regArr_reg[1][5]  ( .D(n201), .SI(REG1[4]), .SE(test_se), .CK(CLK), .RN(n511), .Q(n537) );
  SDFFRQX2M \regArr_reg[1][4]  ( .D(n200), .SI(n549), .SE(test_se), .CK(CLK), 
        .RN(n511), .Q(n538) );
  SDFFRQX4M \regArr_reg[1][3]  ( .D(n199), .SI(n548), .SE(test_se), .CK(CLK), 
        .RN(n511), .Q(REG1[3]) );
  SDFFRQX2M \regArr_reg[1][0]  ( .D(n196), .SI(REG0[7]), .SE(test_se), .CK(CLK), .RN(n511), .Q(n539) );
  SDFFRQX4M \regArr_reg[1][6]  ( .D(n202), .SI(REG1[5]), .SE(test_se), .CK(CLK), .RN(n512), .Q(n536) );
  SDFFRQX4M \regArr_reg[1][2]  ( .D(n198), .SI(REG1[1]), .SE(test_se), .CK(CLK), .RN(n511), .Q(REG1[2]) );
  SDFFRQX4M \regArr_reg[1][7]  ( .D(n203), .SI(REG1[6]), .SE(test_se), .CK(CLK), .RN(n512), .Q(n535) );
  BUFX24M U140 ( .A(n536), .Y(REG1[6]) );
  BUFX32M U141 ( .A(n539), .Y(REG1[0]) );
  BUFX32M U142 ( .A(n535), .Y(REG1[7]) );
  BUFX32M U143 ( .A(n537), .Y(REG1[5]) );
  INVX32M U144 ( .A(n433), .Y(REG1[4]) );
  INVX14M U145 ( .A(n538), .Y(n433) );
  BUFX6M U146 ( .A(n523), .Y(n510) );
  CLKINVX1M U147 ( .A(N11), .Y(n507) );
  OAI2BB2X1M U150 ( .B0(n524), .B1(n497), .A0N(REG1[0]), .A1N(n497), .Y(n196)
         );
  NOR2X4M U277 ( .A(n534), .B(n508), .Y(n154) );
  AND2X2M U278 ( .A(n172), .B(n507), .Y(n163) );
  AND2X2M U279 ( .A(n178), .B(n507), .Y(n157) );
  BUFX4M U280 ( .A(n159), .Y(n500) );
  NOR2X4M U281 ( .A(n509), .B(N13), .Y(n167) );
  NOR2X4M U282 ( .A(n508), .B(N13), .Y(n162) );
  NOR2X4M U283 ( .A(n509), .B(n534), .Y(n156) );
  MX4XLM U284 ( .A(REG0[2]), .B(REG1[2]), .C(n670), .D(REG3[2]), .S0(n472), 
        .S1(n469), .Y(n448) );
  MX4XLM U285 ( .A(REG0[3]), .B(REG1[3]), .C(REG2[3]), .D(REG3[3]), .S0(n472), 
        .S1(n469), .Y(n452) );
  MX4XLM U286 ( .A(REG0[4]), .B(REG1[4]), .C(REG2[4]), .D(n674), .S0(n472), 
        .S1(n470), .Y(n456) );
  INVX2M U287 ( .A(N12), .Y(n509) );
  MX4XLM U288 ( .A(REG0[0]), .B(REG1[0]), .C(REG2[0]), .D(REG3[0]), .S0(n471), 
        .S1(n470), .Y(n440) );
  MX4XLM U289 ( .A(REG0[1]), .B(REG1[1]), .C(REG2[1]), .D(REG3[1]), .S0(n471), 
        .S1(n469), .Y(n444) );
  MX4XLM U290 ( .A(REG0[5]), .B(REG1[5]), .C(REG2[5]), .D(n673), .S0(n473), 
        .S1(n470), .Y(n460) );
  MX4XLM U291 ( .A(REG0[6]), .B(REG1[6]), .C(REG2[6]), .D(n672), .S0(n473), 
        .S1(n470), .Y(n464) );
  MX4XLM U292 ( .A(REG0[7]), .B(REG1[7]), .C(n669), .D(n671), .S0(n473), .S1(
        n470), .Y(n468) );
  INVX8M U293 ( .A(WrData[5]), .Y(n529) );
  INVX8M U294 ( .A(WrData[6]), .Y(n530) );
  CLKBUFX8M U295 ( .A(N11), .Y(n472) );
  CLKBUFX8M U296 ( .A(n508), .Y(n469) );
  CLKBUFX6M U297 ( .A(N11), .Y(n471) );
  BUFX4M U298 ( .A(n170), .Y(n489) );
  BUFX4M U299 ( .A(n152), .Y(n506) );
  BUFX4M U300 ( .A(n170), .Y(n488) );
  BUFX4M U301 ( .A(n152), .Y(n505) );
  CLKBUFX8M U302 ( .A(n522), .Y(n512) );
  CLKBUFX8M U303 ( .A(n522), .Y(n513) );
  CLKBUFX8M U304 ( .A(n522), .Y(n514) );
  CLKBUFX8M U305 ( .A(n521), .Y(n515) );
  CLKBUFX8M U306 ( .A(n521), .Y(n516) );
  CLKBUFX8M U307 ( .A(n521), .Y(n517) );
  CLKBUFX8M U308 ( .A(n521), .Y(n518) );
  CLKBUFX8M U309 ( .A(n522), .Y(n519) );
  CLKBUFX8M U310 ( .A(n523), .Y(n511) );
  BUFX4M U311 ( .A(n510), .Y(n520) );
  CLKBUFX8M U312 ( .A(N11), .Y(n473) );
  CLKBUFX8M U313 ( .A(n508), .Y(n470) );
  BUFX4M U314 ( .A(n164), .Y(n497) );
  BUFX4M U315 ( .A(n161), .Y(n499) );
  BUFX4M U316 ( .A(n166), .Y(n495) );
  BUFX4M U317 ( .A(n168), .Y(n493) );
  BUFX4M U318 ( .A(n174), .Y(n483) );
  BUFX4M U319 ( .A(n175), .Y(n481) );
  BUFX4M U320 ( .A(n176), .Y(n479) );
  BUFX4M U321 ( .A(n177), .Y(n477) );
  BUFX4M U322 ( .A(n155), .Y(n504) );
  BUFX4M U323 ( .A(n158), .Y(n502) );
  BUFX4M U324 ( .A(n169), .Y(n491) );
  BUFX4M U325 ( .A(n171), .Y(n487) );
  BUFX4M U326 ( .A(n173), .Y(n485) );
  BUFX4M U327 ( .A(n151), .Y(n475) );
  NAND2X2M U328 ( .A(n165), .B(n154), .Y(n170) );
  NAND2X2M U329 ( .A(n153), .B(n154), .Y(n152) );
  BUFX4M U330 ( .A(n164), .Y(n496) );
  BUFX4M U331 ( .A(n161), .Y(n498) );
  BUFX4M U332 ( .A(n166), .Y(n494) );
  BUFX4M U333 ( .A(n168), .Y(n492) );
  BUFX4M U334 ( .A(n174), .Y(n482) );
  BUFX4M U335 ( .A(n175), .Y(n480) );
  BUFX4M U336 ( .A(n176), .Y(n478) );
  BUFX4M U337 ( .A(n177), .Y(n476) );
  BUFX4M U338 ( .A(n155), .Y(n503) );
  BUFX4M U339 ( .A(n158), .Y(n501) );
  BUFX4M U340 ( .A(n169), .Y(n490) );
  BUFX4M U341 ( .A(n171), .Y(n486) );
  BUFX4M U342 ( .A(n173), .Y(n484) );
  BUFX4M U343 ( .A(n151), .Y(n474) );
  BUFX2M U344 ( .A(n523), .Y(n522) );
  BUFX2M U345 ( .A(n523), .Y(n521) );
  AND2X2M U346 ( .A(n178), .B(n471), .Y(n153) );
  AND2X2M U347 ( .A(n172), .B(n471), .Y(n165) );
  NAND2X2M U348 ( .A(n154), .B(n157), .Y(n151) );
  NAND2X2M U349 ( .A(n156), .B(n157), .Y(n155) );
  NAND2X2M U350 ( .A(n156), .B(n153), .Y(n158) );
  NAND2X2M U351 ( .A(n162), .B(n163), .Y(n161) );
  NAND2X2M U352 ( .A(n162), .B(n157), .Y(n174) );
  NAND2X2M U353 ( .A(n162), .B(n153), .Y(n175) );
  NAND2X2M U354 ( .A(n167), .B(n163), .Y(n166) );
  NAND2X2M U355 ( .A(n167), .B(n165), .Y(n168) );
  NAND2X2M U356 ( .A(n167), .B(n157), .Y(n176) );
  NAND2X2M U357 ( .A(n167), .B(n153), .Y(n177) );
  NAND2X2M U358 ( .A(n165), .B(n162), .Y(n164) );
  NAND2X2M U359 ( .A(n163), .B(n154), .Y(n169) );
  NAND2X2M U360 ( .A(n163), .B(n156), .Y(n171) );
  NAND2X2M U361 ( .A(n165), .B(n156), .Y(n173) );
  INVX4M U362 ( .A(n500), .Y(n532) );
  NOR2X4M U363 ( .A(n533), .B(RdEn), .Y(n160) );
  INVX2M U364 ( .A(N13), .Y(n534) );
  NOR2BX2M U365 ( .AN(n160), .B(N14), .Y(n172) );
  INVX2M U366 ( .A(WrEn), .Y(n533) );
  AND2X2M U367 ( .A(N14), .B(n160), .Y(n178) );
  INVX2M U368 ( .A(n509), .Y(n508) );
  NAND2X2M U369 ( .A(RdEn), .B(n533), .Y(n159) );
  INVX8M U370 ( .A(WrData[0]), .Y(n524) );
  INVX8M U371 ( .A(WrData[1]), .Y(n525) );
  INVX8M U372 ( .A(WrData[4]), .Y(n528) );
  INVX8M U373 ( .A(WrData[7]), .Y(n531) );
  INVX8M U374 ( .A(WrData[3]), .Y(n527) );
  INVX8M U375 ( .A(WrData[2]), .Y(n526) );
  BUFX2M U376 ( .A(RST), .Y(n523) );
  OAI2BB2X1M U377 ( .B0(n474), .B1(n524), .A0N(n656), .A1N(n475), .Y(n284) );
  OAI2BB2X1M U378 ( .B0(n506), .B1(n524), .A0N(n599), .A1N(n506), .Y(n292) );
  OAI2BB2X1M U379 ( .B0(n474), .B1(n525), .A0N(n654), .A1N(n475), .Y(n285) );
  OAI2BB2X1M U380 ( .B0(n474), .B1(n526), .A0N(n653), .A1N(n475), .Y(n286) );
  OAI2BB2X1M U381 ( .B0(n474), .B1(n527), .A0N(n655), .A1N(n475), .Y(n287) );
  OAI2BB2X1M U382 ( .B0(n505), .B1(n525), .A0N(n597), .A1N(n506), .Y(n293) );
  OAI2BB2X1M U383 ( .B0(n505), .B1(n526), .A0N(n596), .A1N(n506), .Y(n294) );
  OAI2BB2X1M U384 ( .B0(n505), .B1(n527), .A0N(n598), .A1N(n506), .Y(n295) );
  OAI2BB2X1M U385 ( .B0(n475), .B1(n528), .A0N(n651), .A1N(n475), .Y(n288) );
  OAI2BB2X1M U386 ( .B0(n474), .B1(n531), .A0N(n652), .A1N(n475), .Y(n291) );
  OAI2BB2X1M U387 ( .B0(n524), .B1(n499), .A0N(REG0[0]), .A1N(n499), .Y(n188)
         );
  OAI2BB2X1M U388 ( .B0(n524), .B1(n493), .A0N(n544), .A1N(n493), .Y(n212) );
  OAI2BB2X1M U389 ( .B0(n524), .B1(n491), .A0N(n640), .A1N(n491), .Y(n220) );
  OAI2BB2X1M U390 ( .B0(n524), .B1(n489), .A0N(n588), .A1N(n489), .Y(n228) );
  OAI2BB2X1M U391 ( .B0(n524), .B1(n487), .A0N(n571), .A1N(n487), .Y(n236) );
  OAI2BB2X1M U392 ( .B0(n524), .B1(n485), .A0N(n612), .A1N(n485), .Y(n244) );
  OAI2BB2X1M U393 ( .B0(n524), .B1(n483), .A0N(n648), .A1N(n483), .Y(n252) );
  OAI2BB2X1M U394 ( .B0(n524), .B1(n481), .A0N(n604), .A1N(n481), .Y(n260) );
  OAI2BB2X1M U395 ( .B0(n524), .B1(n479), .A0N(n579), .A1N(n479), .Y(n268) );
  OAI2BB2X1M U396 ( .B0(n524), .B1(n477), .A0N(n620), .A1N(n477), .Y(n276) );
  OAI2BB2X1M U397 ( .B0(n524), .B1(n504), .A0N(n580), .A1N(n504), .Y(n300) );
  OAI2BB2X1M U398 ( .B0(n524), .B1(n502), .A0N(n621), .A1N(n502), .Y(n308) );
  OAI2BB2X1M U399 ( .B0(n525), .B1(n498), .A0N(REG0[1]), .A1N(n499), .Y(n189)
         );
  OAI2BB2X1M U400 ( .B0(n526), .B1(n498), .A0N(REG0[2]), .A1N(n499), .Y(n190)
         );
  OAI2BB2X1M U401 ( .B0(n527), .B1(n498), .A0N(REG0[3]), .A1N(n499), .Y(n191)
         );
  OAI2BB2X1M U402 ( .B0(n525), .B1(n496), .A0N(REG1[1]), .A1N(n497), .Y(n197)
         );
  OAI2BB2X1M U403 ( .B0(n526), .B1(n496), .A0N(n548), .A1N(n497), .Y(n198) );
  OAI2BB2X1M U404 ( .B0(n527), .B1(n496), .A0N(n549), .A1N(n497), .Y(n199) );
  OAI2BB2X1M U405 ( .B0(n525), .B1(n494), .A0N(n543), .A1N(n495), .Y(n205) );
  OAI2BB2X1M U406 ( .B0(n526), .B1(n494), .A0N(REG2[2]), .A1N(n495), .Y(n206)
         );
  OAI2BB2X1M U407 ( .B0(n527), .B1(n494), .A0N(REG2[3]), .A1N(n495), .Y(n207)
         );
  OAI2BB2X1M U408 ( .B0(n525), .B1(n492), .A0N(REG3[1]), .A1N(n493), .Y(n213)
         );
  OAI2BB2X1M U409 ( .B0(n526), .B1(n492), .A0N(n546), .A1N(n493), .Y(n214) );
  OAI2BB2X1M U410 ( .B0(n525), .B1(n490), .A0N(n641), .A1N(n491), .Y(n221) );
  OAI2BB2X1M U411 ( .B0(n526), .B1(n490), .A0N(n642), .A1N(n491), .Y(n222) );
  OAI2BB2X1M U412 ( .B0(n527), .B1(n490), .A0N(n643), .A1N(n491), .Y(n223) );
  OAI2BB2X1M U413 ( .B0(n525), .B1(n488), .A0N(n589), .A1N(n489), .Y(n229) );
  OAI2BB2X1M U414 ( .B0(n526), .B1(n488), .A0N(n590), .A1N(n489), .Y(n230) );
  OAI2BB2X1M U415 ( .B0(n527), .B1(n488), .A0N(n591), .A1N(n489), .Y(n231) );
  OAI2BB2X1M U416 ( .B0(n525), .B1(n486), .A0N(n572), .A1N(n487), .Y(n237) );
  OAI2BB2X1M U417 ( .B0(n526), .B1(n486), .A0N(n573), .A1N(n487), .Y(n238) );
  OAI2BB2X1M U418 ( .B0(n527), .B1(n486), .A0N(n574), .A1N(n487), .Y(n239) );
  OAI2BB2X1M U419 ( .B0(n525), .B1(n484), .A0N(n613), .A1N(n485), .Y(n245) );
  OAI2BB2X1M U420 ( .B0(n526), .B1(n484), .A0N(n614), .A1N(n485), .Y(n246) );
  OAI2BB2X1M U421 ( .B0(n527), .B1(n484), .A0N(n615), .A1N(n485), .Y(n247) );
  OAI2BB2X1M U422 ( .B0(n525), .B1(n482), .A0N(n657), .A1N(n483), .Y(n253) );
  OAI2BB2X1M U423 ( .B0(n526), .B1(n482), .A0N(n658), .A1N(n483), .Y(n254) );
  OAI2BB2X1M U424 ( .B0(n527), .B1(n482), .A0N(n659), .A1N(n483), .Y(n255) );
  OAI2BB2X1M U425 ( .B0(n525), .B1(n480), .A0N(n605), .A1N(n481), .Y(n261) );
  OAI2BB2X1M U426 ( .B0(n526), .B1(n480), .A0N(n606), .A1N(n481), .Y(n262) );
  OAI2BB2X1M U427 ( .B0(n527), .B1(n480), .A0N(n607), .A1N(n481), .Y(n263) );
  OAI2BB2X1M U428 ( .B0(n525), .B1(n478), .A0N(n581), .A1N(n479), .Y(n269) );
  OAI2BB2X1M U429 ( .B0(n526), .B1(n478), .A0N(n582), .A1N(n479), .Y(n270) );
  OAI2BB2X1M U430 ( .B0(n527), .B1(n478), .A0N(n583), .A1N(n479), .Y(n271) );
  OAI2BB2X1M U431 ( .B0(n525), .B1(n476), .A0N(n622), .A1N(n477), .Y(n277) );
  OAI2BB2X1M U432 ( .B0(n526), .B1(n476), .A0N(n623), .A1N(n477), .Y(n278) );
  OAI2BB2X1M U433 ( .B0(n527), .B1(n476), .A0N(n624), .A1N(n477), .Y(n279) );
  OAI2BB2X1M U434 ( .B0(n525), .B1(n503), .A0N(n564), .A1N(n504), .Y(n301) );
  OAI2BB2X1M U435 ( .B0(n526), .B1(n503), .A0N(n565), .A1N(n504), .Y(n302) );
  OAI2BB2X1M U436 ( .B0(n527), .B1(n503), .A0N(n566), .A1N(n504), .Y(n303) );
  OAI2BB2X1M U437 ( .B0(n525), .B1(n501), .A0N(n629), .A1N(n502), .Y(n309) );
  OAI2BB2X1M U438 ( .B0(n526), .B1(n501), .A0N(n630), .A1N(n502), .Y(n310) );
  OAI2BB2X1M U439 ( .B0(n527), .B1(n501), .A0N(n631), .A1N(n502), .Y(n311) );
  OAI2BB2X1M U440 ( .B0(n528), .B1(n498), .A0N(REG0[4]), .A1N(n499), .Y(n192)
         );
  OAI2BB2X1M U441 ( .B0(n531), .B1(n498), .A0N(REG0[7]), .A1N(n499), .Y(n195)
         );
  OAI2BB2X1M U442 ( .B0(n528), .B1(n496), .A0N(REG1[4]), .A1N(n497), .Y(n200)
         );
  OAI2BB2X1M U443 ( .B0(n531), .B1(n496), .A0N(REG1[7]), .A1N(n497), .Y(n203)
         );
  OAI2BB2X1M U444 ( .B0(n528), .B1(n494), .A0N(n547), .A1N(n495), .Y(n208) );
  OAI2BB2X1M U445 ( .B0(n531), .B1(n494), .A0N(REG2[7]), .A1N(n495), .Y(n211)
         );
  OAI2BB2X1M U446 ( .B0(n528), .B1(n492), .A0N(REG3[4]), .A1N(n493), .Y(n216)
         );
  OAI2BB2X1M U447 ( .B0(n531), .B1(n492), .A0N(REG3[7]), .A1N(n493), .Y(n219)
         );
  OAI2BB2X1M U448 ( .B0(n528), .B1(n490), .A0N(n644), .A1N(n491), .Y(n224) );
  OAI2BB2X1M U449 ( .B0(n531), .B1(n490), .A0N(n647), .A1N(n491), .Y(n227) );
  OAI2BB2X1M U450 ( .B0(n528), .B1(n488), .A0N(n592), .A1N(n489), .Y(n232) );
  OAI2BB2X1M U451 ( .B0(n531), .B1(n488), .A0N(n595), .A1N(n489), .Y(n235) );
  OAI2BB2X1M U452 ( .B0(n528), .B1(n486), .A0N(n575), .A1N(n487), .Y(n240) );
  OAI2BB2X1M U453 ( .B0(n531), .B1(n486), .A0N(n578), .A1N(n487), .Y(n243) );
  OAI2BB2X1M U454 ( .B0(n528), .B1(n484), .A0N(n616), .A1N(n485), .Y(n248) );
  OAI2BB2X1M U455 ( .B0(n531), .B1(n484), .A0N(n619), .A1N(n485), .Y(n251) );
  OAI2BB2X1M U456 ( .B0(n528), .B1(n482), .A0N(n636), .A1N(n483), .Y(n256) );
  OAI2BB2X1M U457 ( .B0(n531), .B1(n482), .A0N(n639), .A1N(n483), .Y(n259) );
  OAI2BB2X1M U458 ( .B0(n528), .B1(n480), .A0N(n608), .A1N(n481), .Y(n264) );
  OAI2BB2X1M U459 ( .B0(n531), .B1(n480), .A0N(n611), .A1N(n481), .Y(n267) );
  OAI2BB2X1M U460 ( .B0(n528), .B1(n478), .A0N(n584), .A1N(n479), .Y(n272) );
  OAI2BB2X1M U461 ( .B0(n531), .B1(n478), .A0N(n587), .A1N(n479), .Y(n275) );
  OAI2BB2X1M U462 ( .B0(n528), .B1(n476), .A0N(n625), .A1N(n477), .Y(n280) );
  OAI2BB2X1M U463 ( .B0(n531), .B1(n476), .A0N(n628), .A1N(n477), .Y(n283) );
  OAI2BB2X1M U464 ( .B0(n528), .B1(n505), .A0N(n600), .A1N(n506), .Y(n296) );
  OAI2BB2X1M U465 ( .B0(n531), .B1(n505), .A0N(n603), .A1N(n506), .Y(n299) );
  OAI2BB2X1M U466 ( .B0(n528), .B1(n503), .A0N(n567), .A1N(n504), .Y(n304) );
  OAI2BB2X1M U467 ( .B0(n531), .B1(n503), .A0N(n570), .A1N(n504), .Y(n307) );
  OAI2BB2X1M U468 ( .B0(n528), .B1(n501), .A0N(n632), .A1N(n502), .Y(n312) );
  OAI2BB2X1M U469 ( .B0(n531), .B1(n501), .A0N(test_so), .A1N(n502), .Y(n315)
         );
  OAI2BB2X1M U470 ( .B0(n474), .B1(n529), .A0N(n649), .A1N(n475), .Y(n289) );
  OAI2BB2X1M U471 ( .B0(n474), .B1(n530), .A0N(n650), .A1N(n475), .Y(n290) );
  OAI2BB2X1M U472 ( .B0(n529), .B1(n498), .A0N(REG0[5]), .A1N(n499), .Y(n193)
         );
  OAI2BB2X1M U473 ( .B0(n530), .B1(n498), .A0N(REG0[6]), .A1N(n499), .Y(n194)
         );
  OAI2BB2X1M U474 ( .B0(n529), .B1(n496), .A0N(REG1[5]), .A1N(n497), .Y(n201)
         );
  OAI2BB2X1M U475 ( .B0(n530), .B1(n496), .A0N(REG1[6]), .A1N(n497), .Y(n202)
         );
  OAI2BB2X1M U476 ( .B0(n530), .B1(n494), .A0N(REG2[6]), .A1N(n495), .Y(n210)
         );
  OAI2BB2X1M U477 ( .B0(n529), .B1(n492), .A0N(REG3[5]), .A1N(n493), .Y(n217)
         );
  OAI2BB2X1M U478 ( .B0(n530), .B1(n492), .A0N(REG3[6]), .A1N(n493), .Y(n218)
         );
  OAI2BB2X1M U479 ( .B0(n529), .B1(n490), .A0N(n645), .A1N(n491), .Y(n225) );
  OAI2BB2X1M U480 ( .B0(n530), .B1(n490), .A0N(n646), .A1N(n491), .Y(n226) );
  OAI2BB2X1M U481 ( .B0(n529), .B1(n488), .A0N(n593), .A1N(n489), .Y(n233) );
  OAI2BB2X1M U482 ( .B0(n530), .B1(n488), .A0N(n594), .A1N(n489), .Y(n234) );
  OAI2BB2X1M U483 ( .B0(n529), .B1(n486), .A0N(n576), .A1N(n487), .Y(n241) );
  OAI2BB2X1M U484 ( .B0(n530), .B1(n486), .A0N(n577), .A1N(n487), .Y(n242) );
  OAI2BB2X1M U485 ( .B0(n529), .B1(n484), .A0N(n617), .A1N(n485), .Y(n249) );
  OAI2BB2X1M U486 ( .B0(n530), .B1(n484), .A0N(n618), .A1N(n485), .Y(n250) );
  OAI2BB2X1M U487 ( .B0(n529), .B1(n482), .A0N(n637), .A1N(n483), .Y(n257) );
  OAI2BB2X1M U488 ( .B0(n530), .B1(n482), .A0N(n638), .A1N(n483), .Y(n258) );
  OAI2BB2X1M U489 ( .B0(n529), .B1(n480), .A0N(n609), .A1N(n481), .Y(n265) );
  OAI2BB2X1M U490 ( .B0(n530), .B1(n480), .A0N(n610), .A1N(n481), .Y(n266) );
  OAI2BB2X1M U491 ( .B0(n529), .B1(n478), .A0N(n585), .A1N(n479), .Y(n273) );
  OAI2BB2X1M U492 ( .B0(n530), .B1(n478), .A0N(n586), .A1N(n479), .Y(n274) );
  OAI2BB2X1M U493 ( .B0(n529), .B1(n476), .A0N(n626), .A1N(n477), .Y(n281) );
  OAI2BB2X1M U494 ( .B0(n530), .B1(n476), .A0N(n627), .A1N(n477), .Y(n282) );
  OAI2BB2X1M U495 ( .B0(n529), .B1(n505), .A0N(n601), .A1N(n506), .Y(n297) );
  OAI2BB2X1M U496 ( .B0(n530), .B1(n505), .A0N(n602), .A1N(n506), .Y(n298) );
  OAI2BB2X1M U497 ( .B0(n529), .B1(n503), .A0N(n568), .A1N(n504), .Y(n305) );
  OAI2BB2X1M U498 ( .B0(n530), .B1(n503), .A0N(n569), .A1N(n504), .Y(n306) );
  OAI2BB2X1M U499 ( .B0(n529), .B1(n501), .A0N(n633), .A1N(n502), .Y(n313) );
  OAI2BB2X1M U500 ( .B0(n530), .B1(n501), .A0N(n634), .A1N(n502), .Y(n314) );
  OAI2BB2X1M U501 ( .B0(n524), .B1(n495), .A0N(n660), .A1N(n495), .Y(n204) );
  OAI2BB2X1M U502 ( .B0(n527), .B1(n492), .A0N(REG3[3]), .A1N(n493), .Y(n215)
         );
  OAI2BB2X1M U503 ( .B0(n529), .B1(n494), .A0N(REG2[5]), .A1N(n495), .Y(n209)
         );
  MX4X1M U504 ( .A(\regArr[4][2] ), .B(\regArr[5][2] ), .C(\regArr[6][2] ), 
        .D(\regArr[7][2] ), .S0(n472), .S1(n469), .Y(n447) );
  MX4X1M U505 ( .A(\regArr[4][3] ), .B(\regArr[5][3] ), .C(\regArr[6][3] ), 
        .D(\regArr[7][3] ), .S0(n472), .S1(n469), .Y(n451) );
  MX4X1M U506 ( .A(\regArr[4][4] ), .B(\regArr[5][4] ), .C(\regArr[6][4] ), 
        .D(\regArr[7][4] ), .S0(n472), .S1(n469), .Y(n455) );
  MX4X1M U507 ( .A(\regArr[4][5] ), .B(\regArr[5][5] ), .C(\regArr[6][5] ), 
        .D(\regArr[7][5] ), .S0(n473), .S1(n470), .Y(n459) );
  MX4X1M U508 ( .A(\regArr[4][6] ), .B(\regArr[5][6] ), .C(\regArr[6][6] ), 
        .D(\regArr[7][6] ), .S0(n473), .S1(n470), .Y(n463) );
  MX4X1M U509 ( .A(\regArr[4][7] ), .B(\regArr[5][7] ), .C(\regArr[6][7] ), 
        .D(\regArr[7][7] ), .S0(n473), .S1(n470), .Y(n467) );
  MX4X1M U510 ( .A(\regArr[12][2] ), .B(\regArr[13][2] ), .C(\regArr[14][2] ), 
        .D(\regArr[15][2] ), .S0(n472), .S1(n469), .Y(n445) );
  MX4X1M U511 ( .A(\regArr[12][3] ), .B(\regArr[13][3] ), .C(\regArr[14][3] ), 
        .D(\regArr[15][3] ), .S0(n472), .S1(n469), .Y(n449) );
  MX4X1M U512 ( .A(\regArr[12][4] ), .B(\regArr[13][4] ), .C(\regArr[14][4] ), 
        .D(\regArr[15][4] ), .S0(n472), .S1(n469), .Y(n453) );
  MX4X1M U513 ( .A(\regArr[12][5] ), .B(\regArr[13][5] ), .C(\regArr[14][5] ), 
        .D(\regArr[15][5] ), .S0(n473), .S1(n470), .Y(n457) );
  MX4X1M U514 ( .A(\regArr[12][6] ), .B(\regArr[13][6] ), .C(\regArr[14][6] ), 
        .D(\regArr[15][6] ), .S0(n473), .S1(n470), .Y(n461) );
  MX4X1M U515 ( .A(\regArr[12][7] ), .B(\regArr[13][7] ), .C(\regArr[14][7] ), 
        .D(\regArr[15][7] ), .S0(n473), .S1(n470), .Y(n465) );
  MX4X1M U516 ( .A(\regArr[4][0] ), .B(\regArr[5][0] ), .C(\regArr[6][0] ), 
        .D(\regArr[7][0] ), .S0(n471), .S1(n469), .Y(n439) );
  MX4X1M U517 ( .A(\regArr[4][1] ), .B(\regArr[5][1] ), .C(\regArr[6][1] ), 
        .D(\regArr[7][1] ), .S0(n471), .S1(n469), .Y(n443) );
  MX4X1M U518 ( .A(\regArr[12][0] ), .B(\regArr[13][0] ), .C(\regArr[14][0] ), 
        .D(\regArr[15][0] ), .S0(n471), .S1(n469), .Y(n437) );
  MX4X1M U519 ( .A(\regArr[12][1] ), .B(\regArr[13][1] ), .C(\regArr[14][1] ), 
        .D(\regArr[15][1] ), .S0(n471), .S1(n470), .Y(n441) );
  AO22X1M U520 ( .A0(N43), .A1(n532), .B0(n500), .B1(n668), .Y(n179) );
  MX4XLM U521 ( .A(n440), .B(n438), .C(n439), .D(n437), .S0(N14), .S1(N13), 
        .Y(N43) );
  MX4X1M U522 ( .A(\regArr[8][0] ), .B(\regArr[9][0] ), .C(\regArr[10][0] ), 
        .D(\regArr[11][0] ), .S0(n471), .S1(N12), .Y(n438) );
  AO22X1M U523 ( .A0(N42), .A1(n532), .B0(n500), .B1(n667), .Y(n180) );
  MX4XLM U524 ( .A(n444), .B(n442), .C(n443), .D(n441), .S0(N14), .S1(N13), 
        .Y(N42) );
  MX4X1M U525 ( .A(\regArr[8][1] ), .B(\regArr[9][1] ), .C(\regArr[10][1] ), 
        .D(\regArr[11][1] ), .S0(n471), .S1(N12), .Y(n442) );
  AO22X1M U526 ( .A0(N41), .A1(n532), .B0(n500), .B1(n666), .Y(n181) );
  MX4XLM U527 ( .A(n448), .B(n446), .C(n447), .D(n445), .S0(N14), .S1(N13), 
        .Y(N41) );
  MX4X1M U528 ( .A(\regArr[8][2] ), .B(\regArr[9][2] ), .C(\regArr[10][2] ), 
        .D(\regArr[11][2] ), .S0(n472), .S1(n469), .Y(n446) );
  AO22X1M U529 ( .A0(N40), .A1(n532), .B0(n500), .B1(n665), .Y(n182) );
  MX4XLM U530 ( .A(n452), .B(n450), .C(n451), .D(n449), .S0(N14), .S1(N13), 
        .Y(N40) );
  MX4X1M U531 ( .A(\regArr[8][3] ), .B(\regArr[9][3] ), .C(\regArr[10][3] ), 
        .D(\regArr[11][3] ), .S0(n472), .S1(n469), .Y(n450) );
  AO22X1M U532 ( .A0(N39), .A1(n532), .B0(n500), .B1(n664), .Y(n183) );
  MX4XLM U533 ( .A(n456), .B(n454), .C(n455), .D(n453), .S0(N14), .S1(N13), 
        .Y(N39) );
  MX4X1M U534 ( .A(\regArr[8][4] ), .B(\regArr[9][4] ), .C(\regArr[10][4] ), 
        .D(\regArr[11][4] ), .S0(n472), .S1(n469), .Y(n454) );
  AO22X1M U535 ( .A0(N38), .A1(n532), .B0(n500), .B1(n663), .Y(n184) );
  MX4XLM U536 ( .A(n460), .B(n458), .C(n459), .D(n457), .S0(N14), .S1(N13), 
        .Y(N38) );
  MX4X1M U537 ( .A(\regArr[8][5] ), .B(\regArr[9][5] ), .C(\regArr[10][5] ), 
        .D(\regArr[11][5] ), .S0(n473), .S1(n470), .Y(n458) );
  AO22X1M U538 ( .A0(N37), .A1(n532), .B0(n500), .B1(n662), .Y(n185) );
  MX4XLM U539 ( .A(n464), .B(n462), .C(n463), .D(n461), .S0(N14), .S1(N13), 
        .Y(N37) );
  MX4X1M U540 ( .A(\regArr[8][6] ), .B(\regArr[9][6] ), .C(\regArr[10][6] ), 
        .D(\regArr[11][6] ), .S0(n473), .S1(n470), .Y(n462) );
  AO22X1M U541 ( .A0(N36), .A1(n532), .B0(n500), .B1(n661), .Y(n186) );
  MX4XLM U542 ( .A(n468), .B(n466), .C(n467), .D(n465), .S0(N14), .S1(N13), 
        .Y(N36) );
  MX4X1M U543 ( .A(\regArr[8][7] ), .B(\regArr[9][7] ), .C(\regArr[10][7] ), 
        .D(\regArr[11][7] ), .S0(n473), .S1(n470), .Y(n466) );
  AO21XLM U544 ( .A0(n160), .A1(n545), .B0(n532), .Y(n187) );
  DLY1X1M U545 ( .A(REG2[1]), .Y(n543) );
  DLY1X1M U546 ( .A(REG3[0]), .Y(n544) );
  DLY1X1M U547 ( .A(RdData_VLD), .Y(n545) );
  DLY1X1M U548 ( .A(REG3[2]), .Y(n546) );
  DLY1X1M U549 ( .A(REG2[4]), .Y(n547) );
  DLY1X1M U550 ( .A(REG1[2]), .Y(n548) );
  DLY1X1M U551 ( .A(REG1[3]), .Y(n549) );
  DLY1X1M U552 ( .A(n666), .Y(RdData[2]) );
  DLY1X1M U553 ( .A(n665), .Y(RdData[3]) );
  DLY1X1M U554 ( .A(n664), .Y(RdData[4]) );
  DLY1X1M U555 ( .A(n668), .Y(RdData[0]) );
  DLY1X1M U556 ( .A(n667), .Y(RdData[1]) );
  DLY1X1M U557 ( .A(n663), .Y(RdData[5]) );
  DLY1X1M U558 ( .A(n662), .Y(RdData[6]) );
  DLY1X1M U559 ( .A(n661), .Y(RdData[7]) );
  DLY1X1M U560 ( .A(n670), .Y(REG2[2]) );
  DLY1X1M U561 ( .A(n669), .Y(REG2[7]) );
  DLY1X1M U562 ( .A(n674), .Y(REG3[4]) );
  DLY1X1M U563 ( .A(n673), .Y(REG3[5]) );
  DLY1X1M U564 ( .A(n672), .Y(REG3[6]) );
  DLY1X1M U565 ( .A(n671), .Y(REG3[7]) );
  DLY1X1M U566 ( .A(\regArr[14][1] ), .Y(n564) );
  DLY1X1M U567 ( .A(\regArr[14][2] ), .Y(n565) );
  DLY1X1M U568 ( .A(\regArr[14][3] ), .Y(n566) );
  DLY1X1M U569 ( .A(\regArr[14][4] ), .Y(n567) );
  DLY1X1M U570 ( .A(\regArr[14][5] ), .Y(n568) );
  DLY1X1M U571 ( .A(\regArr[14][6] ), .Y(n569) );
  DLY1X1M U572 ( .A(\regArr[14][7] ), .Y(n570) );
  DLY1X1M U573 ( .A(\regArr[6][0] ), .Y(n571) );
  DLY1X1M U574 ( .A(\regArr[6][1] ), .Y(n572) );
  DLY1X1M U575 ( .A(\regArr[6][2] ), .Y(n573) );
  DLY1X1M U576 ( .A(\regArr[6][3] ), .Y(n574) );
  DLY1X1M U577 ( .A(\regArr[6][4] ), .Y(n575) );
  DLY1X1M U578 ( .A(\regArr[6][5] ), .Y(n576) );
  DLY1X1M U579 ( .A(\regArr[6][6] ), .Y(n577) );
  DLY1X1M U580 ( .A(\regArr[6][7] ), .Y(n578) );
  DLY1X1M U581 ( .A(\regArr[10][0] ), .Y(n579) );
  DLY1X1M U582 ( .A(\regArr[14][0] ), .Y(n580) );
  DLY1X1M U583 ( .A(\regArr[10][1] ), .Y(n581) );
  DLY1X1M U584 ( .A(\regArr[10][2] ), .Y(n582) );
  DLY1X1M U585 ( .A(\regArr[10][3] ), .Y(n583) );
  DLY1X1M U586 ( .A(\regArr[10][4] ), .Y(n584) );
  DLY1X1M U587 ( .A(\regArr[10][5] ), .Y(n585) );
  DLY1X1M U588 ( .A(\regArr[10][6] ), .Y(n586) );
  DLY1X1M U589 ( .A(\regArr[10][7] ), .Y(n587) );
  DLY1X1M U590 ( .A(\regArr[5][0] ), .Y(n588) );
  DLY1X1M U591 ( .A(\regArr[5][1] ), .Y(n589) );
  DLY1X1M U592 ( .A(\regArr[5][2] ), .Y(n590) );
  DLY1X1M U593 ( .A(\regArr[5][3] ), .Y(n591) );
  DLY1X1M U594 ( .A(\regArr[5][4] ), .Y(n592) );
  DLY1X1M U595 ( .A(\regArr[5][5] ), .Y(n593) );
  DLY1X1M U596 ( .A(\regArr[5][6] ), .Y(n594) );
  DLY1X1M U597 ( .A(\regArr[5][7] ), .Y(n595) );
  DLY1X1M U598 ( .A(\regArr[13][2] ), .Y(n596) );
  DLY1X1M U599 ( .A(\regArr[13][1] ), .Y(n597) );
  DLY1X1M U600 ( .A(\regArr[13][3] ), .Y(n598) );
  DLY1X1M U601 ( .A(\regArr[13][0] ), .Y(n599) );
  DLY1X1M U602 ( .A(\regArr[13][4] ), .Y(n600) );
  DLY1X1M U603 ( .A(\regArr[13][5] ), .Y(n601) );
  DLY1X1M U604 ( .A(\regArr[13][6] ), .Y(n602) );
  DLY1X1M U605 ( .A(\regArr[13][7] ), .Y(n603) );
  DLY1X1M U606 ( .A(\regArr[9][0] ), .Y(n604) );
  DLY1X1M U607 ( .A(\regArr[9][1] ), .Y(n605) );
  DLY1X1M U608 ( .A(\regArr[9][2] ), .Y(n606) );
  DLY1X1M U609 ( .A(\regArr[9][3] ), .Y(n607) );
  DLY1X1M U610 ( .A(\regArr[9][4] ), .Y(n608) );
  DLY1X1M U611 ( .A(\regArr[9][5] ), .Y(n609) );
  DLY1X1M U612 ( .A(\regArr[9][6] ), .Y(n610) );
  DLY1X1M U613 ( .A(\regArr[9][7] ), .Y(n611) );
  DLY1X1M U614 ( .A(\regArr[7][0] ), .Y(n612) );
  DLY1X1M U615 ( .A(\regArr[7][1] ), .Y(n613) );
  DLY1X1M U616 ( .A(\regArr[7][2] ), .Y(n614) );
  DLY1X1M U617 ( .A(\regArr[7][3] ), .Y(n615) );
  DLY1X1M U618 ( .A(\regArr[7][4] ), .Y(n616) );
  DLY1X1M U619 ( .A(\regArr[7][5] ), .Y(n617) );
  DLY1X1M U620 ( .A(\regArr[7][6] ), .Y(n618) );
  DLY1X1M U621 ( .A(\regArr[7][7] ), .Y(n619) );
  DLY1X1M U622 ( .A(\regArr[11][0] ), .Y(n620) );
  DLY1X1M U623 ( .A(\regArr[15][0] ), .Y(n621) );
  DLY1X1M U624 ( .A(\regArr[11][1] ), .Y(n622) );
  DLY1X1M U625 ( .A(\regArr[11][2] ), .Y(n623) );
  DLY1X1M U626 ( .A(\regArr[11][3] ), .Y(n624) );
  DLY1X1M U627 ( .A(\regArr[11][4] ), .Y(n625) );
  DLY1X1M U628 ( .A(\regArr[11][5] ), .Y(n626) );
  DLY1X1M U629 ( .A(\regArr[11][6] ), .Y(n627) );
  DLY1X1M U630 ( .A(\regArr[11][7] ), .Y(n628) );
  DLY1X1M U631 ( .A(\regArr[15][1] ), .Y(n629) );
  DLY1X1M U632 ( .A(\regArr[15][2] ), .Y(n630) );
  DLY1X1M U633 ( .A(\regArr[15][3] ), .Y(n631) );
  DLY1X1M U634 ( .A(\regArr[15][4] ), .Y(n632) );
  DLY1X1M U635 ( .A(\regArr[15][5] ), .Y(n633) );
  DLY1X1M U636 ( .A(\regArr[15][6] ), .Y(n634) );
  DLY1X1M U637 ( .A(\regArr[15][7] ), .Y(test_so) );
  DLY1X1M U638 ( .A(\regArr[8][4] ), .Y(n636) );
  DLY1X1M U639 ( .A(\regArr[8][5] ), .Y(n637) );
  DLY1X1M U640 ( .A(\regArr[8][6] ), .Y(n638) );
  DLY1X1M U641 ( .A(\regArr[8][7] ), .Y(n639) );
  DLY1X1M U642 ( .A(\regArr[4][0] ), .Y(n640) );
  DLY1X1M U643 ( .A(\regArr[4][1] ), .Y(n641) );
  DLY1X1M U644 ( .A(\regArr[4][2] ), .Y(n642) );
  DLY1X1M U645 ( .A(\regArr[4][3] ), .Y(n643) );
  DLY1X1M U646 ( .A(\regArr[4][4] ), .Y(n644) );
  DLY1X1M U647 ( .A(\regArr[4][5] ), .Y(n645) );
  DLY1X1M U648 ( .A(\regArr[4][6] ), .Y(n646) );
  DLY1X1M U649 ( .A(\regArr[4][7] ), .Y(n647) );
  DLY1X1M U650 ( .A(\regArr[8][0] ), .Y(n648) );
  DLY1X1M U651 ( .A(\regArr[12][5] ), .Y(n649) );
  DLY1X1M U652 ( .A(\regArr[12][6] ), .Y(n650) );
  DLY1X1M U653 ( .A(\regArr[12][4] ), .Y(n651) );
  DLY1X1M U654 ( .A(\regArr[12][7] ), .Y(n652) );
  DLY1X1M U655 ( .A(\regArr[12][2] ), .Y(n653) );
  DLY1X1M U656 ( .A(\regArr[12][1] ), .Y(n654) );
  DLY1X1M U657 ( .A(\regArr[12][3] ), .Y(n655) );
  DLY1X1M U658 ( .A(\regArr[12][0] ), .Y(n656) );
  DLY1X1M U659 ( .A(\regArr[8][1] ), .Y(n657) );
  DLY1X1M U660 ( .A(\regArr[8][2] ), .Y(n658) );
  DLY1X1M U661 ( .A(\regArr[8][3] ), .Y(n659) );
  DLY1X1M U662 ( .A(REG2[0]), .Y(n660) );
  SDFFRQX1M \RdData_reg[7]  ( .D(n186), .SI(RdData[6]), .SE(test_se), .CK(CLK), 
        .RN(n510), .Q(n661) );
  SDFFRQX1M \RdData_reg[6]  ( .D(n185), .SI(RdData[5]), .SE(test_se), .CK(CLK), 
        .RN(n510), .Q(n662) );
  SDFFRQX1M \RdData_reg[5]  ( .D(n184), .SI(RdData[4]), .SE(test_se), .CK(CLK), 
        .RN(n510), .Q(n663) );
  SDFFRQX1M \RdData_reg[4]  ( .D(n183), .SI(RdData[3]), .SE(test_se), .CK(CLK), 
        .RN(n510), .Q(n664) );
  SDFFRQX1M \RdData_reg[0]  ( .D(n179), .SI(n545), .SE(test_se), .CK(CLK), 
        .RN(n515), .Q(n668) );
  SDFFRQX1M \RdData_reg[3]  ( .D(n182), .SI(RdData[2]), .SE(test_se), .CK(CLK), 
        .RN(n510), .Q(n665) );
  SDFFRQX1M \RdData_reg[2]  ( .D(n181), .SI(RdData[1]), .SE(test_se), .CK(CLK), 
        .RN(n510), .Q(n666) );
  SDFFRQX1M \RdData_reg[1]  ( .D(n180), .SI(RdData[0]), .SE(test_se), .CK(CLK), 
        .RN(n510), .Q(n667) );
  SDFFRQX1M \regArr_reg[14][7]  ( .D(n307), .SI(n569), .SE(test_se), .CK(CLK), 
        .RN(n519), .Q(\regArr[14][7] ) );
  SDFFRQX1M \regArr_reg[14][6]  ( .D(n306), .SI(n568), .SE(test_se), .CK(CLK), 
        .RN(n519), .Q(\regArr[14][6] ) );
  SDFFRQX1M \regArr_reg[14][5]  ( .D(n305), .SI(n567), .SE(test_se), .CK(CLK), 
        .RN(n519), .Q(\regArr[14][5] ) );
  SDFFRQX1M \regArr_reg[14][4]  ( .D(n304), .SI(n566), .SE(test_se), .CK(CLK), 
        .RN(n519), .Q(\regArr[14][4] ) );
  SDFFRQX1M \regArr_reg[14][3]  ( .D(n303), .SI(n565), .SE(test_se), .CK(CLK), 
        .RN(n519), .Q(\regArr[14][3] ) );
  SDFFRQX1M \regArr_reg[14][2]  ( .D(n302), .SI(n564), .SE(test_se), .CK(CLK), 
        .RN(n519), .Q(\regArr[14][2] ) );
  SDFFRQX1M \regArr_reg[14][1]  ( .D(n301), .SI(n580), .SE(test_se), .CK(CLK), 
        .RN(n519), .Q(\regArr[14][1] ) );
  SDFFRQX1M \regArr_reg[8][7]  ( .D(n259), .SI(n638), .SE(test_se), .CK(CLK), 
        .RN(n516), .Q(\regArr[8][7] ) );
  SDFFRQX1M \regArr_reg[8][6]  ( .D(n258), .SI(n637), .SE(test_se), .CK(CLK), 
        .RN(n516), .Q(\regArr[8][6] ) );
  SDFFRQX1M \regArr_reg[8][5]  ( .D(n257), .SI(n636), .SE(test_se), .CK(CLK), 
        .RN(n516), .Q(\regArr[8][5] ) );
  SDFFRQX1M \regArr_reg[8][4]  ( .D(n256), .SI(n659), .SE(test_se), .CK(CLK), 
        .RN(n516), .Q(\regArr[8][4] ) );
  SDFFRQX1M \regArr_reg[8][3]  ( .D(n255), .SI(n658), .SE(test_se), .CK(CLK), 
        .RN(n515), .Q(\regArr[8][3] ) );
  SDFFRQX1M \regArr_reg[8][2]  ( .D(n254), .SI(n657), .SE(test_se), .CK(CLK), 
        .RN(n515), .Q(\regArr[8][2] ) );
  SDFFRQX1M \regArr_reg[8][1]  ( .D(n253), .SI(n648), .SE(test_se), .CK(CLK), 
        .RN(n515), .Q(\regArr[8][1] ) );
  SDFFRQX1M \regArr_reg[10][7]  ( .D(n275), .SI(n586), .SE(test_se), .CK(CLK), 
        .RN(n517), .Q(\regArr[10][7] ) );
  SDFFSQX4M \regArr_reg[3][3]  ( .D(n215), .SI(n546), .SE(test_se), .CK(CLK), 
        .SN(RST), .Q(REG3[3]) );
endmodule


module ALU_DW_div_uns_0 ( a, b, quotient, remainder, divide_by_0 );
  input [7:0] a;
  input [7:0] b;
  output [7:0] quotient;
  output [7:0] remainder;
  output divide_by_0;
  wire   n27, n28, n29, \u_div/SumTmp[1][0] , \u_div/SumTmp[1][1] ,
         \u_div/SumTmp[1][2] , \u_div/SumTmp[1][3] , \u_div/SumTmp[1][4] ,
         \u_div/SumTmp[1][5] , \u_div/SumTmp[1][6] , \u_div/SumTmp[2][0] ,
         \u_div/SumTmp[2][1] , \u_div/SumTmp[2][2] , \u_div/SumTmp[2][3] ,
         \u_div/SumTmp[2][4] , \u_div/SumTmp[2][5] , \u_div/SumTmp[3][0] ,
         \u_div/SumTmp[3][1] , \u_div/SumTmp[3][2] , \u_div/SumTmp[3][3] ,
         \u_div/SumTmp[3][4] , \u_div/SumTmp[4][0] , \u_div/SumTmp[4][1] ,
         \u_div/SumTmp[4][2] , \u_div/SumTmp[4][3] , \u_div/SumTmp[5][0] ,
         \u_div/SumTmp[5][1] , \u_div/SumTmp[5][2] , \u_div/SumTmp[6][0] ,
         \u_div/SumTmp[6][1] , \u_div/SumTmp[7][0] , \u_div/CryTmp[0][1] ,
         \u_div/CryTmp[0][2] , \u_div/CryTmp[0][3] , \u_div/CryTmp[0][4] ,
         \u_div/CryTmp[0][5] , \u_div/CryTmp[0][6] , \u_div/CryTmp[0][7] ,
         \u_div/CryTmp[1][1] , \u_div/CryTmp[1][2] , \u_div/CryTmp[1][3] ,
         \u_div/CryTmp[1][4] , \u_div/CryTmp[1][5] , \u_div/CryTmp[1][6] ,
         \u_div/CryTmp[1][7] , \u_div/CryTmp[2][1] , \u_div/CryTmp[2][2] ,
         \u_div/CryTmp[2][3] , \u_div/CryTmp[2][4] , \u_div/CryTmp[2][5] ,
         \u_div/CryTmp[2][6] , \u_div/CryTmp[3][1] , \u_div/CryTmp[3][2] ,
         \u_div/CryTmp[3][3] , \u_div/CryTmp[3][4] , \u_div/CryTmp[3][5] ,
         \u_div/CryTmp[4][1] , \u_div/CryTmp[4][2] , \u_div/CryTmp[4][3] ,
         \u_div/CryTmp[4][4] , \u_div/CryTmp[5][1] , \u_div/CryTmp[5][2] ,
         \u_div/CryTmp[5][3] , \u_div/CryTmp[6][1] , \u_div/CryTmp[6][2] ,
         \u_div/CryTmp[7][1] , \u_div/PartRem[1][1] , \u_div/PartRem[1][2] ,
         \u_div/PartRem[1][3] , \u_div/PartRem[1][4] , \u_div/PartRem[1][5] ,
         \u_div/PartRem[1][6] , \u_div/PartRem[1][7] , \u_div/PartRem[2][1] ,
         \u_div/PartRem[2][2] , \u_div/PartRem[2][3] , \u_div/PartRem[2][4] ,
         \u_div/PartRem[2][5] , \u_div/PartRem[2][6] , \u_div/PartRem[3][1] ,
         \u_div/PartRem[3][2] , \u_div/PartRem[3][3] , \u_div/PartRem[3][4] ,
         \u_div/PartRem[3][5] , \u_div/PartRem[4][1] , \u_div/PartRem[4][2] ,
         \u_div/PartRem[4][3] , \u_div/PartRem[4][4] , \u_div/PartRem[5][1] ,
         \u_div/PartRem[5][2] , \u_div/PartRem[5][3] , \u_div/PartRem[6][1] ,
         \u_div/PartRem[6][2] , \u_div/PartRem[7][1] , n1, n2, n3, n4, n6, n9,
         n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n26, n30, n31, n32, n33, n34;

  ADDFX2M \u_div/u_fa_PartRem_0_0_4  ( .A(\u_div/PartRem[1][4] ), .B(n19), 
        .CI(\u_div/CryTmp[0][4] ), .CO(\u_div/CryTmp[0][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_1  ( .A(\u_div/PartRem[1][1] ), .B(n22), 
        .CI(\u_div/CryTmp[0][1] ), .CO(\u_div/CryTmp[0][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_6  ( .A(\u_div/PartRem[1][6] ), .B(n17), 
        .CI(\u_div/CryTmp[0][6] ), .CO(\u_div/CryTmp[0][7] ) );
  ADDFHX8M \u_div/u_fa_PartRem_0_1_2  ( .A(\u_div/PartRem[2][2] ), .B(n21), 
        .CI(\u_div/CryTmp[1][2] ), .CO(\u_div/CryTmp[1][3] ), .S(
        \u_div/SumTmp[1][2] ) );
  ADDFHX8M \u_div/u_fa_PartRem_0_1_3  ( .A(\u_div/PartRem[2][3] ), .B(n20), 
        .CI(\u_div/CryTmp[1][3] ), .CO(\u_div/CryTmp[1][4] ), .S(
        \u_div/SumTmp[1][3] ) );
  ADDFHX8M \u_div/u_fa_PartRem_0_5_1  ( .A(\u_div/PartRem[6][1] ), .B(n22), 
        .CI(\u_div/CryTmp[5][1] ), .CO(\u_div/CryTmp[5][2] ), .S(
        \u_div/SumTmp[5][1] ) );
  ADDFHX8M \u_div/u_fa_PartRem_0_5_2  ( .A(n9), .B(n21), .CI(
        \u_div/CryTmp[5][2] ), .CO(\u_div/CryTmp[5][3] ), .S(
        \u_div/SumTmp[5][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_3  ( .A(\u_div/PartRem[5][3] ), .B(n20), 
        .CI(\u_div/CryTmp[4][3] ), .CO(\u_div/CryTmp[4][4] ), .S(
        \u_div/SumTmp[4][3] ) );
  ADDFHX2M \u_div/u_fa_PartRem_0_0_5  ( .A(\u_div/PartRem[1][5] ), .B(n18), 
        .CI(\u_div/CryTmp[0][5] ), .CO(\u_div/CryTmp[0][6] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_2  ( .A(\u_div/PartRem[5][2] ), .B(n21), 
        .CI(\u_div/CryTmp[4][2] ), .CO(\u_div/CryTmp[4][3] ), .S(
        \u_div/SumTmp[4][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_1  ( .A(\u_div/PartRem[5][1] ), .B(n22), 
        .CI(\u_div/CryTmp[4][1] ), .CO(\u_div/CryTmp[4][2] ), .S(
        \u_div/SumTmp[4][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_3  ( .A(\u_div/PartRem[3][3] ), .B(n20), 
        .CI(\u_div/CryTmp[2][3] ), .CO(\u_div/CryTmp[2][4] ), .S(
        \u_div/SumTmp[2][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_1  ( .A(\u_div/PartRem[3][1] ), .B(n22), 
        .CI(\u_div/CryTmp[2][1] ), .CO(\u_div/CryTmp[2][2] ), .S(
        \u_div/SumTmp[2][1] ) );
  ADDFHX8M \u_div/u_fa_PartRem_0_1_6  ( .A(\u_div/PartRem[2][6] ), .B(n17), 
        .CI(\u_div/CryTmp[1][6] ), .CO(\u_div/CryTmp[1][7] ), .S(
        \u_div/SumTmp[1][6] ) );
  ADDFHX8M \u_div/u_fa_PartRem_0_6_1  ( .A(\u_div/PartRem[7][1] ), .B(n22), 
        .CI(\u_div/CryTmp[6][1] ), .CO(\u_div/CryTmp[6][2] ), .S(
        \u_div/SumTmp[6][1] ) );
  ADDFHX4M \u_div/u_fa_PartRem_0_0_2  ( .A(\u_div/PartRem[1][2] ), .B(n21), 
        .CI(\u_div/CryTmp[0][2] ), .CO(\u_div/CryTmp[0][3] ) );
  ADDFHX2M \u_div/u_fa_PartRem_0_0_3  ( .A(\u_div/PartRem[1][3] ), .B(n20), 
        .CI(\u_div/CryTmp[0][3] ), .CO(\u_div/CryTmp[0][4] ) );
  ADDFHX8M \u_div/u_fa_PartRem_0_1_5  ( .A(\u_div/PartRem[2][5] ), .B(n18), 
        .CI(\u_div/CryTmp[1][5] ), .CO(\u_div/CryTmp[1][6] ), .S(
        \u_div/SumTmp[1][5] ) );
  ADDFHX8M \u_div/u_fa_PartRem_0_1_4  ( .A(\u_div/PartRem[2][4] ), .B(n19), 
        .CI(\u_div/CryTmp[1][4] ), .CO(\u_div/CryTmp[1][5] ), .S(
        \u_div/SumTmp[1][4] ) );
  ADDFHX8M \u_div/u_fa_PartRem_0_1_1  ( .A(\u_div/PartRem[2][1] ), .B(n22), 
        .CI(\u_div/CryTmp[1][1] ), .CO(\u_div/CryTmp[1][2] ), .S(
        \u_div/SumTmp[1][1] ) );
  ADDFHX2M \u_div/u_fa_PartRem_0_0_7  ( .A(\u_div/PartRem[1][7] ), .B(n16), 
        .CI(\u_div/CryTmp[0][7] ), .CO(quotient[0]) );
  ADDFHX8M \u_div/u_fa_PartRem_0_3_4  ( .A(\u_div/PartRem[4][4] ), .B(n19), 
        .CI(n1), .CO(\u_div/CryTmp[3][5] ), .S(\u_div/SumTmp[3][4] ) );
  ADDFHX8M \u_div/u_fa_PartRem_0_3_1  ( .A(\u_div/PartRem[4][1] ), .B(n22), 
        .CI(\u_div/CryTmp[3][1] ), .CO(\u_div/CryTmp[3][2] ), .S(
        \u_div/SumTmp[3][1] ) );
  ADDFHX8M \u_div/u_fa_PartRem_0_3_2  ( .A(\u_div/PartRem[4][2] ), .B(n21), 
        .CI(\u_div/CryTmp[3][2] ), .CO(\u_div/CryTmp[3][3] ), .S(
        \u_div/SumTmp[3][2] ) );
  ADDFHX8M \u_div/u_fa_PartRem_0_3_3  ( .A(\u_div/PartRem[4][3] ), .B(n20), 
        .CI(\u_div/CryTmp[3][3] ), .CO(\u_div/CryTmp[3][4] ), .S(
        \u_div/SumTmp[3][3] ) );
  ADDFHX8M \u_div/u_fa_PartRem_0_2_5  ( .A(\u_div/PartRem[3][5] ), .B(n18), 
        .CI(\u_div/CryTmp[2][5] ), .CO(\u_div/CryTmp[2][6] ), .S(
        \u_div/SumTmp[2][5] ) );
  ADDFHX8M \u_div/u_fa_PartRem_0_2_4  ( .A(\u_div/PartRem[3][4] ), .B(n19), 
        .CI(\u_div/CryTmp[2][4] ), .CO(\u_div/CryTmp[2][5] ), .S(
        \u_div/SumTmp[2][4] ) );
  ADDFX4M \u_div/u_fa_PartRem_0_2_2  ( .A(\u_div/PartRem[3][2] ), .B(n21), 
        .CI(\u_div/CryTmp[2][2] ), .CO(\u_div/CryTmp[2][3] ), .S(
        \u_div/SumTmp[2][2] ) );
  CLKAND2X3M U1 ( .A(\u_div/CryTmp[2][6] ), .B(n2), .Y(n28) );
  BUFX14M U2 ( .A(\u_div/CryTmp[3][4] ), .Y(n1) );
  CLKAND2X16M U3 ( .A(\u_div/CryTmp[3][5] ), .B(n14), .Y(quotient[3]) );
  BUFX24M U4 ( .A(n26), .Y(n2) );
  AND3X12M U5 ( .A(n2), .B(n19), .C(n18), .Y(n25) );
  INVX32M U7 ( .A(n3), .Y(n6) );
  MX2X1M U8 ( .A(\u_div/PartRem[2][2] ), .B(\u_div/SumTmp[1][2] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][3] ) );
  CLKINVX40M U9 ( .A(n29), .Y(n3) );
  INVX16M U10 ( .A(n3), .Y(n4) );
  INVX2M U11 ( .A(n3), .Y(quotient[1]) );
  MX2XLM U12 ( .A(\u_div/PartRem[2][6] ), .B(\u_div/SumTmp[1][6] ), .S0(n6), 
        .Y(\u_div/PartRem[1][7] ) );
  MX2XLM U13 ( .A(\u_div/PartRem[2][5] ), .B(\u_div/SumTmp[1][5] ), .S0(n6), 
        .Y(\u_div/PartRem[1][6] ) );
  MX2XLM U14 ( .A(\u_div/PartRem[2][4] ), .B(\u_div/SumTmp[1][4] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][5] ) );
  MX2X4M U15 ( .A(a[1]), .B(\u_div/SumTmp[1][0] ), .S0(n4), .Y(
        \u_div/PartRem[1][1] ) );
  BUFX16M U16 ( .A(\u_div/PartRem[6][2] ), .Y(n9) );
  MX2X6M U17 ( .A(a[6]), .B(\u_div/SumTmp[6][0] ), .S0(quotient[6]), .Y(
        \u_div/PartRem[6][1] ) );
  NAND2X8M U18 ( .A(\u_div/SumTmp[7][0] ), .B(quotient[7]), .Y(n13) );
  CLKINVX16M U19 ( .A(quotient[7]), .Y(n11) );
  AND4X12M U20 ( .A(\u_div/CryTmp[7][1] ), .B(n24), .C(n22), .D(n21), .Y(
        quotient[7]) );
  MX2X4M U21 ( .A(\u_div/PartRem[6][1] ), .B(\u_div/SumTmp[5][1] ), .S0(
        quotient[5]), .Y(\u_div/PartRem[5][2] ) );
  BUFX20M U22 ( .A(n27), .Y(quotient[5]) );
  BUFX20M U23 ( .A(n15), .Y(quotient[4]) );
  CLKAND2X6M U24 ( .A(\u_div/CryTmp[4][4] ), .B(n25), .Y(n15) );
  BUFX24M U25 ( .A(n28), .Y(quotient[2]) );
  AND2X12M U26 ( .A(\u_div/CryTmp[1][7] ), .B(n16), .Y(n29) );
  CLKINVX1M U27 ( .A(b[7]), .Y(n16) );
  INVX32M U28 ( .A(b[5]), .Y(n18) );
  MX2X8M U29 ( .A(a[4]), .B(\u_div/SumTmp[4][0] ), .S0(quotient[4]), .Y(
        \u_div/PartRem[4][1] ) );
  MX2X8M U30 ( .A(a[3]), .B(\u_div/SumTmp[3][0] ), .S0(quotient[3]), .Y(
        \u_div/PartRem[3][1] ) );
  NAND2X6M U31 ( .A(a[7]), .B(n11), .Y(n12) );
  MX2X2M U32 ( .A(\u_div/PartRem[3][1] ), .B(\u_div/SumTmp[2][1] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][2] ) );
  MX2X2M U33 ( .A(\u_div/PartRem[5][1] ), .B(\u_div/SumTmp[4][1] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][2] ) );
  MX2X2M U34 ( .A(\u_div/PartRem[4][2] ), .B(\u_div/SumTmp[3][2] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][3] ) );
  MX2X2M U35 ( .A(\u_div/PartRem[3][3] ), .B(\u_div/SumTmp[2][3] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][4] ) );
  MX2XLM U36 ( .A(\u_div/PartRem[2][3] ), .B(\u_div/SumTmp[1][3] ), .S0(n6), 
        .Y(\u_div/PartRem[1][4] ) );
  MX2X1M U37 ( .A(\u_div/PartRem[3][2] ), .B(\u_div/SumTmp[2][2] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][3] ) );
  CLKMX2X12M U40 ( .A(\u_div/PartRem[4][1] ), .B(\u_div/SumTmp[3][1] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][2] ) );
  NOR2X12M U41 ( .A(b[6]), .B(b[7]), .Y(n26) );
  INVX32M U42 ( .A(b[0]), .Y(n23) );
  AND2X1M U43 ( .A(n2), .B(n18), .Y(n14) );
  AND2X1M U44 ( .A(\u_div/CryTmp[5][3] ), .B(n24), .Y(n27) );
  CLKNAND2X16M U45 ( .A(n12), .B(n13), .Y(\u_div/PartRem[7][1] ) );
  XNOR2X8M U46 ( .A(n23), .B(a[7]), .Y(\u_div/SumTmp[7][0] ) );
  INVX16M U47 ( .A(b[4]), .Y(n19) );
  AND2X8M U48 ( .A(n25), .B(n20), .Y(n24) );
  INVX24M U49 ( .A(b[3]), .Y(n20) );
  MX2X1M U50 ( .A(n9), .B(\u_div/SumTmp[5][2] ), .S0(quotient[5]), .Y(
        \u_div/PartRem[5][3] ) );
  MX2X1M U51 ( .A(\u_div/PartRem[4][3] ), .B(\u_div/SumTmp[3][3] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][4] ) );
  MX2X1M U52 ( .A(\u_div/PartRem[5][2] ), .B(\u_div/SumTmp[4][2] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][3] ) );
  MX2X1M U53 ( .A(\u_div/PartRem[4][4] ), .B(\u_div/SumTmp[3][4] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][5] ) );
  INVX20M U54 ( .A(b[1]), .Y(n22) );
  INVX20M U55 ( .A(b[2]), .Y(n21) );
  XNOR2X1M U56 ( .A(n23), .B(a[6]), .Y(\u_div/SumTmp[6][0] ) );
  AND3X4M U57 ( .A(n24), .B(n21), .C(\u_div/CryTmp[6][2] ), .Y(quotient[6]) );
  OR2X1M U58 ( .A(a[0]), .B(n23), .Y(\u_div/CryTmp[0][1] ) );
  XNOR2X1M U59 ( .A(n23), .B(a[4]), .Y(\u_div/SumTmp[4][0] ) );
  OR2X2M U60 ( .A(a[7]), .B(n23), .Y(\u_div/CryTmp[7][1] ) );
  MX2X1M U61 ( .A(\u_div/PartRem[7][1] ), .B(\u_div/SumTmp[6][1] ), .S0(
        quotient[6]), .Y(\u_div/PartRem[6][2] ) );
  MX2X1M U62 ( .A(\u_div/PartRem[5][3] ), .B(\u_div/SumTmp[4][3] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][4] ) );
  MX2X1M U63 ( .A(\u_div/PartRem[3][5] ), .B(\u_div/SumTmp[2][5] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][6] ) );
  XNOR2X1M U64 ( .A(n23), .B(a[3]), .Y(\u_div/SumTmp[3][0] ) );
  XNOR2X1M U65 ( .A(n23), .B(a[2]), .Y(\u_div/SumTmp[2][0] ) );
  XNOR2X1M U66 ( .A(n23), .B(a[5]), .Y(\u_div/SumTmp[5][0] ) );
  OR2X1M U67 ( .A(a[5]), .B(n23), .Y(\u_div/CryTmp[5][1] ) );
  OR2X1M U68 ( .A(a[4]), .B(n23), .Y(\u_div/CryTmp[4][1] ) );
  OR2X1M U69 ( .A(a[6]), .B(n23), .Y(\u_div/CryTmp[6][1] ) );
  XNOR2X1M U70 ( .A(n23), .B(a[1]), .Y(\u_div/SumTmp[1][0] ) );
  OR2X2M U71 ( .A(a[3]), .B(n23), .Y(\u_div/CryTmp[3][1] ) );
  OR2X2M U72 ( .A(a[1]), .B(n23), .Y(\u_div/CryTmp[1][1] ) );
  OR2X2M U73 ( .A(a[2]), .B(n23), .Y(\u_div/CryTmp[2][1] ) );
  INVX2M U74 ( .A(b[6]), .Y(n17) );
  CLKMX2X2M U75 ( .A(\u_div/PartRem[3][4] ), .B(\u_div/SumTmp[2][4] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][5] ) );
  DLY1X1M U6 ( .A(\u_div/SumTmp[5][0] ), .Y(n30) );
  DLY1X1M U38 ( .A(\u_div/SumTmp[2][0] ), .Y(n31) );
  MXI2X12M U39 ( .A(a[5]), .B(n30), .S0(quotient[5]), .Y(n32) );
  CLKINVX40M U76 ( .A(n32), .Y(\u_div/PartRem[5][1] ) );
  MXI2X12M U77 ( .A(a[2]), .B(n31), .S0(quotient[2]), .Y(n33) );
  CLKINVX40M U78 ( .A(n33), .Y(\u_div/PartRem[2][1] ) );
  MXI2X12M U79 ( .A(\u_div/PartRem[2][1] ), .B(\u_div/SumTmp[1][1] ), .S0(n6), 
        .Y(n34) );
  CLKINVX40M U80 ( .A(n34), .Y(\u_div/PartRem[1][2] ) );
endmodule


module ALU_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8;
  wire   [9:0] carry;

  ADDFX2M U2_1 ( .A(A[1]), .B(n7), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  ADDFX2M U2_7 ( .A(A[7]), .B(n1), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  ADDFX2M U2_5 ( .A(A[5]), .B(n3), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFX2M U2_4 ( .A(A[4]), .B(n4), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFX2M U2_3 ( .A(A[3]), .B(n5), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  ADDFX2M U2_2 ( .A(A[2]), .B(n6), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  ADDFX2M U2_6 ( .A(A[6]), .B(n2), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  CLKINVX1M U1 ( .A(B[0]), .Y(n8) );
  INVXLM U2 ( .A(B[1]), .Y(n7) );
  INVXLM U3 ( .A(B[4]), .Y(n4) );
  INVXLM U4 ( .A(B[5]), .Y(n3) );
  INVXLM U5 ( .A(B[2]), .Y(n6) );
  INVXLM U6 ( .A(B[3]), .Y(n5) );
  INVXLM U7 ( .A(B[6]), .Y(n2) );
  XNOR2X2M U8 ( .A(n8), .B(A[0]), .Y(DIFF[0]) );
  INVX2M U9 ( .A(B[7]), .Y(n1) );
  OR2X2M U10 ( .A(A[0]), .B(n8), .Y(carry[1]) );
  CLKINVX1M U11 ( .A(carry[8]), .Y(DIFF[8]) );
endmodule


module ALU_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [8:1] carry;

  ADDFX2M U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2M U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2M U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2M U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2M U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2M U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(SUM[8]), .S(SUM[7]) );
  ADDFX2M U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  AND2X1M U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  CLKXOR2X2M U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module ALU_DW01_add_1 ( A, B, CI, SUM, CO );
  input [13:0] A;
  input [13:0] B;
  output [13:0] SUM;
  input CI;
  output CO;
  wire   n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26;

  OAI21BX4M U2 ( .A0(n19), .A1(n20), .B0N(n21), .Y(n17) );
  AOI2BB1X2M U3 ( .A0N(n8), .A1N(n11), .B0(n10), .Y(n24) );
  NOR2X2M U4 ( .A(B[9]), .B(A[9]), .Y(n11) );
  NOR2X2M U5 ( .A(B[8]), .B(A[8]), .Y(n14) );
  NOR2X2M U6 ( .A(B[10]), .B(A[10]), .Y(n23) );
  NOR2X2M U7 ( .A(B[11]), .B(A[11]), .Y(n19) );
  CLKXOR2X2M U8 ( .A(B[13]), .B(n16), .Y(SUM[13]) );
  NAND2X2M U9 ( .A(A[7]), .B(B[7]), .Y(n13) );
  CLKXOR2X2M U10 ( .A(A[7]), .B(B[7]), .Y(SUM[7]) );
  INVX2M U11 ( .A(A[6]), .Y(n7) );
  INVX2M U12 ( .A(n7), .Y(SUM[6]) );
  BUFX2M U13 ( .A(A[0]), .Y(SUM[0]) );
  BUFX2M U14 ( .A(A[1]), .Y(SUM[1]) );
  BUFX2M U15 ( .A(A[2]), .Y(SUM[2]) );
  BUFX2M U16 ( .A(A[3]), .Y(SUM[3]) );
  BUFX2M U17 ( .A(A[4]), .Y(SUM[4]) );
  BUFX2M U18 ( .A(A[5]), .Y(SUM[5]) );
  XNOR2X1M U19 ( .A(n8), .B(n9), .Y(SUM[9]) );
  NOR2X1M U20 ( .A(n10), .B(n11), .Y(n9) );
  CLKXOR2X2M U21 ( .A(n12), .B(n13), .Y(SUM[8]) );
  NAND2BX1M U22 ( .AN(n14), .B(n15), .Y(n12) );
  OAI2BB1X1M U23 ( .A0N(n17), .A1N(A[12]), .B0(n18), .Y(n16) );
  OAI21X1M U24 ( .A0(A[12]), .A1(n17), .B0(B[12]), .Y(n18) );
  XOR3XLM U25 ( .A(B[12]), .B(A[12]), .C(n17), .Y(SUM[12]) );
  XNOR2X1M U26 ( .A(n20), .B(n22), .Y(SUM[11]) );
  NOR2X1M U27 ( .A(n21), .B(n19), .Y(n22) );
  AND2X1M U28 ( .A(B[11]), .B(A[11]), .Y(n21) );
  OA21X1M U29 ( .A0(n23), .A1(n24), .B0(n25), .Y(n20) );
  CLKXOR2X2M U30 ( .A(n26), .B(n24), .Y(SUM[10]) );
  AND2X1M U31 ( .A(B[9]), .B(A[9]), .Y(n10) );
  OA21X1M U32 ( .A0(n13), .A1(n14), .B0(n15), .Y(n8) );
  CLKNAND2X2M U33 ( .A(B[8]), .B(A[8]), .Y(n15) );
  NAND2BX1M U34 ( .AN(n23), .B(n25), .Y(n26) );
  CLKNAND2X2M U35 ( .A(B[10]), .B(A[10]), .Y(n25) );
endmodule


module ALU_DW02_mult_0 ( A, B, TC, PRODUCT );
  input [7:0] A;
  input [7:0] B;
  output [15:0] PRODUCT;
  input TC;
  wire   \ab[7][7] , \ab[7][6] , \ab[7][5] , \ab[7][4] , \ab[7][3] ,
         \ab[7][2] , \ab[7][1] , \ab[7][0] , \ab[6][7] , \ab[6][6] ,
         \ab[6][5] , \ab[6][4] , \ab[6][3] , \ab[6][2] , \ab[6][1] ,
         \ab[6][0] , \ab[5][7] , \ab[5][6] , \ab[5][5] , \ab[5][4] ,
         \ab[5][3] , \ab[5][2] , \ab[5][1] , \ab[5][0] , \ab[4][7] ,
         \ab[4][6] , \ab[4][5] , \ab[4][4] , \ab[4][3] , \ab[4][2] ,
         \ab[4][1] , \ab[4][0] , \ab[3][7] , \ab[3][6] , \ab[3][5] ,
         \ab[3][4] , \ab[3][3] , \ab[3][2] , \ab[3][1] , \ab[3][0] ,
         \ab[2][7] , \ab[2][6] , \ab[2][5] , \ab[2][4] , \ab[2][3] ,
         \ab[2][2] , \ab[2][1] , \ab[2][0] , \ab[1][7] , \ab[1][6] ,
         \ab[1][5] , \ab[1][4] , \ab[1][3] , \ab[1][2] , \ab[1][1] ,
         \ab[1][0] , \ab[0][7] , \ab[0][6] , \ab[0][5] , \ab[0][4] ,
         \ab[0][3] , \ab[0][2] , \ab[0][1] , \CARRYB[7][6] , \CARRYB[7][5] ,
         \CARRYB[7][4] , \CARRYB[7][3] , \CARRYB[7][2] , \CARRYB[7][1] ,
         \CARRYB[7][0] , \CARRYB[6][6] , \CARRYB[6][5] , \CARRYB[6][4] ,
         \CARRYB[6][3] , \CARRYB[6][2] , \CARRYB[6][1] , \CARRYB[6][0] ,
         \CARRYB[5][6] , \CARRYB[5][5] , \CARRYB[5][4] , \CARRYB[5][3] ,
         \CARRYB[5][2] , \CARRYB[5][1] , \CARRYB[5][0] , \CARRYB[4][6] ,
         \CARRYB[4][5] , \CARRYB[4][4] , \CARRYB[4][3] , \CARRYB[4][2] ,
         \CARRYB[4][1] , \CARRYB[4][0] , \CARRYB[3][6] , \CARRYB[3][5] ,
         \CARRYB[3][4] , \CARRYB[3][3] , \CARRYB[3][2] , \CARRYB[3][1] ,
         \CARRYB[3][0] , \CARRYB[2][6] , \CARRYB[2][5] , \CARRYB[2][4] ,
         \CARRYB[2][3] , \CARRYB[2][2] , \CARRYB[2][1] , \CARRYB[2][0] ,
         \SUMB[7][6] , \SUMB[7][5] , \SUMB[7][4] , \SUMB[7][3] , \SUMB[7][2] ,
         \SUMB[7][1] , \SUMB[7][0] , \SUMB[6][6] , \SUMB[6][5] , \SUMB[6][4] ,
         \SUMB[6][3] , \SUMB[6][2] , \SUMB[6][1] , \SUMB[5][6] , \SUMB[5][5] ,
         \SUMB[5][4] , \SUMB[5][3] , \SUMB[5][2] , \SUMB[5][1] , \SUMB[4][6] ,
         \SUMB[4][5] , \SUMB[4][4] , \SUMB[4][3] , \SUMB[4][2] , \SUMB[4][1] ,
         \SUMB[3][6] , \SUMB[3][5] , \SUMB[3][4] , \SUMB[3][3] , \SUMB[3][2] ,
         \SUMB[3][1] , \SUMB[2][6] , \SUMB[2][5] , \SUMB[2][4] , \SUMB[2][3] ,
         \SUMB[2][2] , \SUMB[2][1] , \SUMB[1][6] , \SUMB[1][5] , \SUMB[1][4] ,
         \SUMB[1][3] , \SUMB[1][2] , \SUMB[1][1] , \A1[12] , \A1[11] ,
         \A1[10] , \A1[9] , \A1[8] , \A1[7] , \A1[6] , \A1[4] , \A1[3] ,
         \A1[2] , \A1[1] , \A1[0] , n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32;

  ADDFX2M S5_6 ( .A(\ab[7][6] ), .B(\CARRYB[6][6] ), .CI(\ab[6][7] ), .CO(
        \CARRYB[7][6] ), .S(\SUMB[7][6] ) );
  ADDFX2M S3_6_6 ( .A(\ab[6][6] ), .B(\CARRYB[5][6] ), .CI(\ab[5][7] ), .CO(
        \CARRYB[6][6] ), .S(\SUMB[6][6] ) );
  ADDFX2M S4_5 ( .A(\ab[7][5] ), .B(\CARRYB[6][5] ), .CI(\SUMB[6][6] ), .CO(
        \CARRYB[7][5] ), .S(\SUMB[7][5] ) );
  ADDFX2M S1_6_0 ( .A(\ab[6][0] ), .B(\CARRYB[5][0] ), .CI(\SUMB[5][1] ), .CO(
        \CARRYB[6][0] ), .S(\A1[4] ) );
  ADDFX2M S1_5_0 ( .A(\ab[5][0] ), .B(\CARRYB[4][0] ), .CI(\SUMB[4][1] ), .CO(
        \CARRYB[5][0] ), .S(\A1[3] ) );
  ADDFX2M S1_4_0 ( .A(\ab[4][0] ), .B(\CARRYB[3][0] ), .CI(\SUMB[3][1] ), .CO(
        \CARRYB[4][0] ), .S(\A1[2] ) );
  ADDFX2M S1_3_0 ( .A(\ab[3][0] ), .B(\CARRYB[2][0] ), .CI(\SUMB[2][1] ), .CO(
        \CARRYB[3][0] ), .S(\A1[1] ) );
  ADDFX2M S1_2_0 ( .A(\ab[2][0] ), .B(n9), .CI(\SUMB[1][1] ), .CO(
        \CARRYB[2][0] ), .S(\A1[0] ) );
  ADDFX2M S2_6_5 ( .A(\ab[6][5] ), .B(\CARRYB[5][5] ), .CI(\SUMB[5][6] ), .CO(
        \CARRYB[6][5] ), .S(\SUMB[6][5] ) );
  ADDFX2M S3_5_6 ( .A(\ab[5][6] ), .B(\CARRYB[4][6] ), .CI(\ab[4][7] ), .CO(
        \CARRYB[5][6] ), .S(\SUMB[5][6] ) );
  ADDFX2M S4_0 ( .A(\ab[7][0] ), .B(\CARRYB[6][0] ), .CI(\SUMB[6][1] ), .CO(
        \CARRYB[7][0] ), .S(\SUMB[7][0] ) );
  ADDFX2M S4_4 ( .A(\ab[7][4] ), .B(\CARRYB[6][4] ), .CI(\SUMB[6][5] ), .CO(
        \CARRYB[7][4] ), .S(\SUMB[7][4] ) );
  ADDFX2M S2_6_3 ( .A(\ab[6][3] ), .B(\CARRYB[5][3] ), .CI(\SUMB[5][4] ), .CO(
        \CARRYB[6][3] ), .S(\SUMB[6][3] ) );
  ADDFX2M S2_5_4 ( .A(\ab[5][4] ), .B(\CARRYB[4][4] ), .CI(\SUMB[4][5] ), .CO(
        \CARRYB[5][4] ), .S(\SUMB[5][4] ) );
  ADDFX2M S2_6_1 ( .A(\ab[6][1] ), .B(\CARRYB[5][1] ), .CI(\SUMB[5][2] ), .CO(
        \CARRYB[6][1] ), .S(\SUMB[6][1] ) );
  ADDFX2M S2_6_2 ( .A(\ab[6][2] ), .B(\CARRYB[5][2] ), .CI(\SUMB[5][3] ), .CO(
        \CARRYB[6][2] ), .S(\SUMB[6][2] ) );
  ADDFX2M S2_4_5 ( .A(\ab[4][5] ), .B(\CARRYB[3][5] ), .CI(\SUMB[3][6] ), .CO(
        \CARRYB[4][5] ), .S(\SUMB[4][5] ) );
  ADDFX2M S2_5_1 ( .A(\ab[5][1] ), .B(\CARRYB[4][1] ), .CI(\SUMB[4][2] ), .CO(
        \CARRYB[5][1] ), .S(\SUMB[5][1] ) );
  ADDFX2M S2_5_2 ( .A(\ab[5][2] ), .B(\CARRYB[4][2] ), .CI(\SUMB[4][3] ), .CO(
        \CARRYB[5][2] ), .S(\SUMB[5][2] ) );
  ADDFX2M S2_5_3 ( .A(\ab[5][3] ), .B(\CARRYB[4][3] ), .CI(\SUMB[4][4] ), .CO(
        \CARRYB[5][3] ), .S(\SUMB[5][3] ) );
  ADDFX2M S2_4_1 ( .A(\ab[4][1] ), .B(\CARRYB[3][1] ), .CI(\SUMB[3][2] ), .CO(
        \CARRYB[4][1] ), .S(\SUMB[4][1] ) );
  ADDFX2M S2_4_2 ( .A(\ab[4][2] ), .B(\CARRYB[3][2] ), .CI(\SUMB[3][3] ), .CO(
        \CARRYB[4][2] ), .S(\SUMB[4][2] ) );
  ADDFX2M S2_4_3 ( .A(\ab[4][3] ), .B(\CARRYB[3][3] ), .CI(\SUMB[3][4] ), .CO(
        \CARRYB[4][3] ), .S(\SUMB[4][3] ) );
  ADDFX2M S2_3_1 ( .A(\ab[3][1] ), .B(\CARRYB[2][1] ), .CI(\SUMB[2][2] ), .CO(
        \CARRYB[3][1] ), .S(\SUMB[3][1] ) );
  ADDFX2M S2_3_2 ( .A(\ab[3][2] ), .B(\CARRYB[2][2] ), .CI(\SUMB[2][3] ), .CO(
        \CARRYB[3][2] ), .S(\SUMB[3][2] ) );
  ADDFX2M S2_3_3 ( .A(\ab[3][3] ), .B(\CARRYB[2][3] ), .CI(\SUMB[2][4] ), .CO(
        \CARRYB[3][3] ), .S(\SUMB[3][3] ) );
  ADDFX2M S2_3_5 ( .A(\ab[3][5] ), .B(\CARRYB[2][5] ), .CI(\SUMB[2][6] ), .CO(
        \CARRYB[3][5] ), .S(\SUMB[3][5] ) );
  ADDFX2M S2_2_1 ( .A(\ab[2][1] ), .B(n7), .CI(\SUMB[1][2] ), .CO(
        \CARRYB[2][1] ), .S(\SUMB[2][1] ) );
  ADDFX2M S2_6_4 ( .A(\ab[6][4] ), .B(\CARRYB[5][4] ), .CI(\SUMB[5][5] ), .CO(
        \CARRYB[6][4] ), .S(\SUMB[6][4] ) );
  ADDFX2M S2_5_5 ( .A(\ab[5][5] ), .B(\CARRYB[4][5] ), .CI(\SUMB[4][6] ), .CO(
        \CARRYB[5][5] ), .S(\SUMB[5][5] ) );
  ADDFX2M S2_4_4 ( .A(\ab[4][4] ), .B(\CARRYB[3][4] ), .CI(\SUMB[3][5] ), .CO(
        \CARRYB[4][4] ), .S(\SUMB[4][4] ) );
  ADDFX2M S2_3_4 ( .A(\ab[3][4] ), .B(\CARRYB[2][4] ), .CI(\SUMB[2][5] ), .CO(
        \CARRYB[3][4] ), .S(\SUMB[3][4] ) );
  ADDFX2M S3_4_6 ( .A(\ab[4][6] ), .B(\CARRYB[3][6] ), .CI(\ab[3][7] ), .CO(
        \CARRYB[4][6] ), .S(\SUMB[4][6] ) );
  ADDFX2M S3_3_6 ( .A(\ab[3][6] ), .B(\CARRYB[2][6] ), .CI(\ab[2][7] ), .CO(
        \CARRYB[3][6] ), .S(\SUMB[3][6] ) );
  ADDFX2M S3_2_6 ( .A(\ab[2][6] ), .B(n8), .CI(\ab[1][7] ), .CO(\CARRYB[2][6] ), .S(\SUMB[2][6] ) );
  ADDFX2M S2_2_3 ( .A(\ab[2][3] ), .B(n6), .CI(\SUMB[1][4] ), .CO(
        \CARRYB[2][3] ), .S(\SUMB[2][3] ) );
  ADDFX2M S2_2_4 ( .A(\ab[2][4] ), .B(n5), .CI(\SUMB[1][5] ), .CO(
        \CARRYB[2][4] ), .S(\SUMB[2][4] ) );
  ADDFX2M S2_2_5 ( .A(\ab[2][5] ), .B(n3), .CI(\SUMB[1][6] ), .CO(
        \CARRYB[2][5] ), .S(\SUMB[2][5] ) );
  ADDFX2M S4_1 ( .A(\ab[7][1] ), .B(\CARRYB[6][1] ), .CI(\SUMB[6][2] ), .CO(
        \CARRYB[7][1] ), .S(\SUMB[7][1] ) );
  ADDFX2M S4_3 ( .A(\ab[7][3] ), .B(\CARRYB[6][3] ), .CI(\SUMB[6][4] ), .CO(
        \CARRYB[7][3] ), .S(\SUMB[7][3] ) );
  ADDFX2M S4_2 ( .A(\ab[7][2] ), .B(\CARRYB[6][2] ), .CI(\SUMB[6][3] ), .CO(
        \CARRYB[7][2] ), .S(\SUMB[7][2] ) );
  ADDFX2M S2_2_2 ( .A(\ab[2][2] ), .B(n4), .CI(\SUMB[1][3] ), .CO(
        \CARRYB[2][2] ), .S(\SUMB[2][2] ) );
  CLKINVX4M U2 ( .A(B[0]), .Y(n24) );
  CLKINVX4M U3 ( .A(B[7]), .Y(n17) );
  AND2X2M U4 ( .A(\ab[0][6] ), .B(\ab[1][5] ), .Y(n3) );
  AND2X2M U5 ( .A(\ab[0][3] ), .B(\ab[1][2] ), .Y(n4) );
  AND2X2M U6 ( .A(\ab[0][5] ), .B(\ab[1][4] ), .Y(n5) );
  AND2X2M U7 ( .A(\ab[0][4] ), .B(\ab[1][3] ), .Y(n6) );
  AND2X2M U8 ( .A(\ab[0][2] ), .B(\ab[1][1] ), .Y(n7) );
  AND2X2M U9 ( .A(\ab[0][7] ), .B(\ab[1][6] ), .Y(n8) );
  AND2X2M U10 ( .A(\ab[0][1] ), .B(\ab[1][0] ), .Y(n9) );
  AND2X2M U11 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(n10) );
  NOR2X2M U12 ( .A(n18), .B(n32), .Y(\ab[0][6] ) );
  NOR2X2M U13 ( .A(n18), .B(n31), .Y(\ab[1][6] ) );
  NOR2X2M U14 ( .A(n19), .B(n32), .Y(\ab[0][5] ) );
  NOR2X2M U15 ( .A(n20), .B(n32), .Y(\ab[0][4] ) );
  NOR2X2M U16 ( .A(n21), .B(n32), .Y(\ab[0][3] ) );
  NOR2X2M U17 ( .A(n20), .B(n31), .Y(\ab[1][4] ) );
  NOR2X2M U18 ( .A(n21), .B(n31), .Y(\ab[1][3] ) );
  NOR2X2M U19 ( .A(n22), .B(n31), .Y(\ab[1][2] ) );
  CLKXOR2X2M U20 ( .A(\ab[1][5] ), .B(\ab[0][6] ), .Y(\SUMB[1][5] ) );
  NOR2X2M U21 ( .A(n22), .B(n32), .Y(\ab[0][2] ) );
  NOR2X2M U22 ( .A(n23), .B(n32), .Y(\ab[0][1] ) );
  NOR2X2M U23 ( .A(n19), .B(n31), .Y(\ab[1][5] ) );
  NOR2X2M U24 ( .A(n23), .B(n31), .Y(\ab[1][1] ) );
  NOR2X2M U25 ( .A(n24), .B(n31), .Y(\ab[1][0] ) );
  NOR2X2M U26 ( .A(n17), .B(n32), .Y(\ab[0][7] ) );
  NOR2X2M U27 ( .A(n25), .B(n17), .Y(\ab[7][7] ) );
  CLKINVX4M U28 ( .A(A[5]), .Y(n27) );
  CLKINVX4M U29 ( .A(A[6]), .Y(n26) );
  CLKINVX4M U30 ( .A(A[7]), .Y(n25) );
  CLKINVX4M U31 ( .A(B[2]), .Y(n22) );
  CLKINVX4M U32 ( .A(B[3]), .Y(n21) );
  CLKINVX4M U33 ( .A(B[4]), .Y(n20) );
  CLKINVX4M U34 ( .A(B[5]), .Y(n19) );
  CLKINVX4M U35 ( .A(B[1]), .Y(n23) );
  CLKINVX4M U36 ( .A(B[6]), .Y(n18) );
  CLKXOR2X2M U37 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(\A1[8] ) );
  INVX4M U38 ( .A(A[1]), .Y(n31) );
  AND2X2M U39 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(n11) );
  CLKXOR2X2M U40 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(\A1[7] ) );
  CLKXOR2X2M U41 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(\A1[9] ) );
  INVX4M U42 ( .A(A[2]), .Y(n30) );
  AND2X2M U43 ( .A(\CARRYB[7][0] ), .B(\SUMB[7][1] ), .Y(n12) );
  AND2X2M U44 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(n13) );
  CLKXOR2X2M U45 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(\A1[10] ) );
  INVX4M U46 ( .A(A[3]), .Y(n29) );
  INVX4M U47 ( .A(A[4]), .Y(n28) );
  AND2X2M U48 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(n14) );
  CLKXOR2X2M U49 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(\A1[11] ) );
  AND2X2M U50 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(n15) );
  CLKXOR2X2M U51 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(\A1[12] ) );
  AND2X2M U52 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(n16) );
  CLKXOR2X2M U53 ( .A(\CARRYB[7][0] ), .B(\SUMB[7][1] ), .Y(\A1[6] ) );
  XOR2X1M U54 ( .A(\ab[1][0] ), .B(\ab[0][1] ), .Y(PRODUCT[1]) );
  XOR2X1M U55 ( .A(\ab[1][3] ), .B(\ab[0][4] ), .Y(\SUMB[1][3] ) );
  INVX4M U56 ( .A(A[0]), .Y(n32) );
  XOR2X1M U57 ( .A(\ab[1][6] ), .B(\ab[0][7] ), .Y(\SUMB[1][6] ) );
  XOR2X1M U58 ( .A(\ab[1][4] ), .B(\ab[0][5] ), .Y(\SUMB[1][4] ) );
  XOR2X1M U59 ( .A(\ab[1][2] ), .B(\ab[0][3] ), .Y(\SUMB[1][2] ) );
  XOR2X1M U60 ( .A(\ab[1][1] ), .B(\ab[0][2] ), .Y(\SUMB[1][1] ) );
  NOR2X1M U62 ( .A(n25), .B(n18), .Y(\ab[7][6] ) );
  NOR2X1M U63 ( .A(n25), .B(n19), .Y(\ab[7][5] ) );
  NOR2X1M U64 ( .A(n25), .B(n20), .Y(\ab[7][4] ) );
  NOR2X1M U65 ( .A(n25), .B(n21), .Y(\ab[7][3] ) );
  NOR2X1M U66 ( .A(n25), .B(n22), .Y(\ab[7][2] ) );
  NOR2X1M U67 ( .A(n25), .B(n23), .Y(\ab[7][1] ) );
  NOR2X1M U68 ( .A(n25), .B(n24), .Y(\ab[7][0] ) );
  NOR2X1M U69 ( .A(n17), .B(n26), .Y(\ab[6][7] ) );
  NOR2X1M U70 ( .A(n18), .B(n26), .Y(\ab[6][6] ) );
  NOR2X1M U71 ( .A(n19), .B(n26), .Y(\ab[6][5] ) );
  NOR2X1M U72 ( .A(n20), .B(n26), .Y(\ab[6][4] ) );
  NOR2X1M U73 ( .A(n21), .B(n26), .Y(\ab[6][3] ) );
  NOR2X1M U74 ( .A(n22), .B(n26), .Y(\ab[6][2] ) );
  NOR2X1M U75 ( .A(n23), .B(n26), .Y(\ab[6][1] ) );
  NOR2X1M U76 ( .A(n24), .B(n26), .Y(\ab[6][0] ) );
  NOR2X1M U77 ( .A(n17), .B(n27), .Y(\ab[5][7] ) );
  NOR2X1M U78 ( .A(n18), .B(n27), .Y(\ab[5][6] ) );
  NOR2X1M U79 ( .A(n19), .B(n27), .Y(\ab[5][5] ) );
  NOR2X1M U80 ( .A(n20), .B(n27), .Y(\ab[5][4] ) );
  NOR2X1M U81 ( .A(n21), .B(n27), .Y(\ab[5][3] ) );
  NOR2X1M U82 ( .A(n22), .B(n27), .Y(\ab[5][2] ) );
  NOR2X1M U83 ( .A(n23), .B(n27), .Y(\ab[5][1] ) );
  NOR2X1M U84 ( .A(n24), .B(n27), .Y(\ab[5][0] ) );
  NOR2X1M U85 ( .A(n17), .B(n28), .Y(\ab[4][7] ) );
  NOR2X1M U86 ( .A(n18), .B(n28), .Y(\ab[4][6] ) );
  NOR2X1M U87 ( .A(n19), .B(n28), .Y(\ab[4][5] ) );
  NOR2X1M U88 ( .A(n20), .B(n28), .Y(\ab[4][4] ) );
  NOR2X1M U89 ( .A(n21), .B(n28), .Y(\ab[4][3] ) );
  NOR2X1M U90 ( .A(n22), .B(n28), .Y(\ab[4][2] ) );
  NOR2X1M U91 ( .A(n23), .B(n28), .Y(\ab[4][1] ) );
  NOR2X1M U92 ( .A(n24), .B(n28), .Y(\ab[4][0] ) );
  NOR2X1M U93 ( .A(n17), .B(n29), .Y(\ab[3][7] ) );
  NOR2X1M U94 ( .A(n18), .B(n29), .Y(\ab[3][6] ) );
  NOR2X1M U95 ( .A(n19), .B(n29), .Y(\ab[3][5] ) );
  NOR2X1M U96 ( .A(n20), .B(n29), .Y(\ab[3][4] ) );
  NOR2X1M U97 ( .A(n21), .B(n29), .Y(\ab[3][3] ) );
  NOR2X1M U98 ( .A(n22), .B(n29), .Y(\ab[3][2] ) );
  NOR2X1M U99 ( .A(n23), .B(n29), .Y(\ab[3][1] ) );
  NOR2X1M U100 ( .A(n24), .B(n29), .Y(\ab[3][0] ) );
  NOR2X1M U101 ( .A(n17), .B(n30), .Y(\ab[2][7] ) );
  NOR2X1M U102 ( .A(n18), .B(n30), .Y(\ab[2][6] ) );
  NOR2X1M U103 ( .A(n19), .B(n30), .Y(\ab[2][5] ) );
  NOR2X1M U104 ( .A(n20), .B(n30), .Y(\ab[2][4] ) );
  NOR2X1M U105 ( .A(n21), .B(n30), .Y(\ab[2][3] ) );
  NOR2X1M U106 ( .A(n22), .B(n30), .Y(\ab[2][2] ) );
  NOR2X1M U107 ( .A(n23), .B(n30), .Y(\ab[2][1] ) );
  NOR2X1M U108 ( .A(n24), .B(n30), .Y(\ab[2][0] ) );
  NOR2X1M U109 ( .A(n17), .B(n31), .Y(\ab[1][7] ) );
  NOR2X1M U110 ( .A(n24), .B(n32), .Y(PRODUCT[0]) );
  ALU_DW01_add_1 FS_1 ( .A({1'b0, \A1[12] , \A1[11] , \A1[10] , \A1[9] , 
        \A1[8] , \A1[7] , \A1[6] , \SUMB[7][0] , \A1[4] , \A1[3] , \A1[2] , 
        \A1[1] , \A1[0] }), .B({n10, n16, n15, n14, n13, n11, n12, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CI(1'b0), .SUM(PRODUCT[15:2]) );
endmodule


module ALU_test_1 ( A, B, EN, ALU_FUN, CLK, RST, ALU_OUT, OUT_VALID, test_si, 
        test_se );
  input [7:0] A;
  input [7:0] B;
  input [3:0] ALU_FUN;
  output [15:0] ALU_OUT;
  input EN, CLK, RST, test_si, test_se;
  output OUT_VALID;
  wire   N91, N92, N93, N94, N95, N96, N97, N98, N99, N100, N101, N102, N103,
         N104, N105, N106, N107, N108, N109, N110, N111, N112, N113, N114,
         N115, N116, N117, N118, N119, N120, N121, N122, N123, N124, N125,
         N126, N127, N128, N129, N130, N131, N132, N157, N158, N159, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n60, n61, n62, n63, n64, n65,
         n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79,
         n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93,
         n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122, n123, n124, n3, n4, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n58, n59, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151,
         n152, n153, n154, n155, n156, n157, n158, n159, n160, n161, n162,
         n163, n164, n165, n166, n167, n168, n169, n170, n171, n172, n173,
         n174, n175, n176, n177, n178, n179, n180, n181, n182, n183, n184,
         n185, n186, n187, n188, n189, n190, n191, n192, n193, n194, n195,
         n196, n197, n198, n199, n200;
  wire   [15:0] ALU_OUT_Comb;

  OAI2BB1X4M U94 ( .A0N(n117), .A1N(n116), .B0(n118), .Y(n65) );
  SDFFRQX1M \ALU_OUT_reg[1]  ( .D(ALU_OUT_Comb[1]), .SI(ALU_OUT[0]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[1]) );
  SDFFRQX1M OUT_VALID_reg ( .D(EN), .SI(ALU_OUT[15]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(OUT_VALID) );
  SDFFRQX1M \ALU_OUT_reg[4]  ( .D(ALU_OUT_Comb[4]), .SI(ALU_OUT[3]), .SE(
        test_se), .CK(CLK), .RN(n149), .Q(ALU_OUT[4]) );
  SDFFRQX1M \ALU_OUT_reg[3]  ( .D(ALU_OUT_Comb[3]), .SI(ALU_OUT[2]), .SE(
        test_se), .CK(CLK), .RN(n150), .Q(ALU_OUT[3]) );
  SDFFRQX1M \ALU_OUT_reg[5]  ( .D(ALU_OUT_Comb[5]), .SI(ALU_OUT[4]), .SE(
        test_se), .CK(CLK), .RN(n149), .Q(ALU_OUT[5]) );
  SDFFRQX1M \ALU_OUT_reg[6]  ( .D(ALU_OUT_Comb[6]), .SI(ALU_OUT[5]), .SE(
        test_se), .CK(CLK), .RN(n149), .Q(ALU_OUT[6]) );
  SDFFRQX1M \ALU_OUT_reg[7]  ( .D(ALU_OUT_Comb[7]), .SI(ALU_OUT[6]), .SE(
        test_se), .CK(CLK), .RN(n149), .Q(ALU_OUT[7]) );
  SDFFRQX1M \ALU_OUT_reg[9]  ( .D(ALU_OUT_Comb[9]), .SI(ALU_OUT[8]), .SE(
        test_se), .CK(CLK), .RN(n149), .Q(ALU_OUT[9]) );
  SDFFRQX1M \ALU_OUT_reg[8]  ( .D(ALU_OUT_Comb[8]), .SI(ALU_OUT[7]), .SE(
        test_se), .CK(CLK), .RN(n149), .Q(ALU_OUT[8]) );
  SDFFRQX1M \ALU_OUT_reg[10]  ( .D(ALU_OUT_Comb[10]), .SI(ALU_OUT[9]), .SE(
        test_se), .CK(CLK), .RN(n149), .Q(ALU_OUT[10]) );
  SDFFRQX1M \ALU_OUT_reg[2]  ( .D(ALU_OUT_Comb[2]), .SI(ALU_OUT[1]), .SE(
        test_se), .CK(CLK), .RN(n150), .Q(ALU_OUT[2]) );
  SDFFRQX1M \ALU_OUT_reg[11]  ( .D(ALU_OUT_Comb[11]), .SI(ALU_OUT[10]), .SE(
        test_se), .CK(CLK), .RN(n149), .Q(ALU_OUT[11]) );
  SDFFRQX1M \ALU_OUT_reg[12]  ( .D(ALU_OUT_Comb[12]), .SI(ALU_OUT[11]), .SE(
        test_se), .CK(CLK), .RN(n149), .Q(ALU_OUT[12]) );
  SDFFRQX1M \ALU_OUT_reg[13]  ( .D(ALU_OUT_Comb[13]), .SI(ALU_OUT[12]), .SE(
        test_se), .CK(CLK), .RN(n149), .Q(ALU_OUT[13]) );
  SDFFRQX1M \ALU_OUT_reg[14]  ( .D(ALU_OUT_Comb[14]), .SI(ALU_OUT[13]), .SE(
        test_se), .CK(CLK), .RN(n149), .Q(ALU_OUT[14]) );
  SDFFRQX1M \ALU_OUT_reg[15]  ( .D(ALU_OUT_Comb[15]), .SI(ALU_OUT[14]), .SE(
        test_se), .CK(CLK), .RN(n149), .Q(ALU_OUT[15]) );
  SDFFRQX1M \ALU_OUT_reg[0]  ( .D(ALU_OUT_Comb[0]), .SI(test_si), .SE(test_se), 
        .CK(CLK), .RN(n150), .Q(ALU_OUT[0]) );
  AOI31X4M U7 ( .A0(n110), .A1(n111), .A2(n112), .B0(n186), .Y(ALU_OUT_Comb[0]) );
  CLKINVX1M U23 ( .A(B[0]), .Y(n179) );
  AOI2BB2X1M U24 ( .B0(N117), .B1(n141), .A0N(n138), .A1N(n53), .Y(n51) );
  INVX32M U25 ( .A(n138), .Y(n139) );
  INVX20M U26 ( .A(A[7]), .Y(n138) );
  NOR2X4M U27 ( .A(n187), .B(n43), .Y(n122) );
  INVX4M U28 ( .A(A[6]), .Y(n136) );
  BUFX4M U29 ( .A(n66), .Y(n39) );
  INVX2M U30 ( .A(n151), .Y(n150) );
  AOI222X4M U31 ( .A0(N109), .A1(n141), .B0(n45), .B1(n143), .C0(N125), .C1(
        n39), .Y(n111) );
  AOI2B1X1M U32 ( .A1N(n176), .A0(n175), .B0(n174), .Y(n177) );
  INVX2M U33 ( .A(n177), .Y(N158) );
  OR2X2M U34 ( .A(n124), .B(n188), .Y(n3) );
  NAND2X2M U35 ( .A(n116), .B(n122), .Y(n4) );
  INVX2M U36 ( .A(n44), .Y(n184) );
  INVX2M U37 ( .A(B[3]), .Y(n183) );
  INVX2M U38 ( .A(B[2]), .Y(n181) );
  OAI21X2M U39 ( .A0(B[0]), .A1(n119), .B0(n120), .Y(n113) );
  INVX2M U40 ( .A(A[4]), .Y(n130) );
  INVX2M U41 ( .A(A[5]), .Y(n133) );
  XNOR2X4M U59 ( .A(n137), .B(n44), .Y(n171) );
  OAI31X2M U60 ( .A0(n164), .A1(n155), .A2(n154), .B0(n165), .Y(n157) );
  AOI211X2M U61 ( .A0(n58), .A1(n180), .B0(n161), .C0(n153), .Y(n154) );
  AOI211X2M U62 ( .A0(n162), .A1(n199), .B0(n161), .C0(n160), .Y(n163) );
  NAND2BX2M U63 ( .AN(n155), .B(n166), .Y(n161) );
  OAI21X2M U64 ( .A0(n174), .A1(n159), .B0(n175), .Y(N159) );
  NOR3BX2M U65 ( .AN(n122), .B(n190), .C(ALU_FUN[2]), .Y(n66) );
  AOI31X2M U66 ( .A0(n92), .A1(n93), .A2(n94), .B0(n186), .Y(ALU_OUT_Comb[2])
         );
  NOR3X2M U67 ( .A(n40), .B(n41), .C(n42), .Y(n93) );
  NOR2X2M U68 ( .A(n181), .B(n126), .Y(n155) );
  NOR2X2M U69 ( .A(n179), .B(n45), .Y(n152) );
  NOR2X2M U70 ( .A(n183), .B(n129), .Y(n164) );
  CLKBUFX4M U71 ( .A(B[6]), .Y(n44) );
  NOR2X2M U72 ( .A(n43), .B(ALU_FUN[0]), .Y(n117) );
  BUFX6M U73 ( .A(A[0]), .Y(n45) );
  OAI21X1M U74 ( .A0(B[1]), .A1(n104), .B0(n105), .Y(n101) );
  INVXLM U75 ( .A(B[4]), .Y(n194) );
  INVXLM U76 ( .A(B[5]), .Y(n193) );
  NOR2X2M U77 ( .A(n178), .B(B[7]), .Y(n174) );
  AND2X2M U78 ( .A(N111), .B(n141), .Y(n40) );
  AND2X2M U79 ( .A(n126), .B(n142), .Y(n41) );
  AND2X1M U80 ( .A(N127), .B(n39), .Y(n42) );
  INVX4M U81 ( .A(n4), .Y(n142) );
  INVX4M U82 ( .A(n4), .Y(n143) );
  INVX4M U83 ( .A(n3), .Y(n145) );
  INVX4M U84 ( .A(n3), .Y(n144) );
  OAI2BB1X2M U85 ( .A0N(N124), .A1N(n48), .B0(n49), .Y(ALU_OUT_Comb[15]) );
  OAI2BB1X2M U86 ( .A0N(N123), .A1N(n48), .B0(n49), .Y(ALU_OUT_Comb[14]) );
  OAI2BB1X2M U87 ( .A0N(N122), .A1N(n48), .B0(n49), .Y(ALU_OUT_Comb[13]) );
  OAI2BB1X2M U88 ( .A0N(N121), .A1N(n48), .B0(n49), .Y(ALU_OUT_Comb[12]) );
  OAI2BB1X2M U89 ( .A0N(N120), .A1N(n48), .B0(n49), .Y(ALU_OUT_Comb[11]) );
  OAI2BB1X2M U90 ( .A0N(N119), .A1N(n48), .B0(n49), .Y(ALU_OUT_Comb[10]) );
  OAI2BB1X2M U91 ( .A0N(N118), .A1N(n48), .B0(n49), .Y(ALU_OUT_Comb[9]) );
  CLKBUFX6M U92 ( .A(n64), .Y(n148) );
  OAI2BB1X2M U93 ( .A0N(n191), .A1N(n122), .B0(n118), .Y(n64) );
  BUFX4M U95 ( .A(n63), .Y(n146) );
  BUFX4M U96 ( .A(n63), .Y(n147) );
  NOR2BX8M U97 ( .AN(n141), .B(n186), .Y(n48) );
  CLKAND2X6M U98 ( .A(n123), .B(n122), .Y(n67) );
  INVX4M U99 ( .A(n108), .Y(n189) );
  INVX2M U100 ( .A(n117), .Y(n188) );
  CLKBUFX6M U101 ( .A(n54), .Y(n140) );
  NOR2BX2M U102 ( .AN(n123), .B(n188), .Y(n54) );
  INVX2M U103 ( .A(n124), .Y(n191) );
  AND4X1M U104 ( .A(N159), .B(n116), .C(n43), .D(n187), .Y(n107) );
  AOI31X2M U105 ( .A0(n68), .A1(n69), .A2(n70), .B0(n186), .Y(ALU_OUT_Comb[6])
         );
  AOI22X1M U106 ( .A0(N106), .A1(n67), .B0(N97), .B1(n140), .Y(n68) );
  AOI221X2M U107 ( .A0(n189), .A1(n139), .B0(n145), .B1(n136), .C0(n71), .Y(
        n70) );
  AOI222X2M U108 ( .A0(N115), .A1(n141), .B0(n142), .B1(n137), .C0(N131), .C1(
        n39), .Y(n69) );
  INVX4M U109 ( .A(ALU_FUN[0]), .Y(n187) );
  INVX4M U110 ( .A(ALU_FUN[1]), .Y(n190) );
  NOR2X4M U111 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n123) );
  NAND3X2M U112 ( .A(n123), .B(ALU_FUN[0]), .C(n43), .Y(n118) );
  AND2X2M U113 ( .A(ALU_FUN[2]), .B(n190), .Y(n116) );
  AND3X2M U114 ( .A(n123), .B(n187), .C(n43), .Y(n63) );
  NAND3X4M U115 ( .A(n191), .B(n187), .C(n43), .Y(n53) );
  NAND2X4M U116 ( .A(EN), .B(n185), .Y(n49) );
  NAND2X2M U117 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n124) );
  NAND3X2M U118 ( .A(n43), .B(ALU_FUN[0]), .C(n116), .Y(n108) );
  CLKBUFX6M U119 ( .A(n52), .Y(n141) );
  NOR3X2M U120 ( .A(n188), .B(ALU_FUN[2]), .C(n190), .Y(n52) );
  INVX2M U121 ( .A(n139), .Y(n178) );
  INVX6M U122 ( .A(EN), .Y(n186) );
  INVX4M U123 ( .A(n58), .Y(n199) );
  INVX2M U124 ( .A(n126), .Y(n198) );
  INVX2M U125 ( .A(n129), .Y(n197) );
  INVX2M U126 ( .A(n132), .Y(n196) );
  INVX2M U127 ( .A(n135), .Y(n195) );
  INVX6M U128 ( .A(n151), .Y(n149) );
  AOI22X1M U129 ( .A0(N100), .A1(n67), .B0(N91), .B1(n140), .Y(n110) );
  AOI211X2M U130 ( .A0(n145), .A1(n200), .B0(n113), .C0(n114), .Y(n112) );
  AOI31X2M U131 ( .A0(n98), .A1(n99), .A2(n100), .B0(n186), .Y(ALU_OUT_Comb[1]) );
  AOI222X2M U132 ( .A0(N92), .A1(n140), .B0(N110), .B1(n141), .C0(N101), .C1(
        n67), .Y(n98) );
  AOI211X2M U133 ( .A0(n126), .A1(n189), .B0(n101), .C0(n102), .Y(n100) );
  AOI222X2M U134 ( .A0(N126), .A1(n39), .B0(n144), .B1(n199), .C0(n58), .C1(
        n142), .Y(n99) );
  AOI22X1M U135 ( .A0(N102), .A1(n67), .B0(N93), .B1(n140), .Y(n92) );
  AOI221X2M U136 ( .A0(n129), .A1(n189), .B0(n145), .B1(n198), .C0(n95), .Y(
        n94) );
  INVX4M U137 ( .A(n133), .Y(n134) );
  INVX4M U138 ( .A(n46), .Y(n47) );
  AOI31X2M U139 ( .A0(n86), .A1(n87), .A2(n88), .B0(n186), .Y(ALU_OUT_Comb[3])
         );
  AOI22X1M U140 ( .A0(N103), .A1(n67), .B0(N94), .B1(n140), .Y(n86) );
  AOI221X2M U141 ( .A0(n132), .A1(n189), .B0(n145), .B1(n197), .C0(n89), .Y(
        n88) );
  AOI222X2M U142 ( .A0(N112), .A1(n141), .B0(n129), .B1(n143), .C0(N128), .C1(
        n39), .Y(n87) );
  INVX4M U143 ( .A(n59), .Y(n125) );
  INVX4M U144 ( .A(n130), .Y(n131) );
  INVX4M U145 ( .A(n127), .Y(n128) );
  AOI31X2M U146 ( .A0(n80), .A1(n81), .A2(n82), .B0(n186), .Y(ALU_OUT_Comb[4])
         );
  AOI22X1M U147 ( .A0(N104), .A1(n67), .B0(N95), .B1(n140), .Y(n80) );
  AOI221X2M U148 ( .A0(n189), .A1(n135), .B0(n145), .B1(n196), .C0(n83), .Y(
        n82) );
  AOI222X2M U149 ( .A0(N113), .A1(n141), .B0(n132), .B1(n142), .C0(N129), .C1(
        n39), .Y(n81) );
  INVX4M U150 ( .A(n59), .Y(n126) );
  AOI31X2M U151 ( .A0(n74), .A1(n75), .A2(n76), .B0(n186), .Y(ALU_OUT_Comb[5])
         );
  AOI22X1M U152 ( .A0(N105), .A1(n67), .B0(N96), .B1(n140), .Y(n74) );
  AOI221X2M U153 ( .A0(n189), .A1(n137), .B0(n145), .B1(n195), .C0(n77), .Y(
        n76) );
  AOI222X2M U154 ( .A0(N114), .A1(n141), .B0(n135), .B1(n143), .C0(N130), .C1(
        n39), .Y(n75) );
  AOI31X2M U155 ( .A0(n55), .A1(n56), .A2(n57), .B0(n186), .Y(ALU_OUT_Comb[7])
         );
  AOI22X1M U156 ( .A0(N107), .A1(n67), .B0(N98), .B1(n140), .Y(n55) );
  AOI221X2M U157 ( .A0(n145), .A1(n138), .B0(n143), .B1(n139), .C0(n60), .Y(
        n57) );
  AOI22X1M U158 ( .A0(N132), .A1(n39), .B0(N116), .B1(n141), .Y(n56) );
  INVX4M U159 ( .A(n127), .Y(n129) );
  INVX4M U160 ( .A(n46), .Y(n58) );
  AOI21X2M U161 ( .A0(n50), .A1(n51), .B0(n186), .Y(ALU_OUT_Comb[8]) );
  AOI21X2M U162 ( .A0(N99), .A1(n140), .B0(n185), .Y(n50) );
  INVX4M U163 ( .A(n130), .Y(n132) );
  OAI222X1M U164 ( .A0(n72), .A1(n184), .B0(n44), .B1(n73), .C0(n53), .C1(n195), .Y(n71) );
  AOI221X2M U165 ( .A0(n137), .A1(n146), .B0(n148), .B1(n136), .C0(n144), .Y(
        n73) );
  AOI221X2M U166 ( .A0(n147), .A1(n136), .B0(n137), .B1(n65), .C0(n143), .Y(
        n72) );
  CLKBUFX6M U167 ( .A(ALU_FUN[3]), .Y(n43) );
  INVX4M U168 ( .A(n136), .Y(n137) );
  INVX4M U169 ( .A(n133), .Y(n135) );
  INVX2M U170 ( .A(n109), .Y(n185) );
  AOI211X2M U171 ( .A0(N108), .A1(n67), .B0(n145), .C0(n148), .Y(n109) );
  INVX2M U172 ( .A(n45), .Y(n200) );
  INVX2M U173 ( .A(RST), .Y(n151) );
  INVX2M U174 ( .A(A[1]), .Y(n46) );
  INVX2M U175 ( .A(A[2]), .Y(n59) );
  INVX2M U176 ( .A(A[3]), .Y(n127) );
  INVXLM U177 ( .A(n152), .Y(n180) );
  AOI221X2M U178 ( .A0(n45), .A1(n146), .B0(n148), .B1(n200), .C0(n144), .Y(
        n119) );
  AOI31X2M U179 ( .A0(N157), .A1(n43), .A2(n121), .B0(n107), .Y(n120) );
  NOR3X2M U180 ( .A(n190), .B(ALU_FUN[2]), .C(ALU_FUN[0]), .Y(n121) );
  INVXLM U181 ( .A(n163), .Y(n182) );
  AOI221X2M U182 ( .A0(n58), .A1(n146), .B0(n148), .B1(n199), .C0(n144), .Y(
        n104) );
  AOI31X2M U183 ( .A0(N158), .A1(n43), .A2(n106), .B0(n107), .Y(n105) );
  NOR3X2M U184 ( .A(n187), .B(ALU_FUN[2]), .C(n190), .Y(n106) );
  OAI222X1M U185 ( .A0(n61), .A1(n192), .B0(B[7]), .B1(n62), .C0(n53), .C1(
        n136), .Y(n60) );
  INVX2M U186 ( .A(B[7]), .Y(n192) );
  AOI221X2M U187 ( .A0(n147), .A1(n139), .B0(n148), .B1(n178), .C0(n145), .Y(
        n62) );
  AOI221X2M U188 ( .A0(n147), .A1(n178), .B0(n139), .B1(n65), .C0(n142), .Y(
        n61) );
  OAI222X1M U189 ( .A0(n84), .A1(n194), .B0(B[4]), .B1(n85), .C0(n53), .C1(
        n197), .Y(n83) );
  AOI221X2M U190 ( .A0(n132), .A1(n146), .B0(n148), .B1(n196), .C0(n144), .Y(
        n85) );
  AOI221X2M U191 ( .A0(n147), .A1(n196), .B0(n132), .B1(n65), .C0(n143), .Y(
        n84) );
  OAI222X1M U192 ( .A0(n78), .A1(n193), .B0(B[5]), .B1(n79), .C0(n53), .C1(
        n196), .Y(n77) );
  AOI221X2M U193 ( .A0(n135), .A1(n146), .B0(n148), .B1(n195), .C0(n144), .Y(
        n79) );
  AOI221X2M U194 ( .A0(n147), .A1(n195), .B0(n135), .B1(n65), .C0(n142), .Y(
        n78) );
  OAI222X1M U195 ( .A0(n96), .A1(n181), .B0(B[2]), .B1(n97), .C0(n53), .C1(
        n199), .Y(n95) );
  AOI221X2M U196 ( .A0(n126), .A1(n146), .B0(n148), .B1(n198), .C0(n144), .Y(
        n97) );
  AOI221X2M U197 ( .A0(n147), .A1(n198), .B0(n126), .B1(n65), .C0(n143), .Y(
        n96) );
  OAI222X1M U198 ( .A0(n90), .A1(n183), .B0(B[3]), .B1(n91), .C0(n53), .C1(
        n198), .Y(n89) );
  AOI221X2M U199 ( .A0(n129), .A1(n146), .B0(n148), .B1(n197), .C0(n144), .Y(
        n91) );
  AOI221X2M U200 ( .A0(n147), .A1(n197), .B0(n129), .B1(n65), .C0(n142), .Y(
        n90) );
  OAI2B2X1M U201 ( .A1N(B[1]), .A0(n103), .B0(n53), .B1(n200), .Y(n102) );
  AOI221X2M U202 ( .A0(n147), .A1(n199), .B0(n58), .B1(n65), .C0(n142), .Y(
        n103) );
  OAI2B2X1M U203 ( .A1N(B[0]), .A0(n115), .B0(n108), .B1(n199), .Y(n114) );
  AOI221X2M U204 ( .A0(n146), .A1(n200), .B0(n45), .B1(n65), .C0(n143), .Y(
        n115) );
  NAND2BX1M U205 ( .AN(B[4]), .B(n132), .Y(n167) );
  NAND2BX1M U206 ( .AN(n132), .B(B[4]), .Y(n156) );
  CLKNAND2X2M U207 ( .A(n167), .B(n156), .Y(n169) );
  CLKNAND2X2M U208 ( .A(n126), .B(n181), .Y(n166) );
  AOI21X1M U209 ( .A0(n152), .A1(n199), .B0(B[1]), .Y(n153) );
  CLKNAND2X2M U210 ( .A(n129), .B(n183), .Y(n165) );
  NAND2BX1M U211 ( .AN(n135), .B(B[5]), .Y(n172) );
  OAI211X1M U212 ( .A0(n169), .A1(n157), .B0(n156), .C0(n172), .Y(n158) );
  NAND2BX1M U213 ( .AN(B[5]), .B(n135), .Y(n168) );
  AOI32X1M U214 ( .A0(n158), .A1(n168), .A2(n171), .B0(n44), .B1(n136), .Y(
        n159) );
  CLKNAND2X2M U215 ( .A(B[7]), .B(n178), .Y(n175) );
  CLKNAND2X2M U216 ( .A(n45), .B(n179), .Y(n162) );
  OA21X1M U217 ( .A0(n162), .A1(n199), .B0(B[1]), .Y(n160) );
  AOI31X1M U218 ( .A0(n182), .A1(n166), .A2(n165), .B0(n164), .Y(n170) );
  OAI2B11X1M U219 ( .A1N(n170), .A0(n169), .B0(n168), .C0(n167), .Y(n173) );
  AOI32X1M U220 ( .A0(n173), .A1(n172), .A2(n171), .B0(n137), .B1(n184), .Y(
        n176) );
  NOR2X1M U221 ( .A(N159), .B(N158), .Y(N157) );
  ALU_DW_div_uns_0 div_52 ( .a({n139, A[6], n134, n131, n128, n125, n47, n45}), 
        .b(B), .quotient({N132, N131, N130, N129, N128, N127, N126, N125}) );
  ALU_DW01_sub_0 sub_46 ( .A({1'b0, n139, n137, n134, n131, n128, n125, n47, 
        n45}), .B({1'b0, B[7], n44, B[5:0]}), .CI(1'b0), .DIFF({N108, N107, 
        N106, N105, N104, N103, N102, N101, N100}) );
  ALU_DW01_add_0 add_43 ( .A({1'b0, n139, n137, n134, n131, n128, n125, n47, 
        n45}), .B({1'b0, B[7], n44, B[5:0]}), .CI(1'b0), .SUM({N99, N98, N97, 
        N96, N95, N94, N93, N92, N91}) );
  ALU_DW02_mult_0 mult_49 ( .A({n139, n137, n134, n131, n128, n125, n47, n45}), 
        .B({B[7], n44, B[5:0]}), .TC(1'b0), .PRODUCT({N124, N123, N122, N121, 
        N120, N119, N118, N117, N116, N115, N114, N113, N112, N111, N110, N109}) );
endmodule


module CLK_GATE ( CLK_EN, CLK, GATED_CLK );
  input CLK_EN, CLK;
  output GATED_CLK;


  TLATNCAX12M U0_TLATNCAX12M ( .E(CLK_EN), .CK(CLK), .ECK(GATED_CLK) );
endmodule


module SYS_TOP ( scan_clk, scan_rst, test_mode, SE, SI, SO, RST_N, UART_CLK, 
        REF_CLK, UART_RX_IN, UART_TX_O, parity_error, framing_error );
  input [2:0] SI;
  output [1:0] SO;
  input scan_clk, scan_rst, test_mode, SE, RST_N, UART_CLK, REF_CLK,
         UART_RX_IN;
  output UART_TX_O, parity_error, framing_error;
  wire   n16, REF_SCAN_CLK, RX_SCAN_CLK, UART_TX_CLK, TX_SCAN_CLK,
         RST_SCAN_RST, SYNC_REF_RST, REF_SCAN_RST, SYNC_UART_RST,
         UART_SCAN_RST, UART_RX_V_OUT, UART_RX_V_SYNC, UART_TX_VLD,
         UART_TX_V_SYNC, UART_TX_Busy, UART_TX_Busy_SYNC, RF_RdData_VLD,
         RF_WrEn, RF_RdEn, ALU_EN, ALU_OUT_VLD, CLKG_EN, ALU_CLK, _0_net_, n1,
         n2, n3, n4, n5, n7, n9, n10, n11, n12, n13, n14, n15, n18, n19, n20,
         n21, n22, n23;
  wire   [7:0] UART_RX_OUT;
  wire   [7:0] UART_RX_SYNC;
  wire   [7:0] UART_TX_IN;
  wire   [7:0] UART_TX_SYNC;
  wire   [7:0] DIV_RATIO;
  wire   [7:0] UART_Config;
  wire   [7:0] RF_RdData;
  wire   [3:0] RF_Address;
  wire   [7:0] RF_WrData;
  wire   [3:0] ALU_FUN;
  wire   [15:0] ALU_OUT;
  wire   [7:0] Operand_A;
  wire   [7:0] Operand_B;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4;

  INVX2M U2 ( .A(n15), .Y(n14) );
  INVX2M U3 ( .A(n13), .Y(n1) );
  CLKINVX2M U4 ( .A(n14), .Y(n2) );
  INVX2M U5 ( .A(n2), .Y(n3) );
  CLKINVX2M U6 ( .A(n2), .Y(n4) );
  INVX2M U7 ( .A(n2), .Y(n5) );
  INVX2M U8 ( .A(n13), .Y(n12) );
  BUFX2M U9 ( .A(RF_Address[1]), .Y(n11) );
  BUFX2M U10 ( .A(RF_Address[0]), .Y(n10) );
  OR2X2M U11 ( .A(CLKG_EN), .B(test_mode), .Y(_0_net_) );
  BUFX2M U12 ( .A(UART_RX_IN), .Y(n9) );
  INVX2M U13 ( .A(REF_SCAN_RST), .Y(n15) );
  INVX2M U14 ( .A(UART_SCAN_RST), .Y(n13) );
  CLKINVX1M U16 ( .A(n16), .Y(n7) );
  CLKINVX40M U17 ( .A(n7), .Y(UART_TX_O) );
  CLKBUFX40M U18 ( .A(framing_error), .Y(SO[1]) );
  mux2X1_0 U0_mux2X1 ( .IN_0(REF_CLK), .IN_1(scan_clk), .SEL(test_mode), .OUT(
        REF_SCAN_CLK) );
  mux2X1_5 U1_mux2X1 ( .IN_0(UART_CLK), .IN_1(scan_clk), .SEL(test_mode), 
        .OUT(RX_SCAN_CLK) );
  mux2X1_4 U2_mux2X1 ( .IN_0(UART_TX_CLK), .IN_1(scan_clk), .SEL(test_mode), 
        .OUT(TX_SCAN_CLK) );
  mux2X1_3 U3_mux2X1 ( .IN_0(RST_N), .IN_1(scan_rst), .SEL(test_mode), .OUT(
        RST_SCAN_RST) );
  mux2X1_2 U4_mux2X1 ( .IN_0(SYNC_REF_RST), .IN_1(scan_rst), .SEL(test_mode), 
        .OUT(REF_SCAN_RST) );
  mux2X1_1 U5_mux2X1 ( .IN_0(SYNC_UART_RST), .IN_1(scan_rst), .SEL(test_mode), 
        .OUT(UART_SCAN_RST) );
  RST_SYNC_test_0 U0_RST_SYNC ( .RST(RST_SCAN_RST), .CLK(RX_SCAN_CLK), 
        .SYNC_RST(SYNC_UART_RST), .test_si(n23), .test_se(SE) );
  RST_SYNC_test_1 U1_RST_SYNC ( .RST(RST_SCAN_RST), .CLK(REF_SCAN_CLK), 
        .SYNC_RST(SYNC_REF_RST), .test_si(n19), .test_se(SE) );
  DATA_SYNC_test_0 U0_ref_sync ( .dest_clk(REF_SCAN_CLK), .dest_rst(n3), 
        .unsync_bus(UART_RX_OUT), .bus_enable(UART_RX_V_OUT), .sync_bus(
        UART_RX_SYNC), .enable_pulse_d(UART_RX_V_SYNC), .test_si(
        UART_TX_Busy_SYNC), .test_so(n19), .test_se(SE) );
  DATA_SYNC_test_1 U1_uart_sync ( .dest_clk(TX_SCAN_CLK), .dest_rst(n1), 
        .unsync_bus(UART_TX_IN), .bus_enable(UART_TX_VLD), .sync_bus(
        UART_TX_SYNC), .enable_pulse_d(UART_TX_V_SYNC), .test_si(SYNC_REF_RST), 
        .test_so(n18), .test_se(SE) );
  BIT_SYNC_test_1 U0_bit_sync ( .dest_clk(REF_SCAN_CLK), .dest_rst(n4), 
        .unsync_bit(UART_TX_Busy), .sync_bit(UART_TX_Busy_SYNC), .test_si(n20), 
        .test_se(SE) );
  ClkDiv_test_1 U0_ClkDiv ( .i_ref_clk(RX_SCAN_CLK), .i_rst(n12), .i_clk_en(
        1'b1), .i_div_ratio(DIV_RATIO[3:0]), .o_div_clk(UART_TX_CLK), 
        .test_si(ALU_OUT_VLD), .test_so(n23), .test_se(SE) );
  UART_test_1 U0_UART ( .RST(n12), .TX_CLK(TX_SCAN_CLK), .RX_CLK(RX_SCAN_CLK), 
        .RX_IN_S(n9), .RX_OUT_P(UART_RX_OUT), .RX_OUT_V(UART_RX_V_OUT), 
        .TX_IN_P(UART_TX_SYNC), .TX_IN_V(UART_TX_V_SYNC), .TX_OUT_S(n16), 
        .TX_OUT_V(UART_TX_Busy), .Prescale(UART_Config[6:2]), .parity_enable(
        UART_Config[0]), .parity_type(UART_Config[1]), .parity_error(
        parity_error), .framing_error(framing_error), .test_si2(n18), 
        .test_si1(n21), .test_so1(n20), .test_se(SE) );
  SYS_CTRL_test_1 U0_SYS_CTRL ( .CLK(REF_SCAN_CLK), .RST(n14), .RF_RdData(
        RF_RdData), .RF_RdData_VLD(RF_RdData_VLD), .RF_WrEn(RF_WrEn), 
        .RF_RdEn(RF_RdEn), .RF_Address(RF_Address), .RF_WrData(RF_WrData), 
        .ALU_OUT(ALU_OUT), .ALU_OUT_VLD(ALU_OUT_VLD), .ALU_EN(ALU_EN), 
        .ALU_FUN(ALU_FUN), .CLKG_EN(CLKG_EN), .UART_RX_DATA(UART_RX_SYNC), 
        .UART_RX_VLD(UART_RX_V_SYNC), .UART_TX_Busy(UART_TX_Busy_SYNC), 
        .UART_TX_DATA(UART_TX_IN), .UART_TX_VLD(UART_TX_VLD), .test_si(n22), 
        .test_so(n21), .test_se(SE) );
  RegFile_test_1 U0_RegFile ( .CLK(REF_SCAN_CLK), .RST(n4), .WrEn(RF_WrEn), 
        .RdEn(RF_RdEn), .Address({RF_Address[3:2], n11, n10}), .WrData(
        RF_WrData), .RdData(RF_RdData), .RdData_VLD(RF_RdData_VLD), .REG0(
        Operand_A), .REG1(Operand_B), .REG2({SYNOPSYS_UNCONNECTED__0, 
        UART_Config[6:0]}), .REG3({SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, DIV_RATIO[3:0]}), .test_si(SYNC_UART_RST), 
        .test_so(n22), .test_se(SE) );
  ALU_test_1 U0_ALU ( .A(Operand_A), .B(Operand_B), .EN(ALU_EN), .ALU_FUN(
        ALU_FUN), .CLK(ALU_CLK), .RST(n5), .ALU_OUT(ALU_OUT), .OUT_VALID(
        ALU_OUT_VLD), .test_si(SI[2]), .test_se(SE) );
  CLK_GATE U0_CLK_GATE ( .CLK_EN(_0_net_), .CLK(REF_SCAN_CLK), .GATED_CLK(
        ALU_CLK) );
endmodule

