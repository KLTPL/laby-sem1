with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Strings.Unbounded; use  Ada.Strings.Unbounded;
with Ada.Strings.Unbounded.Text_IO; use Ada.Strings.Unbounded.Text_IO;

with list;
with ask;


procedure listTest is
   l : list.ListT;
   r : Integer;
   command : Unbounded_String;
   continue : Boolean := True;
begin
   while continue loop
      Put ("Command: ");
      Get_Line (command);
      if command = "Pop" then
         if not list.isEmpty (l) then
            r := list.Pop (l);
            Put_Line ("Result: " & r'Image);
         else
            Put_Line (Standard_Error, "Error - stack is empty!");
         end if;

      elsif command = "Push" then
         r := ask.Ask_User_For_Value;
         list.Push (l, r);
         Put_Line ("Result: OK");

      elsif command = "Append" then
         r := ask.Ask_User_For_Value;
         list.Append (l, r);
         Put_Line ("Result: OK");

      elsif command = "Get" then
         r := ask.Ask_User_For_Index;
         if r <= 0 or r >= list.Length (l) then
            Put_Line(Standard_Error, "Error - bad index !");
         else
            r := list.Get (l, r);
            Put_Line ("Result: " & Integer'Image(r));
         end if;

      elsif command = "Put" then
         r := ask.Ask_User_For_Index;
         declare
            e : Integer;
         begin
            e := ask.Ask_User_For_Value;
            if r <= 0 or r > list.Length (l) then
               Put_Line(Standard_Error, "Error - bad index !");
            else
               list.Put (l, r, e);
               Put_Line ("Result: OK");
            end if;
          end;

      elsif command = "Insert" then
         r := ask.Ask_User_For_Index;
         declare
            e : Integer;
         begin
            e := ask.Ask_User_For_Value;
            if r <= 0 or r > list.Length (l) + 1 then
               Put_Line(Standard_Error, "Error - bad index !");
            else
               list.Insert (l, r, e);
               Put_Line ("Result: OK");
            end if;
         end;

      elsif command = "Delete" then
         r := ask.Ask_User_For_Index;
         if r <= 0 or r > list.Length (l) then
            Put_Line(Standard_Error, "Error - bad index !");
         else
            list.Delete (l, r);
            Put_Line ("Result: OK");
         end if;

      elsif command = "Print" then
         Put ("Result: ");
         list.Print (l);

      elsif command = "Clean" then
         list.Clean (l);
         Put_Line ("Result: OK");

      elsif command = "Length" then
         r := list.Length (l);
         Put_Line ("Result: " & r'Image);

      elsif command = "Exit" then
         continue := False;

      else
      
         Put_Line ("Unknown command!");
      end if;
   end loop;

   list.Clean (l);
end listTest;

