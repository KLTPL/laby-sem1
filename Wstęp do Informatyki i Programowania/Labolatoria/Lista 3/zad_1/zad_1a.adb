with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Unchecked_Deallocation;
with Ada.Command_Line;

procedure zad_1a is

   type Sieve_Array is array (Natural range <>) of Boolean;
   type Sieve_Ptr is access Sieve_Array;

   procedure Free is new Ada.Unchecked_Deallocation(Sieve_Array, Sieve_Ptr);

  function Read_Int(Text : String; Num : out Integer; Error : String) return Boolean is
  begin
    Put(Text);
    begin
      Get(Num);
      Skip_Line;
  exception
    when Data_Error =>
      Skip_Line;
      Put(Standard_Error, Error);
      New_Line(Standard_Error);
      return False;
   end;
   return True;
  end Read_Int;

   procedure ComputeSieve (S : in out Sieve_Ptr; N : Natural) is
      J : Natural;
      I : Natural;
   begin
      for K in S'Range loop
         S(K) := True;
      end loop;

      I := 2;
      while I * I <= N loop
         if S(I) then
            J := I * I;
            while J <= N loop
               S(J) := False;
               J := J + I;
            end loop;
         end if;
         I := I + 1;
      end loop;
   end ComputeSieve;

   function CountPrimes (S : Sieve_Ptr) return Natural is
      C : Natural := 0;
   begin
      for I in S'Range loop
         if S(I) then
            C := C + 1;
         end if;
      end loop;
      return C;
   end CountPrimes;

   N_Input : Integer;
   Is_Read : Boolean;
   N       : Natural;
   S       : Sieve_Ptr := null;
   Result  : Natural;

begin
  Put_Line("Program obliczajacy ilosc liczb pierwszych w zakresie [2, n]");

  Is_Read := Read_Int("Podaj liczbe naturalna n: ", N_Input, "Błąd: podano niepoprawną liczbę");
  if not Is_Read then
    Ada.Command_Line.Set_Exit_Status(1);
    return;
  end if;

  if N_Input < 2 then
    Put_Line("n musi byc >= 2 zeby tworzylo poprawny zakres [2, n]");
    Ada.Command_Line.Set_Exit_Status(0);
    return;
  end if;

  N := Natural(N_Input);

  begin
    S := new Sieve_Array(2 .. N); 
  exception
    when Storage_Error =>
        Put(Standard_Error, "Błąd: Za mało pamięci n = ");
        Put(Standard_Error, N, Width => 0);
        New_Line(Standard_Error);
        Ada.Command_Line.Set_Exit_Status(2);
        return;
  end;

  ComputeSieve(S, N);
  Result := CountPrimes(S);

  Put("Liczba liczb pierwszych w zakresie [2, ");
  Put(N, Width => 0);
  Put("] wynosi: ");
  Put(Result, Width => 0);
  New_Line;

  Free(S);

  Ada.Command_Line.Set_Exit_Status(0);

end zad_1a;