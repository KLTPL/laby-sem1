with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

procedure zad_2a is
  procedure Read_Int(Text : String; Num : out Integer) is
  begin
    Put(Text);
    Get(Num);
  end Read_Int;

  function Is_Prime(Num : Integer) return Boolean is
  begin
    if Num = 2 then
      return True;
    end if;
    if Num <= 1 or Num mod 2 = 0 then
      return False;
    end if;

    declare 
      Curr : Integer := 3;
      Sqrt_Num: constant Integer := Integer(Float'Floor(Sqrt(Float(Num))));
    begin
      while Curr <= Sqrt_Num loop
        if Num mod Curr = 0 then
          return False;
        end if;
        Curr := Curr + 2;
      end loop;
    end;
      
    return True;
  end Is_Prime;

  Num : Integer;
begin
  Put_Line("Program sprawdzający czy liczba jest pierwsza");
  Read_Int("Podaj liczbę: ", Num);

  if Is_Prime(Num) then
    Put_Line("Liczba jest pierwsza");
  else
    Put_Line("Liczba NIE jest pierwsza");
  end if;
end zad_2a;