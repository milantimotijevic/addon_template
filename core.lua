local abilities = {
    {name = 'Cat Form', button = StanceButton1}
};

for i, ability in ipairs(abilities) do
	--ability.cost = GetSpellPowerCost(ability.name)[1].cost;
	ability.cost = 15; --TEMPORARILY HARDCODED A MANA VALUE, BECAUSE SHAPESHIFTING IS FREE IN BFA
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