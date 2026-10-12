with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure zad_1a is
  procedure Read_Int(Text : String; Num : out Integer) is
  begin
    Put(Text);
    Get(Num);
  end Read_Int;

  function Gcd(Num1: Integer; Num2: Integer) return Integer is
    A, B, Temp : Integer;
  begin
    A := Num1;
    b := Num2;

    if A < b then
      Temp := A;
      A := B;
      B := Temp;
    end if;

    while B /= 0 loop
      Temp := A mod B;
      A := B;
      B := Temp;
    end loop;
    
    return A;
  end Gcd;

  A, B: Integer;
begin
  Read_Int("Podaj pierwszą liczbę: ", A);
  Read_Int("Podaj drugą liczbę: ", B);

  
  Put("NWD = " & Gcd(A, B)'Image);
end zad_1a;