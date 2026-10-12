with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Mastermind is
   Code_Len    : constant := 4;
   Num_Colors  : constant := 6;
   Total_Codes : constant := Num_Colors ** Code_Len;
   Marker      : constant := -1;

   type Code_Array is array (1 .. Code_Len) of Integer;
   type All_Codes_List is array (1 .. Total_Codes) of Code_Array;
   type Possibility_Mask is array (1 .. Total_Codes) of Boolean;

   Codes       : All_Codes_List;
   Is_Possible : Possibility_Mask;
   Idx         : Integer := 1;
   
   Attempt       : Integer := 1;
   Correct_Place : Integer;
   Wrong_Place   : Integer;
   Sim_Correct   : Integer;
   Sim_Wrong     : Integer;
   Current_Guess_Idx : Integer;
   Found_Guess   : Boolean;

   procedure Get_Feedback (Guess : in Code_Array; Secret : in Code_Array; 
                           Res_Correct : out Integer; Res_Wrong : out Integer) is
      G_Temp : Code_Array := Guess;
      S_Temp : Code_Array := Secret;
      C_Count : Integer := 0;
      W_Count : Integer := 0;
   begin
      for I in 1 .. Code_Len loop
         if G_Temp(I) = S_Temp(I) then
            C_Count := C_Count + 1;
            G_Temp(I) := Marker;
            S_Temp(I) := Marker;
         end if;
      end loop;

      for I in 1 .. Code_Len loop
         if G_Temp(I) /= Marker then
            for J in 1 .. Code_Len loop
               if S_Temp(J) /= Marker and then S_Temp(J) = G_Temp(I) then
                  W_Count := W_Count + 1;
                  S_Temp(J) := Marker;
                  exit;
               end if;
            end loop;
         end if;
      end loop;

      Res_Correct := C_Count;
      Res_Wrong   := W_Count;
   end Get_Feedback;

begin
   for I in 1 .. Num_Colors loop
      for J in 1 .. Num_Colors loop
         for K in 1 .. Num_Colors loop
            for L in 1 .. Num_Colors loop
               Codes(Idx) := (I, J, K, L);
               Is_Possible(Idx) := True;
               Idx := Idx + 1;
            end loop;
         end loop;
      end loop;
   end loop;

   loop
      Found_Guess := False;
      Current_Guess_Idx := -1;
      
      for I in 1 .. Total_Codes loop
         if Is_Possible(I) then
            Current_Guess_Idx := I;
            Found_Guess := True;
            exit;
         end if;
      end loop;

      if not Found_Guess then
         Put_Line("Oszukujesz !");
         exit;
      end if;

      Put(Attempt, Width => 0);
      Put(": ");
      for I in 1 .. Code_Len loop
         Put(Codes(Current_Guess_Idx)(I), Width => 0);
         if I < Code_Len then
            Put(" ");
         end if;
      end loop;
      Put_Line(" ?");

      Put("Na swoim miejscu : ");
      Get(Correct_Place);

      if Correct_Place = Code_Len then
         Put_Line("Wygrałem .");
         exit;
      end if;

      Put("Nie na swoim miejscu : ");
      Get(Wrong_Place);

      for I in 1 .. Total_Codes loop
         if Is_Possible(I) then
            Get_Feedback(Codes(Current_Guess_Idx), Codes(I), Sim_Correct, Sim_Wrong);
            if Sim_Correct /= Correct_Place or Sim_Wrong /= Wrong_Place then
               Is_Possible(I) := False;
            end if;
         end if;
      end loop;

      Attempt := Attempt + 1;
   end loop;

end Mastermind;
