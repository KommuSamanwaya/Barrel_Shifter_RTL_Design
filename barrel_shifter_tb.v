module barrel_shifter_tb();

    // Testbench Signals
    reg  [7:0] data_in;
    reg  [2:0] shift;
    reg  [1:0] op;//operation select
    wire [7:0] data_out;

    // DUT Instantiation
    barrel_shifter DUT (
        .data_in(data_in),
        .shift(shift),
        .op(op),
        .data_out(data_out)
    );

    // Initialize Inputs
    task initialize;
    begin
        data_in = 8'b00000000;
        shift   = 3'b000;
        op      = 2'b00;
    end
    endtask

    // Apply Stimulus
    task stimulus;
        input [7:0] din;
        input [2:0] sh;
        input [1:0] operation;
    begin
        data_in = din;
        shift   = sh;
        op      = operation;
        #10;
    end
    endtask

    // Monitor Signals
    initial
    begin
        $monitor("Time=%0t | OP=%b | Shift=%0d | Data_In=%b | Data_Out=%b",
                  $time, op, shift, data_in, data_out);
    end

    // Test Sequence
    initial
    begin
        initialize;

        //=============================
        // Logical Shift Left (LSL)
        //=============================
        stimulus(8'b10110011,3'd0,2'b00);
        stimulus(8'b10110011,3'd1,2'b00);
        stimulus(8'b10110011,3'd2,2'b00);
        stimulus(8'b10110011,3'd3,2'b00);

        //=============================
        // Logical Shift Right (LSR)
        //=============================
        stimulus(8'b10110011,3'd0,2'b01);
        stimulus(8'b10110011,3'd1,2'b01);
        stimulus(8'b10110011,3'd2,2'b01);
        stimulus(8'b10110011,3'd3,2'b01);

        //=============================
        // Rotate Left (ROL)
        //=============================
        stimulus(8'b10110011,3'd0,2'b10);
        stimulus(8'b10110011,3'd1,2'b10);
        stimulus(8'b10110011,3'd2,2'b10);
        stimulus(8'b10110011,3'd3,2'b10);

        //=============================
        // Rotate Right (ROR)
        //=============================
        stimulus(8'b10110011,3'd0,2'b11);
        stimulus(8'b10110011,3'd1,2'b11);
        stimulus(8'b10110011,3'd2,2'b11);
        stimulus(8'b10110011,3'd3,2'b11);

        #10;
        $finish;
    end

    // Waveform Dump
    initial
    begin
        $dumpfile("barrel_shifter.vcd");
        $dumpvars(0, barrel_shifter_tb);
    end

endmodule

