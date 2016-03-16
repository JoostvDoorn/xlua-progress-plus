do
   local function getTermLength()
      if sys.uname() == 'windows' then return 80 end
      local tputf = io.popen('tput cols', 'r')
      local w = tonumber(tputf:read('*a'))
      local rc = {tputf:close()}
      if rc[3] == 0 then return w
      else return 80 end 
   end

   local last_info_lines = -1
   local termLength = math.min(getTermLength(), 120)
   local info = {}
   function xlua.info_clear()
      info = {}
   end
   function xlua.info(line, line_nr)
      local line_nr = line_nr or -1
      if line_nr == -1 then
         for i=2,last_info_lines do
            xlua.info(info[i], i-1) -- Push down
         end
         line_nr = last_info_lines
      end
      info[line_nr] = line
   end
   local original = xlua.progress
   function xlua.progress(current, goal, info_lines)
      -- defaults:
      local info_lines = info_lines or 0
      last_info_lines = info_lines
      original(current, goal)


      for i=0,info_lines do
         if info[i] then
            io.write(info[i])
         else
            if i ~= 0 then
               io.write(string.rep(" ", termLength))
            end
         end
         if i ~= info_lines then
            io.write('\n')
         end
      end

      for i=0,info_lines do
         io.write('\b\r')
      end
      io.flush()
   end
end
