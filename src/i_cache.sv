//4 Way associative Cache
module i_cache
(
    input logic clk,
    input logic rst,
    //Master Wishbone interface
    input  logic ACK,
    input  logic ERR,
    input  logic RTY,
    output logic STB,
    output logic CYC,
    output logic [31:0] ADR,
    input  logic [31:0] DAT_I,
    output logic [31:0] DAT_O,
    output logic [2:0]  CTI_O,
    output logic WE,
    //CPU interface
    input  logic [31:0] PC,
    output logic [31:0] INS,
    output logic stall,
    input logic flush
);


typedef enum logic [1:0] {
    INIT
    IDDLE, 
    CACHE_HIT, 
    CACHE_MISS, 
    CACHE_LOAD_MISSALIGNED_B1,
    CACHE_LOAD_MISSALIGNED_B2,
    CACHE_WRITE_BACK_B1
    CACHE_WRITE_BACK_B2
} cache_state_t;

cache_state_t cache_state;


//Initial values to help simulation
initial begin
    cache_state <= INIT;
end


//Associative Table Entry
//+---+---+-----+---------------+
//| V | D | TAG | DATA 32 Bytes |
//+---+---+-----+---------------+

//      Addressing
//+--------+-----+-----+
//|  TAG   | ATI | WA  |
//+--+-----+-----+-----+
//
// WA  - Word Address. 3 bits. Ignored in Cache logic.
// ATI - Associative Table Index. 2 bits.
// TAG - 28 bit
wire wa [2:0] = PC [2:0];
wire ati [1:0] = PC [4:3];
wire tag [27:0] = PC [31:5];

//This register will serve as a counter to initialize all the valid bits to 0
reg v_cnt [6:0];

//1KB per table
reg [28:0] TAG_LVL1 [127:0];
reg [28:0] TAG_LVL2 [127:0];
reg [28:0] TAG_LVL3 [127:0];
reg [28:0] TAG_LVL4 [127:0];
reg V_BIT_1 [127:0];
reg V_BIT_2 [127:0];
reg V_BIT_3 [127:0];
reg V_BIT_4 [127:0];
reg D_BIT_1 [127:0];
reg D_BIT_2 [127:0];
reg D_BIT_3 [127:0];
reg D_BIT_4 [127:0];


always@(posedge clk or posedge rst)
begin
    if(rst)
    begin
        //Reset state machine
        cache_state <= INIT;
        v_cnt <= 0;
    end
    else
    begin
        case(cache_state)
            INIT:
            begin
                //Check if PC value is a hit
                if(v_cnt == 127)
                begin

                end
                else
                begin

                end
            end
            IDDLE:
            begin 
            end 
            CACHE_HIT:
            begin 

            end 
            CACHE_MISS:
            begin 

            end 
            CACHE_LOAD_MISSALIGNED_B1:
            begin 

            end
            CACHE_LOAD_MISSALIGNED_B2:
            begin 

            end
            CACHE_WRITE_BACK_B1:
            begin 

            end
            CACHE_WRITE_BACK_B2:
            begin 

            end
        endcase
    end
end

endmodule
