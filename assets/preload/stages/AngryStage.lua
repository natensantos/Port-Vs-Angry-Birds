local chucktime = false

function onCreate()
	
	addCharacterToList('Pig', 'gf')
	addCharacterToList('bfbirdflip', 'boyfriend')
	addCharacterToList('redangry', 'dad')

	-- background shit
    makeLuaSprite('Sky', 'Sky', -500, 800);
	setLuaSpriteScrollFactor('Sky', 1, 1);
	addLuaSprite('Sky', false);

	makeLuaSprite('Sun', 'Sun', 550, 1500);
	setLuaSpriteScrollFactor('Sun', 1, 1);
	addLuaSprite('Sun', false);

	makeLuaSprite('Towers', 'Towers', -530, 1320);
	setLuaSpriteScrollFactor('Towers', 1, 1);
	addLuaSprite('Towers', false);

	makeLuaSprite('Field 3', 'Field 3', -500, 1650);
	setLuaSpriteScrollFactor('Field 3', 1, 1);
	addLuaSprite('Field 3', false);

	makeLuaSprite('Field 2', 'Field 2', -500, 1700);
	setLuaSpriteScrollFactor('Field 2', 1, 1);
	addLuaSprite('Field 2', false);

	makeLuaSprite('Slingshot', 'Slingshot', -350, 1650);
	setLuaSpriteScrollFactor('Slingshot', 1, 1);
	addLuaSprite('Slingshot', false);

	makeLuaSprite('Field 1', 'Field 1', -500, 1800);
	setLuaSpriteScrollFactor('Field 1', 1, 1);
	addLuaSprite('Field 1', false);

	makeLuaSprite('Nest', 'Nest', 400, 1900);
	setLuaSpriteScrollFactor('Nest', 1, 1);
	addLuaSprite('Nest', false);

	makeAnimatedLuaSprite('BackBirds', 'BackBirds', -300, 1750);
	addAnimationByPrefix('BackBirds', 'BackBirds', 'BackBirds', 24, false)
	setLuaSpriteScrollFactor('BackBirds', 1, 1);
	addLuaSprite('BackBirds', false);

	makeAnimatedLuaSprite('Chuck', 'Chuck', 1150, 1900);
	addAnimationByPrefix('Chuck', 'Bumpin', 'Bumpin', 24, false)
	addAnimationByPrefix('Chuck', 'Speed', 'Speed', 24, false)
	setLuaSpriteScrollFactor('Chuck', 1, 1);

	makeAnimatedLuaSprite('BackBirdsAngry', 'BackBirdsAngry', -300, 1750);
	addAnimationByPrefix('BackBirdsAngry', 'BackBirdsAngry', 'BackBirdsAngry', 24, false)
	setLuaSpriteScrollFactor('BackBirdsAngry', 1, 1);
	addLuaSprite('BackBirdsAngry', false);
	setProperty('BackBirdsAngry.visible', false);
end

function onStepHit()
	if curStep == 688 then 
		setProperty('BackBirdsAngry.visible', true);
		setProperty('BackBirds.visible', false);
	end
	if curStep == 944 then 
		setProperty('BackBirdsAngry.visible', false);
		setProperty('BackBirds.visible', true);
	end
	if curStep == 985 then 
		addLuaSprite('Chuck', false);
		objectPlayAnimation('Chuck', 'Speed', true)
		setProperty('Chuck.x', 1100)
	end
	if curStep == 988 then 
		chucktime = true
	end
end

function onBeatHit()
	if chucktime then
		objectPlayAnimation('Chuck', 'Bumpin', true)
		setProperty('Chuck.x', 1150)
	end
	objectPlayAnimation('BackBirds', 'BackBirds', true)
	objectPlayAnimation('BackBirdsAngry', 'BackBirdsAngry', true)
end