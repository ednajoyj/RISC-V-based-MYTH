\m5_TLV_version 1d: tl-x.org
\SV
   // This code can be found in: https://github.com/stevehoover/RISC-V_MYTH_Workshop
   `include "sqrt32.v";
   m4_include_lib(['https://raw.githubusercontent.com/stevehoover/RISC-V_MYTH_Workshop/ecba3769fff373ef6b8f66b3347e8940c859792d/tlv_lib/calculator_shell_lib.tlv'])

\SV
   m5_makerchip_module   // (Expanded in Nav-TLV pane.)

\TLV
   $reset = *reset;
   
   |calc
      @1
         $val1[31:0] = >>2$out[31:0];
         $val2[31:0] = $rand2[3:0];
         
         $sum[31:0] = $val1 + $val2;
         $diff[31:0] = $val1 - $val2;
         $prod[31:0] = $val1 * $val2;
         $quot[31:0] = $val1 / $val2;
         
         $valid = $reset ? 0 : (>>1$valid + 1);
         
      @2
         $mem[31:0] = ($op[1]) ? (($op[0]) ? $quot[31:0] : $prod[31:0]) : (($op[0]) ? $diff[31:0] : $sum[31:0]);
         
         $sel_sig = $reset | (!$valid);
         $out[31:0] = $sel_sig ? 32'd0 : $mem;.
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
   

\SV
   endmodule