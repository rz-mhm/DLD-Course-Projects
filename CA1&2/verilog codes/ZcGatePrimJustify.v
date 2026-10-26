`timescale 1ns/1ns

module ZcGatePrimJustify;

    reg a;
    reg b;
    reg c;

    wire y1_gateprim, y0_gateprim;
    
    reg [1:0] expected_out;
    real change_time;
    real stable_time;
    real current_delay;
    real worst_delay;

    ZcGatePrim DUT (a, b, c, y1_gateprim, y0_gateprim);

    initial begin
        worst_delay = 0;
        
        a = 0; b = 0; c = 0;
        expected_out = 2'b11;
        change_time = $realtime;
        wait({y1_gateprim, y0_gateprim} == expected_out);
        stable_time = $realtime;
        current_delay = stable_time - change_time;
        if (current_delay > worst_delay) worst_delay = current_delay;
        $display("Input: %b%b%b | Output: %b%b | Delay: %0t", a, b, c, y1_gateprim, y0_gateprim, current_delay);
        #60;

        a = 1; b = 0; c = 0;
        expected_out = 2'b10;
        change_time = $realtime;
        wait({y1_gateprim, y0_gateprim} == expected_out);
        stable_time = $realtime;
        current_delay = stable_time - change_time;
        if (current_delay > worst_delay) worst_delay = current_delay;
        $display("Input: %b%b%b | Output: %b%b | Delay: %0t", a, b, c, y1_gateprim, y0_gateprim, current_delay);
        #60;

        a = 1; b = 1; c = 0;
        expected_out = 2'b01;
        change_time = $realtime;
        wait({y1_gateprim, y0_gateprim} == expected_out);
        stable_time = $realtime;
        current_delay = stable_time - change_time;
        if (current_delay > worst_delay) worst_delay = current_delay;
        $display("Input: %b%b%b | Output: %b%b | Delay: %0t", a, b, c, y1_gateprim, y0_gateprim, current_delay);
        #60;

        a = 0; b = 1; c = 0;
        expected_out = 2'b10;
        change_time = $realtime;
        wait({y1_gateprim, y0_gateprim} == expected_out);
        stable_time = $realtime;
        current_delay = stable_time - change_time;
        if (current_delay > worst_delay) worst_delay = current_delay;
        $display("Input: %b%b%b | Output: %b%b | Delay: %0t", a, b, c, y1_gateprim, y0_gateprim, current_delay);
        #60;

        a = 0; b = 1; c = 1;
        expected_out = 2'b01;
        change_time = $realtime;
        wait({y1_gateprim, y0_gateprim} == expected_out);
        stable_time = $realtime;
        current_delay = stable_time - change_time;
        if (current_delay > worst_delay) worst_delay = current_delay;
        $display("Input: %b%b%b | Output: %b%b | Delay: %0t", a, b, c, y1_gateprim, y0_gateprim, current_delay);
        #60;

        a = 0; b = 0; c = 1;
        expected_out = 2'b10;
        change_time = $realtime;
        wait({y1_gateprim, y0_gateprim} == expected_out);
        stable_time = $realtime;
        current_delay = stable_time - change_time;
        if (current_delay > worst_delay) worst_delay = current_delay;
        $display("Input: %b%b%b | Output: %b%b | Delay: %0t", a, b, c, y1_gateprim, y0_gateprim, current_delay);
        #60;

        a = 1; b = 0; c = 1;
        expected_out = 2'b01;
        change_time = $realtime;
        wait({y1_gateprim, y0_gateprim} == expected_out);
        stable_time = $realtime;
        current_delay = stable_time - change_time;
        if (current_delay > worst_delay) worst_delay = current_delay;
        $display("Input: %b%b%b | Output: %b%b | Delay: %0t", a, b, c, y1_gateprim, y0_gateprim, current_delay);
        #60;

        a = 1; b = 1; c = 1;
        expected_out = 2'b00;
        change_time = $realtime;
        wait({y1_gateprim, y0_gateprim} == expected_out);
        stable_time = $realtime;
        current_delay = stable_time - change_time;
        if (current_delay > worst_delay) worst_delay = current_delay;
        $display("Input: %b%b%b | Output: %b%b | Delay: %0t", a, b, c, y1_gateprim, y0_gateprim, current_delay);
        #60;

        $display("=================================");
        $display("WORST CASE DELAY: %0t", worst_delay);
        $display("=================================");
        $stop;
    end

endmodule
