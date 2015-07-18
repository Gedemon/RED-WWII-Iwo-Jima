


/* Tactical play */

UPDATE Units SET Range = 10 WHERE Range > 0 AND (CombatClass = 'UNITCOMBAT_SIEGE' OR CombatClass = 'UNITCOMBAT_NAVAL' OR CombatClass = 'UNITCOMBAT_ARCHER');
UPDATE Units SET Range = 50 WHERE Range > 0 AND (CombatClass = 'UNITCOMBAT_NAVAL') AND NOT (Class LIKE '%SUBMARINE%');
UPDATE Units SET Range = 3 WHERE (Class LIKE '%SUBMARINE%');

UPDATE Defines SET Value = 15		WHERE Name = 'SUPPORT_FIRE_MAX_REQUEST_RANGE';
UPDATE Defines SET Value = 33		WHERE Name = 'SUPPORT_FIRE_MIN_HEALTH_PERCENT_LEFT';
UPDATE Defines SET Value = 1		WHERE Name = 'SUPPORT_FIRE_CHANCE_BY_HEALTH';
UPDATE Defines SET Value = 66		WHERE Name = 'SUPPORT_FIRE_BASE_CHANCE_PERCENT';
UPDATE Defines SET Value = 0		WHERE Name = 'SUPPORT_FIRE_NO_COUNTER';

UPDATE Units SET BaseSightRange = BaseSightRange + 2 WHERE BaseSightRange > 0 AND NOT (CombatClass = 'UNITCOMBAT_SIEGE');


/* Unit Scale */

UPDATE ArtDefine_UnitMemberInfos SET Scale = Scale*3 WHERE Domain = 'Sea' AND NOT Type = 'ART_DEF_UNIT_MEMBER_TRANSPORT';
UPDATE ArtDefine_UnitMemberInfos SET Scale = Scale*2 WHERE Domain = 'Air';

UPDATE ArtDefine_UnitInfoMemberInfos SET NumMembers = 1 WHERE UnitMemberInfoType LIKE '%ART_DEF_UNIT_MEMBER_DESTROYER%';
UPDATE ArtDefine_UnitInfoMemberInfos SET NumMembers = 1 WHERE UnitMemberInfoType LIKE '%ART_DEF_UNIT_MEMBER_SUBMARINE%';

/* Aircraft Speed */

UPDATE ArtDefine_UnitMemberCombats SET MoveRate = 2*MoveRate;
UPDATE ArtDefine_UnitMemberCombats SET TurnRateMin = 1.5*TurnRateMin WHERE MoveRate > 0;
UPDATE ArtDefine_UnitMemberCombats SET TurnRateMax = 1.5*TurnRateMax WHERE MoveRate > 0;