local sequences = {
	['first'] = {},
	['second'] = {},
	['third'] = {},
	['fourth'] = {}
};

function availableSequence()
	if next(sequences['first']) == nil then
		return 'first';
	elseif next(sequences['second']) == nil then
		return 'second';
	elseif next(sequences['third']) == nil then
		return 'third';
	else
		return 'fourth';
	end	
end

function addSequence(name, firstAbility, secondAbility)
	local key = availableSequence();
	sequences[key][1] = {
		name = firstAbility,
		cost = getAbilityCost(firstAbility)
	};
	
	sequences[key][2] = {
		name = secondAbility,
		cost = getAbilityCost(secondAbility)
	};
end

function getAbilityCost(abilityName)
	local costWrapperArray = GetSpellPowerCost(abilityName);
	if costWrapperArray == nill then
		return 0;
	end
	
	local costWrapper = costWrapperArray[1];
	if costWrapper == nil then
		return 0
	else
		return costWrapper.cost
	end
end

-- START placeholder
addSequence('smth', 'Flash Heal', 'Shadow Word: Pain');
-- END placeholder


local UnitPowerFrame = CreateFrame('Frame', 'MITLANDIR_Template_Frame', UIParent, 'BasicFrameTemplateWithInset');
UnitPowerFrame:SetScript('OnEvent', function(self, event, unitTarget, powerType)
	local currentMana = UnitPower('player', 0);
	local currentRage = UnitPower('player', 1);
	local currentEnergy = UnitPower('player', 3);
	calculateCasts(currentMana);
end);

function calculateCasts(currentPower)
	local casts = math.floor(currentPower / (sequences['first'][1].cost + sequences['first'][2].cost) * 100)/100;
	print(casts);
end

UnitPowerFrame:RegisterEvent('UNIT_POWER_UPDATE');

UnitPowerFrame:SetAlpha(1);
UnitPowerFrame:SetSize(500, 200);
UnitPowerFrame:SetPoint('BOTTOM', QuickJoinToastButton, 'TOP');












-- get mouoseover frame name
-- /run print(GetMouseFocus():GetName())