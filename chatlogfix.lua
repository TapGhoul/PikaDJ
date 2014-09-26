hook.Add("OnPlayerChat", "ChatLogFix", function(player, strText, bTeamOnly, bPlayerIsDead)
if ( IsValid( player ) ) then
    print("Player: "..strText)
else
    print("[Console]  :   "..strText)
  end
  return false
end)

