with Ada.Text_IO; use Ada.Text_IO;

package body list is
   function isEmpty (l : ListT) return Boolean is
   begin
      return l.first = null;
   end isEmpty;

   function Pop (l : in out ListT) return Integer is
      n : NodePtr := l.first;
      e : Integer := n.elem;
   begin
      l.first := n.next;
      if l.first = null then -- last element
         l.last := null;
      end if;
      Free (n);
      l.length := l.length - 1;
      return e;
   end Pop;

   procedure Push (l : in out ListT; e : Integer) is
      n : NodePtr := new Node;
   begin
      n.elem := e;
      n.next := l.first;
      l.first := n;
      if l.last = null then -- first element
         l.last := n;
      end if;
      l.length := l.length + 1;
   end Push;

   procedure Append (l : in out ListT; e : Integer) is
      n : NodePtr := new Node;
   begin
      n.elem := e;
      if l.first = null then -- first element
         l.first := n;
      else
         l.last.next := n;
      end if;
      l.last := n;
      l.length := l.length + 1;
   end Append;

   function Get ( l : ListT ; i : Integer ) return Integer is
      n : NodePtr := l.first;
      j : Positive := 1; 
   begin
      while j < i loop
         n := n.next;
         j := j + 1;
      end loop;
      return n.elem;
   end Get;

   procedure Put ( l : in out ListT ; i : Integer ; e : Integer ) is
      n : NodePtr := l.first;
      j : Positive := 1; 
   begin
      while j < i loop
         n := n.next;
         j := j + 1;
      end loop;
      n.elem := e;
   end Put;

   procedure Insert ( l : in out ListT ; i : Integer ; e : Integer ) is
      n : NodePtr := l.first;
      j : Positive := 1;
      New_Node : NodePtr := new Node;
   begin
      New_Node.elem := e;
      if i = 1 then
         New_Node.next := l.first;
         if l.first = null then
            l.last := New_Node;
         end if;
         l.first := New_Node;
      else
         while j < i - 1 loop
            n := n.next;
            j := j + 1;
         end loop;
         if n.next = null then
            l.last := New_Node;
         else
            New_Node.next := n.next;
         end if;
         n.next := New_Node;
      end if;
      l.length := l.length + 1;
   end Insert;

   procedure Delete ( l : in out ListT ; i : Integer ) is
      n : NodePtr := l.first;
      j : Positive := 1; 
   begin
      if i = 1 then
         if l.first = l.last then
            l.last := null;
         end if;
         l.first := n.next;
         Free (n);
      else
         while j < i - 1 loop
           n := n.next;
           j := j + 1;
         end loop;
         if n.next.next = null then -- last element
           l.last := n;
           Free (n.next);
           n.next := null;
         else -- insight element
           declare 
               Temp : NodePtr := n.next;
           begin
               n.next := temp.next;
               Free (temp);
           end;
         end if;
      end if;
      l.length := l.length - 1;
   end Delete;

   procedure Print (l : ListT) is
      n : NodePtr := l.first;
   begin
      while n /= null loop
         Put (n.elem'Image);
         n := n.next;
      end loop;
      Put_Line (" (" & Length (l)'Image & " )");
      --  Put_Line ("first: " & l.first.elem'Image & ", last: " & l.last.elem'Image);
   end Print;

   procedure Clean ( l : in out ListT ) is
      Temp : Integer;
   begin
      while not list.isEmpty (l) loop
         Temp := Pop (l);         
      end loop;

   end Clean;

   function Length (l : ListT) return Integer is
   begin
      return l.length;
   end Length;
end list;
