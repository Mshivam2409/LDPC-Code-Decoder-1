// Lookup table for function log((1+e^(-|x|)) / (1-e^(-|x|)) )
// X: 6 bits, 2 integer: 4 fractional, thus can be sampled at 0.0625
// Y: 4 bits, 2 integer: 2 fractional, thus can be quantized at 0.25

module LUT (
  input  [6-1 : 0] X,
  output reg [4-1 : 0] Y
);

always @(X) begin
  case (X)
    6'b000000: Y = 4'b1111;  // f(0.0) = 3.75 ~ 3.75
    6'b000001: Y = 4'b1110;  // f(0.0625) = 3.4660613494787524 ~ 3.5
    6'b000010: Y = 4'b1011;  // f(0.125) = 2.7738896200803707 ~ 2.75
    6'b000011: Y = 4'b1001;  // f(0.1875) = 2.3700473082913835 ~ 2.25
    6'b000100: Y = 4'b1000;  // f(0.25) = 2.0846309693248757 ~ 2.0
    6'b000101: Y = 4'b0111;  // f(0.3125) = 1.864389967905266 ~ 1.75
    6'b000110: Y = 4'b0111;  // f(0.375) = 1.6855999933200343 ~ 1.75
    6'b000111: Y = 4'b0110;  // f(0.4375) = 1.5356005427273531 ~ 1.5
    6'b001000: Y = 4'b0110;  // f(0.5) = 1.4068291137472952 ~ 1.5
    6'b001001: Y = 4'b0101;  // f(0.5625) = 1.2944024206236089 ~ 1.25
    6'b001010: Y = 4'b0101;  // f(0.625) = 1.1949809216404483 ~ 1.25
    6'b001011: Y = 4'b0100;  // f(0.6875) = 1.1061774802231357 ~ 1.0
    6'b001100: Y = 4'b0100;  // f(0.75) = 1.0262244711552542 ~ 1.0
    6'b001101: Y = 4'b0100;  // f(0.8125) = 0.9537746418430119 ~ 1.0
    6'b001110: Y = 4'b0100;  // f(0.875) = 0.8877760287036583 ~ 1.0
    6'b001111: Y = 4'b0011;  // f(0.9375) = 0.8273901745601959 ~ 0.75
    6'b010000: Y = 4'b0011;  // f(1.0) = 0.7719368329053048 ~ 0.75
    6'b010001: Y = 4'b0011;  // f(1.0625) = 0.7208555005169953 ~ 0.75
    6'b010010: Y = 4'b0011;  // f(1.125) = 0.6736779936816737 ~ 0.75
    6'b010011: Y = 4'b0011;  // f(1.1875) = 0.6300084771378487 ~ 0.75
    6'b010100: Y = 4'b0010;  // f(1.25) = 0.589508646432784 ~ 0.5
    6'b010101: Y = 4'b0010;  // f(1.3125) = 0.5518865508460834 ~ 0.5
    6'b010110: Y = 4'b0010;  // f(1.375) = 0.5168880373173304 ~ 0.5
    6'b010111: Y = 4'b0010;  // f(1.4375) = 0.48429011343574835 ~ 0.5
    6'b011000: Y = 4'b0010;  // f(1.5) = 0.4538957369082066 ~ 0.5
    6'b011001: Y = 4'b0010;  // f(1.5625) = 0.42552967985253504 ~ 0.5
    6'b011010: Y = 4'b0010;  // f(1.625) = 0.39903521295081695 ~ 0.5
    6'b011011: Y = 4'b0001;  // f(1.6875) = 0.3742714219852208 ~ 0.25
    6'b011100: Y = 4'b0001;  // f(1.75) = 0.3511110171316341 ~ 0.25
    6'b011101: Y = 4'b0001;  // f(1.8125) = 0.3294385298078072 ~ 0.25
    6'b011110: Y = 4'b0001;  // f(1.875) = 0.30914881696135627 ~ 0.25
    6'b011111: Y = 4'b0001;  // f(1.9375) = 0.2901458111921393 ~ 0.25
    6'b100000: Y = 4'b0001;  // f(2.0) = 0.2723414689118317 ~ 0.25
    6'b100001: Y = 4'b0001;  // f(2.0625) = 0.2556548791513369 ~ 0.25
    6'b100010: Y = 4'b0001;  // f(2.125) = 0.24001150354615108 ~ 0.25
    6'b100011: Y = 4'b0001;  // f(2.1875) = 0.22534252410881855 ~ 0.25
    6'b100100: Y = 4'b0001;  // f(2.25) = 0.21158428010179142 ~ 0.25
    6'b100101: Y = 4'b0001;  // f(2.3125) = 0.1986777789914924 ~ 0.25
    6'b100110: Y = 4'b0001;  // f(2.375) = 0.18656826934347875 ~ 0.25
    6'b100111: Y = 4'b0001;  // f(2.4375) = 0.175204865793205 ~ 0.25
    6'b101000: Y = 4'b0001;  // f(2.5) = 0.1645402180345878 ~ 0.25
    6'b101001: Y = 4'b0001;  // f(2.5625) = 0.15453021721308324 ~ 0.25
    6'b101010: Y = 4'b0001;  // f(2.625) = 0.14513373427017437 ~ 0.25
    6'b101011: Y = 4'b0001;  // f(2.6875) = 0.13631238572243248 ~ 0.25
    6'b101100: Y = 4'b0001;  // f(2.75) = 0.1280303231172332 ~ 0.25
    6'b101101: Y = 4'b0000;  // f(2.8125) = 0.1202540430249739 ~ 0.0
    6'b101110: Y = 4'b0000;  // f(2.875) = 0.11295221493247462 ~ 0.0
    6'b101111: Y = 4'b0000;  // f(2.9375) = 0.10609552481639412 ~ 0.0
    6'b110000: Y = 4'b0000;  // f(3.0) = 0.09965653251644369 ~ 0.0
    6'b110001: Y = 4'b0000;  // f(3.0625) = 0.09360954130990468 ~ 0.0
    6'b110010: Y = 4'b0000;  // f(3.125) = 0.08793047832251107 ~ 0.0
    6'b110011: Y = 4'b0000;  // f(3.1875) = 0.08259678460505751 ~ 0.0
    6'b110100: Y = 4'b0000;  // f(3.25) = 0.077587313867282 ~ 0.0
    6'b110101: Y = 4'b0000;  // f(3.3125) = 0.07288223899641606 ~ 0.0
    6'b110110: Y = 4'b0000;  // f(3.375) = 0.06846296560195805 ~ 0.0
    6'b110111: Y = 4'b0000;  // f(3.4375) = 0.06431205192452014 ~ 0.0
    6'b111000: Y = 4'b0000;  // f(3.5) = 0.06041313452808037 ~ 0.0
    6'b111001: Y = 4'b0000;  // f(3.5625) = 0.05675085926421248 ~ 0.0
    6'b111010: Y = 4'b0000;  // f(3.625) = 0.053310817055879686 ~ 0.0
    6'b111011: Y = 4'b0000;  // f(3.6875) = 0.05007948409889657 ~ 0.0
    6'b111100: Y = 4'b0000;  // f(3.75) = 0.0470441661225781 ~ 0.0
    6'b111101: Y = 4'b0000;  // f(3.8125) = 0.04419294638853109 ~ 0.0
    6'b111110: Y = 4'b0000;  // f(3.875) = 0.041514637138986274 ~ 0.0
    6'b111111: Y = 4'b0000;  // f(3.9375) = 0.03899873423427339 ~ 0.0
    default: Y = 0;
  endcase

end

endmodule