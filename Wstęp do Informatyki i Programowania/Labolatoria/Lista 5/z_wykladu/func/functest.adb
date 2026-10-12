with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;
procedure FuncTest is
   type FuncType is access function (x : Float) return Float;
   procedure Write (f : FuncType; x : Float) is
   begin
      Put_Line (f (x)'Image);
   end Write;
   function Square1 (x : Float) return Float is
   begin
      return (x - 1.0) * (x + 2.0);
   end Square1;
   x : Float;
begin
   Get (x);
   Write (Sin'Access, x);
   Write (Cos'Access, x);
   Write (Sqrt'Access, x);
   Write (Square1'Access, x);
end FuncTest;
