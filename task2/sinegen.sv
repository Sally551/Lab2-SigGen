module sinegen #(
    parameter A_WIDTH = 8,
              D_WIDTH = 8
)(
    // interface signals
    input  logic                   clk,   // clock
    input  logic                   rst,   // reset
    input  logic                   en,    // enable
    input  logic [D_WIDTH-1:0]      incr,  // increment for addr counter
    output logic [D_WIDTH-1:0]      data1,  // output data
    output logic [D_WIDTH-1:0]      data2   // output data
);

    logic [A_WIDTH-1:0] address; // interconnect wire

    counter addrCounter (
        .clk   (clk),
        .rst   (rst),
        .en    (en),
        .incr  (6),
        .count (address)
    );

    rom sineRom (
        .clk  (clk),
        .addr1 (address),
        .addr2 (incr),
        .dout1 (data1),
        .dout2 (data2)
    );

endmodule
