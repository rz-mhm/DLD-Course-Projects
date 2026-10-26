`timescale 1ns/1ns

module seven_input_zcJustify;
    reg [0:6] data_in;
    wire msb_out, mid_out, lsb_out;
    
    reg [2:0] expected_out;
    real change_time;
    real stable_time;
    real current_delay;
    real worst_delay;

    seven_input_zc DUT (
        .data_in(data_in),
        .msb_out(msb_out),
        .mid_out(mid_out),
        .lsb_out(lsb_out)
    );

    initial begin
        worst_delay = 0;
        
        data_in = 7'b0000000;
        expected_out = 3'b111;
        change_time = $realtime;
        wait({msb_out, mid_out, lsb_out} == expected_out);
        stable_time = $realtime;
        current_delay = stable_time - change_time;
        if (current_delay > worst_delay) worst_delay = current_delay;
        $display("Input: %b | Output: %b%b%b | Delay: %0t", data_in, msb_out, mid_out, lsb_out, current_delay);
        #100;

        data_in = 7'b1000000;
        expected_out = 3'b110;
        change_time = $realtime;
        wait({msb_out, mid_out, lsb_out} == expected_out);
        stable_time = $realtime;
        current_delay = stable_time - change_time;
        if (current_delay > worst_delay) worst_delay = current_delay;
        $display("Input: %b | Output: %b%b%b | Delay: %0t", data_in, msb_out, mid_out, lsb_out, current_delay);
        #100;

        data_in = 7'b1100000;
        expected_out = 3'b101;
        change_time = $realtime;
        wait({msb_out, mid_out, lsb_out} == expected_out);
        stable_time = $realtime;
        current_delay = stable_time - change_time;
        if (current_delay > worst_delay) worst_delay = current_delay;
        $display("Input: %b | Output: %b%b%b | Delay: %0t", data_in, msb_out, mid_out, lsb_out, current_delay);
        #100;

        data_in = 7'b1110000;
        expected_out = 3'b100;
        change_time = $realtime;
        wait({msb_out, mid_out, lsb_out} == expected_out);
        stable_time = $realtime;
        current_delay = stable_time - change_time;
        if (current_delay > worst_delay) worst_delay = current_delay;
        $display("Input: %b | Output: %b%b%b | Delay: %0t", data_in, msb_out, mid_out, lsb_out, current_delay);
        #100;

        data_in = 7'b1111000;
        expected_out = 3'b011;
        change_time = $realtime;
        wait({msb_out, mid_out, lsb_out} == expected_out);
        stable_time = $realtime;
        current_delay = stable_time - change_time;
        if (current_delay > worst_delay) worst_delay = current_delay;
        $display("Input: %b | Output: %b%b%b | Delay: %0t", data_in, msb_out, mid_out, lsb_out, current_delay);
        #100;

        data_in = 7'b1111100;
        expected_out = 3'b010;
        change_time = $realtime;
        wait({msb_out, mid_out, lsb_out} == expected_out);
        stable_time = $realtime;
        current_delay = stable_time - change_time;
        if (current_delay > worst_delay) worst_delay = current_delay;
        $display("Input: %b | Output: %b%b%b | Delay: %0t", data_in, msb_out, mid_out, lsb_out, current_delay);
        #100;

        data_in = 7'b1111110;
        expected_out = 3'b001;
        change_time = $realtime;
        wait({msb_out, mid_out, lsb_out} == expected_out);
        stable_time = $realtime;
        current_delay = stable_time - change_time;
        if (current_delay > worst_delay) worst_delay = current_delay;
        $display("Input: %b | Output: %b%b%b | Delay: %0t", data_in, msb_out, mid_out, lsb_out, current_delay);
        #100;

        data_in = 7'b1111111;
        expected_out = 3'b000;
        change_time = $realtime;
        wait({msb_out, mid_out, lsb_out} == expected_out);
        stable_time = $realtime;
        current_delay = stable_time - change_time;
        if (current_delay > worst_delay) worst_delay = current_delay;
        $display("Input: %b | Output: %b%b%b | Delay: %0t", data_in, msb_out, mid_out, lsb_out, current_delay);
        #100;

        data_in = 7'b1001000;
        expected_out = 3'b101;
        change_time = $realtime;
        wait({msb_out, mid_out, lsb_out} == expected_out);
        stable_time = $realtime;
        current_delay = stable_time - change_time;
        if (current_delay > worst_delay) worst_delay = current_delay;
        $display("Input: %b | Output: %b%b%b | Delay: %0t", data_in, msb_out, mid_out, lsb_out, current_delay);
        #100;

        data_in = 7'b1101000;
        expected_out = 3'b100;
        change_time = $realtime;
        wait({msb_out, mid_out, lsb_out} == expected_out);
        stable_time = $realtime;
        current_delay = stable_time - change_time;
        if (current_delay > worst_delay) worst_delay = current_delay;
        $display("Input: %b | Output: %b%b%b | Delay: %0t", data_in, msb_out, mid_out, lsb_out, current_delay);
        #100;

        $display("=================================");
        $display("WORST CASE DELAY: %0t", worst_delay);
        $display("=================================");
        $stop;
    end
endmodule
