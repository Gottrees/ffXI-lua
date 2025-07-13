-------------------------------------------------------------------------------------------------------------------
-- Initialization function that defines sets and variables to be used.
-------------------------------------------------------------------------------------------------------------------
--Ionis Zones
--Anahera Blade (4 hit): 52
--Tsurumaru (4 hit): 49
--Kogarasumaru (or generic 450 G.katana) (5 hit): 40
--Amanomurakumo/Masamune 437 (5 hit): 46
--
--Non Ionis Zones:
--Anahera Blade (4 hit): 52
--Tsurumaru (5 hit): 24
--Kogarasumaru (5 hit): 40
--Amanomurakumo/Masamune 437 (5 hit): 46
--
--Aftermath sets
-- Koga AM1/AM2 = sets.engaged.Kogarasumaru.AM
-- Koga AM3 = sets.engaged.Kogarasumaru.AM3
-- Amano AM = sets.engaged.Amanomurakumo.AM
-- Using Namas Arrow while using Amano will cancel STPAM set

-- IMPORTANT: Make sure to also get the Mote-Include.lua file (and its supplementary files) to go with this.

-- Initialization function for this job file.
function get_sets()
	-- Load and initialize the include file.
    mote_include_version = 2
	include('Mote-Include.lua')
end


-- Setup vars that are user-independent.
function job_setup()
    include('Mote-TreasureHunter')
    state.TreasureMode:set('None')
    get_combat_form()
    --get_combat_weapon()
    update_melee_groups()
	lockstyleset = 1

    state.Buff.Sekkanoki = buffactive.sekkanoki or false
    state.Buff.Sengikori = buffactive.sengikori or false
    state.Buff['Third Eye'] = buffactive['Third Eye'] or false
    state.Buff['Meikyo Shisui'] = buffactive['Meikyo Shisui'] or false
end


-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    -- Options: Override default values
    state.OffenseMode:options('Normal', 'Mid', 'Acc')
    state.HybridMode:options('Normal', 'PDT')
    state.WeaponskillMode:options('Normal', 'Mid', 'Acc')
    state.IdleMode:options('Normal', 'Sphere')
    state.RestingMode:options('Normal')
    state.PhysicalDefenseMode:options('PDT', 'Reraise')
    state.MagicalDefenseMode:options('MDT')
    
    -- Additional local binds
    --send_command('bind ^= gs c cycle treasuremode')
    --send_command('bind ^[ input /lockstyle on')
    --send_command('bind ![ input /lockstyle off')
    --send_command('bind != gs c toggle CapacityMode')
    
    select_default_macro_book()
	set_lockstyle()
end


-- Called when this job file is unloaded (eg: job change)
function file_unload()
    send_command('unbind ^[')
    send_command('unbind !=')
    send_command('unbind ![')
end

--[[
-- SC's
Rana > Shoha > Fudo > Kasha > Shoha > Fudo - light
Rana > Shoha > Fudo > Kasha > Rana > Fudo - dark
Kasha > Shoha > Fudo
Fudo > Kasha > Shoha > fudo
Shoha > Fudo > Kasha > Shoha > Fudo
--]]
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    sets.TreasureHunter = { 
        head="White rarab cap +1", 
        waist="Chaac Belt",
     }
    -- Precast Sets
    -- Precast sets to enhance JAs
    sets.precast.JA.Meditate = {
	head="Wakido Kabuto +3",
	back="Smertrios's Mantle",
    hands={ name="Sakonji Kote +3", augments={'Enhances "Blade Bash" effect',}},
    }
	
    --sets.precast.JA.Sekkanoki = {hands="Unkai Kote +2" }
    --sets.precast.JA.Seigan = {head="Unkai Kabuto +2"}
    sets.precast.JA['Warding Circle'] = {head="Wakido Kabuto +3"}
    --sets.precast.JA['Third Eye'] = {legs="Sakonji Haidate"}
    --sets.precast.JA['Blade Bash'] = {hands="Saotome Kote +2"}
   
    sets.precast.FC = {
        ear1="Etiolation Earring",
        ear2="Loquacious Earring",
        hands="Leyline Gloves",
        ring1="Prolix Ring",
        ring2="Weatherspoon Ring"
    }
    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}

    sets.precast.RA = {
     --   head="Volte Tiara",
     --   hands="Buremte Gloves",
     --   ring2="Crepuscular Ring",
     --   feet="Ejekamal Boots",
     --   legs="Volte Tights",
     --   waist="Yemaya Belt"
    }
    sets.midcast.RA = {
     --   head="Nyame Helm",
     --   body="Kendatsuba Samue +1",
     --   legs="Kendatsuba Hakama +1",
     --   neck="Sanctity Necklace",
     --   hands="Kendatsuba Tekko +1",
     --   waist="Chaac Belt",
     --   ear1="Telos Earring",
     --   ear2="Crepuscular Earring",
     --   ring1="Cacoethic Ring +1",
     --   ring2="Crepuscular Ring",
     --   feet="Kendatsuba Sune-ate +1"
    }	
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
    
    --sets.CapacityMantle  = { back="Mecistopins Mantle" }
    --sets.Berserker       = { neck="Berserker's Torque" }
    --sets.WSDayBonus      = { head="Gavialis Helm" }
    --sets.LugraFlame      = { ear1="Lugra Earring +1", ear2="Flame Pearl" }
    --sets.FlameFlame      = { ear1="Flame Pearl", ear2="Flame Pearl" }
       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        ammo="Knobkierrie",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Sam. Nodowa +2", augments={'Path: A',}},
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear="Thrud Earring",
        right_ear={ name="Kasuga Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','Weapon skill damage +2%',}},
        left_ring="Epaminondas's Ring",
        right_ring="Cornelia's Ring",
        back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
	}
	
    sets.precast.WS.Mid = set_combine(sets.precast.WS, {})
    sets.precast.WS.Acc = set_combine(sets.precast.WS.Mid, {})
    
    sets.precast.WS['Namas Arrow'] = {
		head="Mpaca's Cap",
		body={ name="Sakonji Domaru +3", augments={'Enhances "Overwhelm" effect',}},
		hands={ name="Valorous Mitts", augments={'Pet: DEX+8','Accuracy+5','Weapon skill damage +7%','Accuracy+1 Attack+1',}},
		legs="Wakido Haidate +3",
		feet="Valorous Greaves",
		neck="Samurai's Nodowa +2",
		waist="Fotia Belt",
		ear1={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
		ear2="Thrud Earring",
		ring1="Regal Ring",
		ring2="Epaminondas's Ring",
		back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}
	
    sets.precast.WS['Namas Arrow'].Mid = set_combine(sets.precast.WS['Namas Arrow'], {})
    sets.precast.WS['Namas Arrow'].Acc = set_combine(sets.precast.WS['Namas Arrow'].Mid, {})
    sets.precast.WS['Apex Arrow'] = set_combine(sets.precast.WS['Namas Arrow'], {})
    sets.precast.WS['Apex Arrow'].Mid = sets.precast.WS['Apex Arrow']
    sets.precast.WS['Apex Arrow'].Acc = set_combine(sets.precast.WS['Apex Arrow'], {})
    
    sets.precast.WS['Tachi: Fudo'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Tachi: Fudo'].Mid = set_combine(sets.precast.WS['Tachi: Fudo'], {})
    sets.precast.WS['Tachi: Fudo'].Acc = set_combine(sets.precast.WS['Tachi: Fudo'].Mid, {})
    sets.precast.WS['Impulse Drive'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Impulse Drive'].Mid = set_combine(sets.precast.WS['Impulse Drive'], { })
    sets.precast.WS['Impulse Drive'].Acc = set_combine(sets.precast.WS['Impulse Drive'].Mid, {})
    
    sets.precast.WS['Tachi: Shoha'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Tachi: Shoha'].Mid = set_combine(sets.precast.WS['Tachi: Shoha'], {})
    sets.precast.WS['Tachi: Shoha'].Acc = set_combine(sets.precast.WS['Tachi: Shoha'].Mid, {})

    sets.precast.WS['Stardiver'] = set_combine(sets.precast.WS['Tachi: Shoha'], {})
    sets.precast.WS['Stardiver'].Mid = set_combine(sets.precast.WS['Stardiver'], {})
    sets.precast.WS['Stardiver'].Acc = set_combine(sets.precast.WS['Stardiver'].Mid, {})
    
    sets.precast.WS['Tachi: Rana'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Tachi: Rana'].Mid = set_combine(sets.precast.WS['Tachi: Rana'], {})
    sets.precast.WS['Tachi: Rana'].Acc = set_combine(sets.precast.WS.Acc, {})
    -- CHR Mod
    sets.precast.WS['Tachi: Ageha'] = set_combine(sets.precast.WS, {
    head="Ynglinga Sallet",
    feet="Flam. Gambieras +2",
	})
    
    sets.precast.WS['Tachi: Kasha'] = set_combine(sets.precast.WS, {})
    
    sets.precast.WS['Tachi: Gekko'] = set_combine(sets.precast.WS, {})
    
    sets.precast.WS['Tachi: Yukikaze'] = set_combine(sets.precast.WS, {})
    
    sets.precast.WS['Tachi: Jinpu'] = {
        ammo="Knobkierrie",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Sam. Nodowa +2", augments={'Path: A',}},
        waist="Orpheus's Sash",
        left_ear="Friomisi Earring",
        right_ear={ name="Kasuga Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','Weapon skill damage +2%',}},
        left_ring="Epaminondas's Ring",
        right_ring="Cornelia's Ring",
        back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
    }
        
    
    sets.midcast['Blue Magic'] = set_combine(sets.precast.WS['Tachi: Ageha'], {
    })
    -- Midcast Sets
    sets.midcast.FastRecast = {}
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {}
	    sets.idle = {
        ammo="Staunch Tathlum +1",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body="Kasuga Domaru +2",
        hands="Nyame Gauntlets",
        legs="Kasuga Haidate +2",
        feet={ name="Tatena. Sune. +1", augments={'Path: A',}},
        neck={ name="Sam. Nodowa +2", augments={'Path: A',}},
        waist="Ioskeha Belt +1",
        left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        right_ear={ name="Kasuga Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','Weapon skill damage +2%',}},
        left_ring="Shneddick Ring",
        right_ring="Defending Ring",
        back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}}, 
  }
    
    sets.idle.Town = {
        ammo="Staunch Tathlum +1",
        head="Wakido Kabuto +3",
        body="Wakido Domaru +2",
        hands="Wakido Kote +2",
        legs="Wakido Haidate +3",
        feet={ name="Tatena. Sune. +1", augments={'Path: A',}},
        neck={ name="Sam. Nodowa +2", augments={'Path: A',}},
        waist="Ioskeha Belt +1",
        left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        right_ear={ name="Kasuga Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','Weapon skill damage +2%',}},
        left_ring="Warp Ring",
        right_ring="Shneddick Ring",
        back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},
    }
    -- sets.idle.Town.Adoulin = set_combine(sets.idle.Town, {
    --     body="Councilor's Garb"
    -- })
    
    sets.idle.Field = set_combine(sets.idle.Town, {})

    sets.idle.Regen = set_combine(sets.idle.Field, {})

    sets.idle.Sphere = set_combine(sets.idle, {})
    
    sets.idle.Weak = set_combine(sets.idle.Field, {})
    
    -- Defense sets
    sets.defense.PDT = {
		ammo="Staunch Tathlum +1",
		head="Kasuga Kabuto +2",
		body="Kasuga Domaru +2",
		--body="Wakido Domaru +3",
		hands="Wakido Kote +3",
		legs="Kasuga Haidate +2",
		feet="Flam. Gambieras +2",
		neck="Loricate Torque +1",
		waist="Sarissaphoroi Belt",
		ear1="Telos Earring",
		ear2="Cessance Earring",
		ring1="Regal Ring",
		ring2="Defending Ring",
		back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
	}
    sets.idle.PDT = set_combine(sets.idle, sets.defense.PDT)
    
    sets.defense.Reraise = set_combine(sets.defense.PDT, {})
    
    sets.defense.MDT = set_combine(sets.defense.PDT, {
	    head="Kendatsuba Jinpachi",
		body="Kendatsuba Samue",
    })
    
    sets.Kiting = {right_ring="Shneddick Ring",}
    
    sets.Reraise = {}
    
    -- Engaged sets
    
    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- I generally use Anahera outside of Adoulin areas, so this set aims for 47 STP + 5 from Anahera (52 total)
    -- Note, this set assumes use of Cibitshavore (hence the arrow as ammo)
    sets.engaged = {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head="Kasuga Kabuto +2",
        body="Kasuga Domaru +2",
        hands={ name="Tatena. Gote +1", augments={'Path: A',}},
        legs={ name="Tatena. Haidate +1", augments={'Path: A',}},
        --legs="Kasuga Haidate +2",
        feet={ name="Tatena. Sune. +1", augments={'Path: A',}},
        neck={ name="Sam. Nodowa +2", augments={'Path: A',}},
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear="Cessance Earring",
        right_ear={ name="Kasuga Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','Weapon skill damage +2%',}},
        left_ring="Niqmaddu Ring",
        right_ring="Chirich Ring +1",
        back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},
  }
    
    sets.engaged.Mid = set_combine(sets.engaged, {})

    sets.engaged.Acc = set_combine(sets.engaged.Mid, {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head="Wakido Kabuto +3",
        body="Wakido Domaru +2",
        hands="Wakido Kote +2",
        legs="Wakido Haidate +3",
        feet="Wakido Sune. +2",
        neck={ name="Sam. Nodowa +2", augments={'Path: A',}},
        waist="Ioskeha Belt +1",
        left_ear="Crep. Earring",
        right_ear={ name="Kasuga Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','Weapon skill damage +2%',}},
        left_ring="Chirich Ring +1",
        right_ring="Regal Ring",
        back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},
    })

    sets.engaged.PDT = set_combine(sets.engaged, {
		ammo="Ginsen",
		head="Flam. Zucchetto +2",
		body="Kasuga Domaru +2",
		--"Wakido Domaru +3",
		hands="Wakido Kote +3",
		legs="Kasuga Haidate +2",
		feet="Flam. Gambieras +2",
		neck="Loricate Torque +1",
		waist="Sarissaphoroi Belt",
		ear1="Telos Earring",
		ear2="Cessance Earring",
		ring1="Regal Ring",
		ring2="Defending Ring",
		back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
	})
    sets.engaged.Mid.PDT = set_combine(sets.engaged.Mid, {
		ammo="Ginsen",
		head="Flam. Zucchetto +2",
		body="Tartarus Platemail",
		--body="Wakido Domaru +3",
		hands="Wakido Kote +3",
		legs="Kasuga Haidate +2",
		feet="Flam. Gambieras +2",
		neck="Loricate Torque +1",
		waist="Sarissaphoroi Belt",
		ear1="Telos Earring",
		ear2="Cessance Earring",
		ring1="Regal Ring",
		ring2="Defending Ring",
		back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
	})
    sets.engaged.Acc.PDT = set_combine(sets.engaged.Acc, {
		ammo="Ginsen",
		head="Flam. Zucchetto +2",
		body="Tartarus Platemail",
		--body="Wakido Domaru +3",
		hands="Wakido Kote +3",
		legs="Kasuga Haidate +2",
		feet="Flam. Gambieras +2",
		neck="Loricate Torque +1",
		waist="Sarissaphoroi Belt",
		ear1="Telos Earring",
		ear2="Cessance Earring",
		ring1="Regal Ring",
		ring2="Defending Ring",
		back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
	})
    
    sets.engaged.Amanomurakumo = set_combine(sets.engaged, {})
    sets.engaged.Amanomurakumo.AM = set_combine(sets.engaged, {})
    sets.engaged.Kogarasumaru = set_combine(sets.engaged, {})
    sets.engaged.Kogarasumaru.AM = set_combine(sets.engaged, {})
    sets.engaged.Kogarasumaru.AM3 = set_combine(sets.engaged, {})
    
    sets.buff.Sekkanoki = {}
    sets.buff.Sengikori = {}
    sets.buff['Meikyo Shisui'] = {}
    
    sets.thirdeye = {}
    sets.seigan = {head="Kasuga Kabuto +2",}
    sets.bow = {}
	sets.buff.Doom = {
	ring1="Saida Ring",
    ring2="Saida Ring",
	}
    
    -- sets.MadrigalBonus = {
    --     hands="Composer's Mitts"
    -- }
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks that are called to process player actions at specific points in time.
-------------------------------------------------------------------------------------------------------------------



-- Set eventArgs.handled to true if we don't want any automatic target handling to be done.
function job_pretarget(spell, action, spellMap, eventArgs)
	if spell.type:lower() == 'weaponskill' then
		-- Change any GK weaponskills to polearm weaponskill if we're using a polearm.
		if player.equipment.main =='Nativus Halberd' or player.equipment.main =='Quint Spear' then
			if spell.english:startswith("Tachi:") then
				send_command('@input /ws "Stardiver" '..spell.target.raw)
				eventArgs.cancel = true
			end
		end
	end
    if state.Buff[spell.english] ~= nil then
        state.Buff[spell.english] = true
    end
end

function job_precast(spell, action, spellMap, eventArgs)
    --if spell.english == 'Third Eye' and not buffactive.Seigan then
    --    cancel_spell()
    --    send_command('@wait 0.5;input /ja Seigan <me>')
    --    send_command('@wait 1;input /ja "Third Eye" <me>')
    --end
end
-- Run after the default precast() is done.
-- eventArgs is the same one used in job_precast, in case information needs to be persisted.


-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_midcast(spell, action, spellMap, eventArgs)
	if spell.action_type == 'Magic' then
		equip(sets.midcast.FastRecast)
	end
end

-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
	-- Effectively lock these items in place.
	if state.HybridMode.value == 'Reraise' or
    (state.HybridMode.value == 'Physical' and state.PhysicalDefenseMode.value == 'Reraise') then
		equip(sets.Reraise)
	end
    if state.Buff['Seigan'] then
        if state.DefenseMode.value == 'PDT' then
            equip(sets.thirdeye)
        else
            equip(sets.seigan)
        end
    end
end

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)
	if state.Buff[spell.english] ~= nil then
		state.Buff[spell.english] = not spell.interrupted or buffactive[spell.english]
	end
end



-- Modify the default melee set after it was constructed.
function customize_melee_set(meleeSet)
    if state.TreasureMode.value == 'Fulltime' then
        meleeSet = set_combine(meleeSet, sets.TreasureHunter)
    end
    if state.Buff['Seigan'] then
        if state.DefenseMode.value == 'PDT' then
    	    meleeSet = set_combine(meleeSet, sets.thirdeye)
        else
            meleeSet = set_combine(meleeSet, sets.seigan)
        end
    end
    if player.equipment.range == 'Yoichinoyumi' then
        meleeSet = set_combine(meleeSet, sets.bow)
    end
    return meleeSet
end

-------------------------------------------------------------------------------------------------------------------
-- Customization hooks for idle and melee sets, after they've been automatically constructed.
-------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------
-- General hooks for other events.
-------------------------------------------------------------------------------------------------------------------
function job_status_change(newStatus, oldStatus, eventArgs)
    if newStatus == 'Engaged' then
        if player.inventory['Eminent Arrow'] then
            gear.RAarrow.name = 'Eminent Arrow'
        elseif player.inventory['Tulfaire Arrow'] then
            gear.RAarrow.name = 'Tulfaire Arrow'
        --elseif player.equipment.ammo == 'empty' then
        --    add_to_chat(122, 'No more Arrows!')
        end
    elseif newStatus == 'Idle' then
        equip(sets.idle)
    end
end
-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    if state.Buff[buff] ~= nil then
    	state.Buff[buff] = gain
        handle_equipping_gear(player.status)
    end
	
	if buff == "doom" then
        if gain then
            equip(sets.buff.Doom)
            send_command('@input /p Doomed.')
            disable('ring1','ring2','waist')
			windower.send_command('input /item "Holy Water" '..windower.ffxi.get_player()["name"])
        else
            enable('ring1','ring2','waist')
            handle_equipping_gear(player.status)
        end
    end
    
    if not midaction() then
        handle_equipping_gear(player.status)
    end

end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements self-commands.
-------------------------------------------------------------------------------------------------------------------

-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
	get_combat_form()
    update_melee_groups()
    --get_combat_weapon()
end

-- Set eventArgs.handled to true if we don't want the automatic display to be run.
function display_current_job_state(eventArgs)

end

-- State buff checks that will equip buff gear and mark the event as handled.
function check_buff(buff_name, eventArgs)
    if state.Buff[buff_name] then
        equip(sets.buff[buff_name] or {})
        eventArgs.handled = true
    end
end
-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------
--function get_combat_weapon()
--    if player.equipment.range == 'Yoichinoyumi' then
--        if player.equipment.main == 'Amanomurakumo' then
--            state.CombatWeapon:set('AmanoYoichi')
--        else
--            state.CombatWeapon:set('Yoichi')
--        end
--    else
--        state.CombatWeapon:set(player.equipment.main)
--    end
--end
-- Handle zone specific rules
-- windower.register_event('Zone change', function(new,old)
--     determine_idle_group()
-- end)

function determine_idle_group()
    classes.CustomIdleGroups:clear()
    -- if areas.Adoulin:contains(world.area) then
    -- 	classes.CustomIdleGroups:append('Adoulin')
    -- end
end

function get_combat_form()
    -- if areas.Adoulin:contains(world.area) and buffactive.ionis then
    -- 	state.CombatForm:set('Adoulin')
    -- else
    --     state.CombatForm:reset()
    -- end
end

function seigan_thirdeye_active()
    return state.Buff['Seigan'] or state.Buff['Third Eye']
end

function update_melee_groups()
    classes.CustomMeleeGroups:clear()

    if player.equipment.main == 'Amanomurakumo' and state.YoichiAM.value then
        -- prevents using Amano AM while overriding it with Yoichi AM
        classes.CustomMeleeGroups:clear()
    elseif player.equipment.main == 'Kogarasumaru' then
        if buffactive['Aftermath: Lv.3'] then
            classes.CustomMeleeGroups:append('AM3')
        end
    else
        if buffactive['Aftermath'] then
            classes.CustomMeleeGroups:append('AM')
        end
    end
end
-- call this in job_post_precast() 

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
    	set_macro_page(1, 18)
    elseif player.sub_job == 'DRG' then
    	set_macro_page(1, 18)
    else
    	set_macro_page(1, 18)
    end
end

function set_lockstyle()
    send_command('wait 2; input /lockstyleset ' .. lockstyleset)
end
