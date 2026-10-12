with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Command_Line; use Ada.Command_Line;

procedure hetmani is
   N : Integer := Integer'Value(Argument(1));
   
   Count : Integer := 0;

begin
  if Argument_Count /= 1 then
    Put_Line("Program przyjmuje jeden argument N - liczba całkowita, dodatnia oznaczająca wymiary szachownicy N x N");
    Set_Exit_Status(1);
    return;
  end if;
  declare
    Temp : Integer;
  begin
    Temp := Integer'Value(Argument(1));
    if Temp <= 0 then
      Put_Line("Plansza musi mieć dodatnie wymiary");
      Set_Exit_Status(1);
      return;
    end if;
    N := Natural(Temp);
  end;

  declare
    type PositionArr is array (1 .. N) of Integer;
    type RowArr is array (1 .. N) of Boolean;
    type DiagSums is array (2 .. 2 * N) of Boolean;
    type DiagDiffs is array (-N + 1 .. N - 1) of Boolean;

    Position    : PositionArr := (others => 0);
    Bije_Wiersz : RowArr := (others => False);
    Bije_Przek1 : DiagSums := (others => False);
    Bije_Przek2 : DiagDiffs := (others => False);

    procedure Drukuj_Rozwiazanie is
    begin
        Count := Count + 1;
        for K in 1 .. N loop
          Put(Item => Position(K), Width => 3);
        end loop;
        New_Line;
    end Drukuj_Rozwiazanie;

    procedure Ustaw (I : Integer) is
    begin
        for J in 1 .. N loop
          if not (Bije_Wiersz(J) or 
                  Bije_Przek1(I + J) or 
                  Bije_Przek2(I - J)) then
              Position(I) := J;
              
              Bije_Wiersz(J) := True;
              Bije_Przek1(I + J) := True;
              Bije_Przek2(I - J) := True;

              if I < N then
                Ustaw(I + 1);
              else
                Drukuj_Rozwiazanie;
              end if;

              Position(I) := 0;
              
              Bije_Wiersz(J) := False;
              Bije_Przek1(I + J) := False;
              Bije_Przek2(I - J) := False;
              
          end if;
        end loop;
    end Ustaw;
  begin
    Ustaw(1);
   Put_Line("Ilość rozwiązań: " & Integer'Image(Count));
  end;
  
end hetmani;
