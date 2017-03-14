-- Begin report.lua
local function run(msg, matches)
 local ldata = load_data(_config.moderation.data)
 if matches[1]:lower() == 'setmaster' and is_admin(msg) then
  local idmas = matches[2]
  local chk =  ldata[tostring(msg.chat_id_)]["master"] 
  if chk then
   ldata[tostring(msg.chat_id_)]["master"]["id"] = idmas
   save_data(_config.moderation.data, ldata)
   return '_ایدی مستر جایگزین شد_'
  else 
   ldata[tostring(msg.chat_id_)]["master"] = {id = idmas}
   save_data(_config.moderation.data, ldata)
   return '_ایدی مستر ذخیره شد_'
   end
 end
    if matches[1]:lower() == 'report' and msg.reply_to_message_id_ then
  local user_name = ''
  local chat = msg.chat_id_
  local master = ldata[tostring(chat)]["master"]
  if master then
   master = ldata[tostring(chat)]["master"]["id"]
   function id_cb(arg, data)
    if data.username_ then
     user_name = '@'..data.username_
    else
     user_name = data.first_name_
    end
    tdcli.sendMessage(msg.chat_id_, 0, 1,  '_گزارش شما به مدیر گروه ارسال شد._', 1, 'md')
    tdcli.sendMessage(master, 0, 1, '[ <code>'..msg.sender_user_id_..'</code> ] '..user_name..' <b>send to you a report:</b>', 1, 'html')
    tdcli.forwardMessages(master, msg.chat_id_,{[0] = msg.reply_to_message_id_}, 0,dl_cb,nil)
   end
  else
   return '_ایدی مستر تعیین نشده است!_'
  end
 tdcli_function ({ ID = "GetUser", user_id_ = msg.sender_user_id_ }, id_cb, {chat_id=msg.chat_id_,user_id=msg.sender_user_id_})
    end
end

return { patterns = { '^[/!#]([Rr]eport)$', '^[/!#]([Ss]etmaster) (%d+)$' }, run = run }

-- END

-- CHANNEL: @luaError & @BeyondTeam
