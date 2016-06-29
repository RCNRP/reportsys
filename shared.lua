killedby = {}
if SERVER then
function Killed( victim, inflictor, attacker )
	if ( victim != attacker ) then
		killedby[victim:Nick()] = attacker:Nick()
	end
end
hook.Add( "PlayerDeath", "LastKiller", Killed)
end
