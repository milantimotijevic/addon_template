local abilities = {
	--TODO: replace Regrowth with a form for Classic (impossible to test otherwise in BFA because shifing costs no mana)
    {name = 'Regrowth', button = StanceButton1} 
};

for i, ability in ipairs(abilities) do
	ability.cost = GetSpellPowerCost(ability.name)[1].cost;
    ability.fontString = ability.button:CreateFontString(nil, 'OVERLAY', 'GameTooltipText');
	ability.fontString:SetPoint("BOTTOM",StanceButton1,"TOP",0,7);
	ability.fontString:SetText(math.floor(UnitPower('player', 0) / ability.cost * 100)/100);
end

local UnitPowerFrame = CreateFrame('Frame');
UnitPowerFrame:SetScript('OnEvent', function()
	for i, ability in ipairs(abilities) do
		ability.fontString:SetText(math.floor(UnitPower('player', 0) / ability.cost * 100)/100);
	end	
end);

UnitPowerFrame:RegisterEvent('UNIT_POWER_UPDATE');