with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

procedure zad_3a is
  procedure Read_Int(Text : String; Num : out Integer) is
  begin
    Put(Text);
    Get(Num);
  end Read_Int;


  procedure Print_Prime_Factors(Num_In : Integer) is
    Num : Integer := Num_In;
    Num_Sqrt : constant Integer := Integer(Float'Floor(Sqrt(Float(Num_In))));
    Exp : Integer := 0; -- Expoment
    Curr : Integer := 3;
  begin
    if Num <= 1 then
      Put_Line("Brak czynników pierwszych");
      return;
    end if;

    Put(Num, Width => 0);
    Put(" = ");

    while Num mod 2 = 0 loop
      Exp := Exp + 1;
      Num := Num / 2;
    end loop;
    if Exp > 0 then
      Put("2");
      if Exp > 1 then
        Put("^");
        Put(Exp, Width => 0);
      end if;
      if Num > 1 then
        Put("*");
      end if;
    end if;

    while Curr <= Num_Sqrt loop
      Exp := 0;
      while Num mod Curr = 0 loop
        Exp := Exp + 1;
        Num := Num / Curr;
      end loop;

      if Exp > 0 then
        Put(Curr, Width => 0);
        if Exp > 1 then
          Put("^");
          Put(Exp, Width => 0);
        end if;
        if Num > 1 then
          Put("*");
        end if;
      end if;
      Curr := Curr + 2;
    end loop;

    if Num > 1 then
      Put(Num, Width => 0);
    end if;

    Put_Line("");

  end Print_Prime_Factors;

  Num : Integer;
begin
  Put_Line ("Program wypisujący rozkład na czynniki pierwsze");
  Read_Int("Podaj liczbę: ", Num);

  Print_Prime_Factors(Num);

end zad_3a;