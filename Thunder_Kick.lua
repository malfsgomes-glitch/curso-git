local config = {
  ["tm shiny ampharos"] = {
    effect = 15,
    effect2 = 100,
  },

  ["spells giovanni quest"] = {
    effect = 15,
    effect2 = 43,
  },

  ["default"] = {
    effect = 15,
    effect2 = 14,
  },
}

local params = config[__spell.monsterName:lower()]
if not params then
  params = config["default"]
end

local distanceCombat = createCombatObject()
setCombatParam(distanceCombat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(distanceCombat, COMBAT_PARAM_EFFECT, params.effect2)
setCombatParam(distanceCombat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_EARTHARROW)

function onTargetCreature(cid, target)
	local pos = getCreaturePosition(target)
	pos = { x = pos.x, y = pos.y, z = pos.z, stackpos = pos.stackpos}

	doSendMagicEffect(pos, params.effect)
end

setCombatCallback(distanceCombat, CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")

function onCastSpell(cid, var)
	return doCombat(cid, distanceCombat, var)
end
