local abilities = {
    {ability = 'Cat Form', button = StanceButton1}
};

for i, ability in ipairs(abilities) do
    ability.fontString = ability.button:CreateFontString(nil, 'OVERLAY', 'GameTooltipText');
    ability.fontString:SetPoint("BOTTOM",StanceButton1,"TOP",0,7);
    ability.fontString:SetText(12);
end