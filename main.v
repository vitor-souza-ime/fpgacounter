module contador (
    input  wire clk,      // 27 MHz
    input  wire reset_n,  // ativo em nível baixo
    output reg  [6:0] seg
);
    parameter CLK_FREQ = 27000000;

    reg [24:0] contador_clk = 0;
    reg [2:0]  valor = 0;

    // Divisor de 1 segundo
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            contador_clk <= 0;
            valor        <= 0;
        end else begin
            if (contador_clk == CLK_FREQ - 1) begin
                contador_clk <= 0;
                if (valor == 6)
                    valor <= 0;
                else
                    valor <= valor + 1;
            end else begin
                contador_clk <= contador_clk + 1;
            end
        end
    end

    // Decodificador 7 segmentos (catodo comum)
    always @(*) begin
        case (valor)
            3'd0: seg = 7'b1111110; // 0
            3'd1: seg = 7'b0110000; // 1
            3'd2: seg = 7'b1101101; // 2
            3'd3: seg = 7'b1111001; // 3
            3'd4: seg = 7'b0110011; // 4
            3'd5: seg = 7'b1011011; // 5
            3'd6: seg = 7'b1011111; // 6
            default: seg = 7'b0000000;
        endcase
    end
endmodule


