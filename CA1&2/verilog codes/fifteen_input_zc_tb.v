`timescale 1ns/1ns

module fifteen_input_zc_tb;
    reg [14:0] data_in;
    wire [3:0] zeros_count;

    _fifteen_input_zc DUT (
        .data_in(data_in),
        .zeros_count(zeros_count)
    );
    
    initial begin
        $display("Time\tInput\t\tZeros\tExpected");
        $display("----\t-----\t\t-----\t--------");
        
        data_in = 15'b000000000000000;
        #200;
        $display("%0t\t%b\t%b\t1111", $time, data_in, zeros_count);
        
        data_in = 15'b100000000000000;
        #200;
        $display("%0t\t%b\t%b\t1110", $time, data_in, zeros_count);
        
        data_in = 15'b110000000000000;
        #200;
        $display("%0t\t%b\t%b\t1101", $time, data_in, zeros_count);
        
        data_in = 15'b111000000000000;
        #200;
        $display("%0t\t%b\t%b\t1100", $time, data_in, zeros_count);
        
        data_in = 15'b111100000000000;
        #200;
        $display("%0t\t%b\t%b\t1011", $time, data_in, zeros_count);
        
        data_in = 15'b111110000000000;
        #200;
        $display("%0t\t%b\t%b\t1010", $time, data_in, zeros_count);
        
        data_in = 15'b111111000000000;
        #200;
        $display("%0t\t%b\t%b\t1001", $time, data_in, zeros_count);
        
        data_in = 15'b111111100000000;
        #200;
        $display("%0t\t%b\t%b\t1000", $time, data_in, zeros_count);
        
        data_in = 15'b111111110000000;
        #200;
        $display("%0t\t%b\t%b\t0111", $time, data_in, zeros_count);
        
        data_in = 15'b111111111000000;
        #200;
        $display("%0t\t%b\t%b\t0110", $time, data_in, zeros_count);
        
        data_in = 15'b111111111100000;
        #200;
        $display("%0t\t%b\t%b\t0101", $time, data_in, zeros_count);
        
        data_in = 15'b111111111110000;
        #200;
        $display("%0t\t%b\t%b\t0100", $time, data_in, zeros_count);
        
        data_in = 15'b111111111111000;
        #200;
        $display("%0t\t%b\t%b\t0011", $time, data_in, zeros_count);
        
        data_in = 15'b111111111111100;
        #200;
        $display("%0t\t%b\t%b\t0010", $time, data_in, zeros_count);
        
        data_in = 15'b111111111111110;
        #200;
        $display("%0t\t%b\t%b\t0001", $time, data_in, zeros_count);
        
        data_in = 15'b111111111111111;
        #200;
        $display("%0t\t%b\t%b\t0000", $time, data_in, zeros_count);
        
        $stop;
    end
endmodule
