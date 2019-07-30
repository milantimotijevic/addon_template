local sequences = {};

function addSequence(name, abilities)
	local cost = 0;

	for i, v in ipairs(abilities) do
		cost = cost + getAbilityCost(v);
	end

	sequences[#sequences + 1] = {name, cost};
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
addSequence('CoolSequence', {'Flash Heal', 'Shadow Word: Pain'});
-- END placeholder


local UnitPowerFrame = CreateFrame('Frame', 'MITLANDIR_Template_Frame', UIParent, 'BasicFrameTemplateWithInset');
UnitPowerFrame:SetScript('OnEvent', function(self, event, unitTarget, powerType)
	local currentMana = UnitPower('player', 0);
	local currentRage = UnitPower('player', 1);
	local currentEnergy = UnitPower('player', 3);
	calculateCasts(currentMana);
end);

function calculateCasts(currentPower)
	print(calculateCastsForSequence(1, currentPower));
end

function calculateCastsForSequence(sequence, currentPower)
	if next(sequences[sequence]) == nil then
		return 0;
	end	
	return math.floor(currentPower / sequences[1][2] * 100)/100;
end

UnitPowerFrame:RegisterEvent('UNIT_POWER_UPDATE');

UnitPowerFrame:SetAlpha(1);
UnitPowerFrame:SetSize(500, 200);
UnitPowerFrame:SetPoint('BOTTOM', QuickJoinToastButton, 'TOP');












-- get mouoseover frame name
-- /run print(GetMouseFocus():GetName())