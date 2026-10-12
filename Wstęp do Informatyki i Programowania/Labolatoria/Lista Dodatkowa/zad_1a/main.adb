with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Command_Line;    use Ada.Command_Line;
with Ada.Containers.Vectors;
with Ada.Exceptions;      use Ada.Exceptions;

procedure main is
  File_Open_Error : exception;
   package Integer_Vectors is new Ada.Containers.Vectors
     (Index_Type   => Natural,
      Element_Type => Integer);
   use Integer_Vectors;

   package Integer_Sort is new Integer_Vectors.Generic_Sorting;
   use Integer_Sort;

   Infinity : constant Integer := Integer'Last;

   function Load_Coins (File_Path : String) return Vector is
      File      : File_Type;
      Value     : Integer;
      Coins     : Vector;
      Num_Coins : Integer;
   begin
      begin
         Open (File, In_File, File_Path);
      exception
         when Ada.Text_IO.Name_Error =>
            raise File_Open_Error with "Nie mozna otworzyc pliku: " & File_Path;
      end;
      
      if not End_Of_File (File) then
         Get (File, Num_Coins); 
      else
         Close (File);
         return Coins;
      end if;

      Coins.Reserve_Capacity (Ada.Containers.Count_Type(Num_Coins));

      for I in 1 .. Num_Coins loop
         begin
            Get (File, Value);
            Coins.Append (Value);
         exception
            when End_Error => 
               Put_Line ("Za mało nominałów");
               exit; -- nie trzeba kończyć programu - działamy z mniejszą ilością nominałów
         end;
      end loop;

      Close (File);
      return Coins;
   end Load_Coins;

   procedure Count_Change (C : Vector; R : Integer; Result : out Vector; Success : out Boolean) is
      type DP_Array is array (0 .. R) of Integer;
      DP        : DP_Array := (others => Infinity);
      Last_Coin : DP_Array := (others => -1);
      
      Coins_Amount : Integer;
      Curr         : Integer;
   begin
      DP(0) := 0;

      for Coin of C loop
         for I in Coin .. R loop
            if DP(I - Coin) /= Infinity then
               Coins_Amount := DP(I - Coin) + 1;
               
               if Coins_Amount < DP(I) then
                  DP(I) := Coins_Amount;
                  Last_Coin(I) := Coin;
               end if;
            end if;
         end loop;
      end loop;

      if DP(R) = Infinity then
         Success := False;
         return;
      end if;

      Result.Clear;
      Curr := R;
      while Curr > 0 loop
         Result.Append (Last_Coin(Curr));
         Curr := Curr - Last_Coin(Curr);
      end loop;
      
      Success := True;
   end Count_Change;

   procedure Print_Used_Coins (Used_Coins_Sorted : Vector) is
      Curr_Coin : Integer;
      Count     : Integer := 1;
   begin
      if Used_Coins_Sorted.Is_Empty then
         return;
      end if;

      Curr_Coin := Used_Coins_Sorted.First_Element;

      for I in 1 .. Used_Coins_Sorted.Last_Index loop
         if Used_Coins_Sorted(I) = Curr_Coin then
            Count := Count + 1;
         else
            Put_Line ("   " & Integer'Image(Count) & " x " & Integer'Image(Curr_Coin));
            Curr_Coin := Used_Coins_Sorted(I);
            Count := 1;
         end if;
      end loop;

      Put_Line ("   " & Integer'Image(Count) & " x " & Integer'Image(Curr_Coin));
   end Print_Used_Coins;

   Coins_List  : Vector;
   Test_Values : Vector;
   Used_Coins  : Vector;
   Success     : Boolean;
   Val         : Integer;

begin
   if Argument_Count < 2 then
      Put_Line ("Przyklad: ./coins coins.txt 13 45 2 4 9 20");
      Set_Exit_Status (Failure);
      return;
   end if;

   begin
      for I in 2 .. Argument_Count loop
         Test_Values.Append (Integer'Value (Argument (I)));
      end loop;
   exception
      when Constraint_Error =>
         Put_Line ("Bledne liczby");
         Set_Exit_Status (Failure);
         return;
   end;

   begin
      Coins_List := Load_Coins (Argument (1));
   exception
      when others =>
         Set_Exit_Status (Failure);
         return;
   end;

   for V of Test_Values loop
      Val := V;
      Count_Change (Coins_List, Val, Used_Coins, Success);
      
      if not Success then
         Put_Line (Integer'Image(Val) & " ==> No solution!");
      else
         Put_Line (Integer'Image(Val) & " ==> " & Ada.Containers.Count_Type'Image(Used_Coins.Length));
         Sort (Used_Coins);
         Print_Used_Coins (Used_Coins);
      end if;
   end loop;

end main;