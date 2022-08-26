
module ClkDiv_tb ; 
           
 reg         i_ref_clk_tb ;              // Reference clock
 reg         i_rst_tb  ;                 // Reset Signal
 reg         i_clk_en_tb ;               // clock divider enable
 reg  [3:0]  i_div_ratio_tb ;            // clock divition ratio
 wire        o_div_clk_tb  ;             // Divided clock

   
   
  // ----------------------- initial block --------------------------------------------------
   
   initial
     begin    
        $dumpfile("ClkDiv.vcd") ;
        $dumpvars;

        i_ref_clk_tb = 1'b0 ;
        i_rst_tb = 1'b1 ;
        i_clk_en_tb = 1'b1 ;
        i_div_ratio_tb = 4'd7 ;
        #4
        i_rst_tb = 1'b0 ;
        #4
        i_rst_tb = 1'b1 ;
   
        #200
        $finish ;
      
    end // initial begin

   

   // --------------------------------- Clock generator ----------------------------------------

   always #5  i_ref_clk_tb = ~i_ref_clk_tb ;  



//instantiate ClkDiv module 
              
ClkDiv #(.RATIO_WD(4)) DUT 
(
.i_ref_clk(i_ref_clk_tb) ,             
.i_rst(i_rst_tb) ,                 
.i_clk_en(i_clk_en_tb) ,    
.i_div_ratio(i_div_ratio_tb),          
.o_div_clk(o_div_clk_tb)               
);





endmodule  
