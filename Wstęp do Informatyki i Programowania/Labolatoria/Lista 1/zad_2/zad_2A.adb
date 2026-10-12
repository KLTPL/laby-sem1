with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;
procedure zad_2A is
   a, b, c, del : Float;
   x0, x1, x2, sqrt_delta : Float;
begin
   Put_Line("Program liczący rówanie kwadratowe: a*x^2 + b*x + c = 0\n: ");
   Put("a = ");
   Get(a);

   if a = 0.0 then
      Put_Line("To nie jest równanie kwadratowe (a = 0)");
      return;
   end if;

   Put("b = ");
   Get(b);
   Put("c = ");
   Get(c);



   del := b * b - 4.0 * a * c;
   
   if del < 0.0 then
      Put_Line("Brak rozwiązań rzeczywistych");
   elsif del = 0.0 then
      x0 := -b / (2.0 * a);
      Put_Line("Jedno rozwiązanie:");
      Put("x0 = ");
      Put(x0, Fore => 0, Aft => 6, Exp => 0);

   else
      sqrt_delta := Sqrt(del);
      x1 := (-b - sqrt_delta) / (2.0 * a);
      x2 := (-b + sqrt_delta) / (2.0 * a);

      Put_Line("Dwa rozwiazania:");
      Put("x1 = ");
      Put(x1, Fore => 0, Aft => 6, Exp => 0);
      New_Line;
      Put("x2 = ");
      Put(x2, Fore => 0, Aft => 6, Exp => 0);
      New_Line;
   end if;

end zad_2A;