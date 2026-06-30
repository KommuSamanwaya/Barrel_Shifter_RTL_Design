module barrel_shifter (
    input  [7:0] data_in,
    input  [2:0] shift,
    input  [1:0] op, //operation select
    output reg [7:0] data_out
);

always @(*)
begin

    case(op)

    // Logical Shift Left (LSL)
    2'b00:
    begin
        case(shift)
            3'd0: data_out = data_in;
            3'd1: data_out = data_in << 1;
            3'd2: data_out = data_in << 2;
            3'd3: data_out = data_in << 3;
            3'd4: data_out = data_in << 4;
            3'd5: data_out = data_in << 5;
            3'd6: data_out = data_in << 6;
            3'd7: data_out = data_in << 7;
            default: data_out = 8'b0;
        endcase
    end

    // Logical Shift Right (LSR)
    2'b01:
    begin
        case(shift)
            3'd0: data_out = data_in;
            3'd1: data_out = data_in >> 1;
            3'd2: data_out = data_in >> 2;
            3'd3: data_out = data_in >> 3;
            3'd4: data_out = data_in >> 4;
            3'd5: data_out = data_in >> 5;
            3'd6: data_out = data_in >> 6;
            3'd7: data_out = data_in >> 7;
            default: data_out = 8'b0;
        endcase
    end

    // Rotate Left (ROL)
    2'b10:
    begin
        case(shift)
            3'd0: data_out = data_in;
            3'd1: data_out = {data_in[6:0], data_in[7]};
            3'd2: data_out = {data_in[5:0], data_in[7:6]};
            3'd3: data_out = {data_in[4:0], data_in[7:5]};
            3'd4: data_out = {data_in[3:0], data_in[7:4]};
            3'd5: data_out = {data_in[2:0], data_in[7:3]};
            3'd6: data_out = {data_in[1:0], data_in[7:2]};
            3'd7: data_out = {data_in[0],   data_in[7:1]};
            default: data_out = data_in;
        endcase
    end

    // Rotate Right (ROR)
    2'b11:
    begin
        case(shift)
            3'd0: data_out = data_in;
            3'd1: data_out = {data_in[0],   data_in[7:1]};
            3'd2: data_out = {data_in[1:0], data_in[7:2]};
            3'd3: data_out = {data_in[2:0], data_in[7:3]};
            3'd4: data_out = {data_in[3:0], data_in[7:4]};
            3'd5: data_out = {data_in[4:0], data_in[7:5]};
            3'd6: data_out = {data_in[5:0], data_in[7:6]};
            3'd7: data_out = {data_in[6:0], data_in[7]};
            default: data_out = data_in;
        endcase
    end

    default:
        data_out = 8'b0;

    endcase

end

endmodule

