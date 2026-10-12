with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package body ask is
  function Ask_User(Prompt : String) return Integer is 
  Val : Integer;
  begin
    Put (Prompt);
    Get (Val);
    Skip_Line;
    return Val;
  end Ask_User;

  function Ask_User_For_Value return Integer is 
  begin
    return Ask_User("Value: ");
  end Ask_User_For_Value;
  
    function Ask_User_For_Index return Integer is 
  begin
    return Ask_User("Index: ");
  end Ask_User_For_Index;
end ask;
