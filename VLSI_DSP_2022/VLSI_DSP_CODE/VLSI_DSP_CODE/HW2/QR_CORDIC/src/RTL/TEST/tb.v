`timescale 1ns/10ps
`define CYCLE      12.0             // Modify your clock period here
`define End_CYCLE  10000000             // Modify cycle times once your design need more cycle times!

`define ORI        "/home/rain/QR_CORDIC/TESBED/matrix_ori.txt"
`define EXP        "/home/rain/QR_CORDIC/TESBED/matrix_exp.txt"
//`define DEL        "D:/QR_CORDIC/TESBED/delta.txt"

`ifdef RTL
  `include "/home/rain/QR_CORDIC/QR_CORDIC.v"
`endif

`ifdef GATE
  `include "./Netlist/QR_CORDIC_SYN.v"
  `define SDFFILE    "Netlist/QR_CORDIC_SYN.sdf"    // Modify your sdf file name
`endif

`ifdef POST
  `include "./Post_sim/QR_CORDIC_SYN_pr.v"
  `define SDFFILE    "./Post_sim/QR_CORDIC_SYN_pr.sdf"    // Modify your sdf file name
`endif

  /*
  `ifdef FSDB
     $fsdbDumpfile("DT.fsdb");
     $fsdbDumpvars;
     $fsdbDumpMDA(u_sti_ROM.sti_M);
     $fsdbDumpMDA(u_res_RAM.res_M);
     `elsif VCD
            $dumpfile("DT.vcd");
     $dumpvars;
  `endif
  */

module tb;

  parameter DATA_LENGTH = 13;
  parameter NUM_SIGN    = 2;
  parameter ITER_IDX    = 3;
  parameter N_PAT = 32;

  reg  [DATA_LENGTH-1:0]   exp  [0:N_PAT-1];
  reg  [DATA_LENGTH-1:0]   ori  [0:N_PAT-1];
  //reg  [18:0]         del  ;
  reg                 valid;
  wire                out_vallid;
  reg  [4*DATA_LENGTH-1:0]         in;
  wire [4*DATA_LENGTH-1:0]         out;

  integer   i,f,s;

  reg  pass_chk,start;
  reg  [8:0] count;

  reg   clk = 0;
  reg   rst_n;

initial begin
  `ifdef GATE
      $sdf_annotate(`SDFFILE, inst_QR_CORDIC);
  `endif
  `ifdef POST
      $sdf_annotate(`SDFFILE, inst_QR_CORDIC);
  `endif
end

`ifdef RTL
  QR_CORDIC
  #(
  .DATA_LENGTH(DATA_LENGTH), 
  .NUM_SIGN(NUM_SIGN), //folded cordic with 2 times
  .ITER_IDX(ITER_IDX) //iterate 8 times
  )
  inst_QR_CORDIC (
      .clk        (clk),
      .rst_n      (rst_n),
      .valid      (valid),
      .out_vallid (out_vallid),
      .in         (in),
      .out        (out)
  );
`endif

`ifdef GATE
  QR_CORDIC
  inst_QR_CORDIC (
      .clk        (clk),
      .rst_n      (rst_n),
      .valid      (valid),
      .out_vallid (out_vallid),
      .in         (in),
      .out        (out)
  );
`endif

`ifdef POST
  QR_CORDIC
  inst_QR_CORDIC (
      .clk        (clk),
      .rst_n      (rst_n),
      .valid      (valid),
      .out_vallid (out_vallid),
      .in         (in),
      .out        (out)
  );
`endif

  always
  begin
    #(`CYCLE/2) clk = ~clk;
  end

  initial
  begin  // data input
    //f = $fopen(`DEL,"r");
    //$fscanf(f,"%b",del);
    $readmemb (`EXP, exp);
    $readmemb (`ORI, ori);
    $display("-----------------------------------------------------\n");
    $display("START!!! Simulation Start .....\n");
    $display("Your input matrix is : \n");
    for(i=8;i>0;i=i-1) begin
      $display("%13f %13f %13f %13f",$signed(ori[4*i-4]),$signed(ori[4*i-3]),$signed(ori[4*i-2]),$signed(ori[4*i-1]));
    end
    $display("-----------------------------------------------------\n");
    rst_n = 1'b0;
    valid = 0;
    count = 'd0;
    pass_chk = 0;
    start = 0;
    //f = $fopen("D:/QR_CORDIC/output.txt","w");
    #(`CYCLE*3);
    @(negedge clk) #1;
      rst_n = 1'b1;
    // data input
    for(i=0;i<9;i=i+1) begin
      @(negedge clk)
        valid = 1;
        in = {ori[4*i+3],ori[4*i+2],ori[4*i+1],ori[4*i]} ;
    end
    start = 1;
    valid = 0;
    //check if out right
    wait(out_vallid)
    pass_chk = 1;
    start = 0;
    for(i=8;i>0;i=i-1) begin
      @(negedge clk) begin
          $display("Your matrix[%1d][0] is %8d, expect matrix[%1d][0] is %8d",i,$signed(out[12:0] ),i,$signed(exp[4*(8-i)+0]));
          $display("Your matrix[%1d][1] is %8d, expect matrix[%1d][1] is %8d",i,$signed(out[25:13]),i,$signed(exp[4*(8-i)+1]));
          $display("Your matrix[%1d][2] is %8d, expect matrix[%1d][2] is %8d",i,$signed(out[38:26]),i,$signed(exp[4*(8-i)+2]));
          $display("Your matrix[%1d][3] is %8d, expect matrix[%1d][3] is %8d",i,$signed(out[51:39]),i,$signed(exp[4*(8-i)+3]));
          $display("------------------------------------------------------");
          if(out != {exp[4*(8-i)+3],exp[4*(8-i)+2],exp[4*(8-i)+1],exp[4*(8-i)+0]}) begin
            pass_chk = 0;
            fail_task;
          end
          //$fwrite(f,"%b\n",out[12:0] );
          //$fwrite(f,"%b\n",out[25:13]);
          //$fwrite(f,"%b\n",out[38:26]);
          //$fwrite(f,"%b\n",out[51:39]);
      end
    end
    if(pass_chk) begin
        $display("\n---------------------Congratulations!------------------------");
        $display("------------- The test result is ..... PASS -----------------\n");
        $display("Your output matrix is : \n");
        for(i=8;i>0;i=i-1) begin
          $display("%13f %13f %13f %13f",$signed(exp[4*i-4]),$signed(exp[4*i-3]),$signed(exp[4*i-2]),$signed(exp[4*i-1]));
        end
        $display("\n The delta result is %.4f, calculation time is %2d clk\n",0.0039,count);
        $display("-----------------------------------------------------\n");
        //$fclose(f);
        #150
        $finish;
    end
    //fail
    #(`End_CYCLE);
    fail_task;
  end

  always @(negedge clk) begin 
    if(start)
      count = count + 1;
  end

  task fail_task();
  begin
    $display("-----------------------------------------------------\n");
    $display("Error!!! There is something wrong with your code ...!\n");
    $display("------The test result is .....FAIL ------------------\n");
    $display("-----------------------------------------------------\n");
    $finish;
  end 
  endtask

endmodule
