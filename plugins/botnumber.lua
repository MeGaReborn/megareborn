--Start 
local function run(msg, matches)
if  matches[1] == 'botnumber' then
function get_id(arg, data)
if data.last_name_ then
    tdcli.sendContact(arg.chat_id, msg.id_, 0, 1, nil, data.phone_number_, data.first_name_, data.last_name_ , data.id_, dl_cb, nil )
else
tdcli.sendContact(arg.chat_id, msg.id_, 0, 1, nil, data.phone_number_, data.first_name_, '' , data.id_, dl_cb, nil )
end
end
 end
tdcli_function({ ID = 'GetMe'}, get_id, {chat_id=msg.chat_id_})
end

return {
patterns ={
"^[!#/](botnumber)$"

},
run = run
}
--End By @Tele_Sudo & @To0fan
--channel @LuaError
