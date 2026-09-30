module traffic_light_controller (
    input clk,
    input reset,

    output reg [1:0] NS_light,
    output reg [1:0] EW_light
);

    // State definitions
    localparam NS_GREEN_EW_RED  = 2'b00;
    localparam NS_YELLOW_EW_RED = 2'b01;
    localparam NS_RED_EW_GREEN  = 2'b10;
    localparam NS_RED_EW_YELLOW = 2'b11;

    reg [1:0] state;
    reg [1:0] next_state;

    // State register
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= NS_GREEN_EW_RED;
        else
            state <= next_state;
    end

    // Next-state logic
    always @(*) begin
        case (state)

            NS_GREEN_EW_RED:
                next_state = NS_YELLOW_EW_RED;

            NS_YELLOW_EW_RED:
                next_state = NS_RED_EW_GREEN;

            NS_RED_EW_GREEN:
                next_state = NS_RED_EW_YELLOW;

            NS_RED_EW_YELLOW:
                next_state = NS_GREEN_EW_RED;

            default:
                next_state = NS_GREEN_EW_RED;

        endcase
    end

    // Output logic
    always @(*) begin

        // Default outputs
        NS_light = 2'b00;
        EW_light = 2'b00;

        case (state)

            // North-South GREEN
            NS_GREEN_EW_RED: begin
                NS_light = 2'b10;
                EW_light = 2'b00;
            end

            // North-South YELLOW
            NS_YELLOW_EW_RED: begin
                NS_light = 2'b01;
                EW_light = 2'b00;
            end

            // East-West GREEN
            NS_RED_EW_GREEN: begin
                NS_light = 2'b00;
                EW_light = 2'b10;
            end

            // East-West YELLOW
            NS_RED_EW_YELLOW: begin
                NS_light = 2'b00;
                EW_light = 2'b01;
            end

            default: begin
                NS_light = 2'b00;
                EW_light = 2'b00;
            end

        endcase
    end

endmodule
