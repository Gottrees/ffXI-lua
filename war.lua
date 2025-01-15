include('organizer-lib')

function get_sets()
  --Variables
  TP_mode = 'Normal'
  WP_Mode = 'Single'

  sets.W = {} --Weapon Sets
  sets.W.GA_MAIN = {main="Ukonvasara",sub="Utu Grip",}
  sets.W.GS_MAIN = {main="Ragnarok",sub="Utu Grip",}
  sets.W.PA_MAIN = {main="Shining One",sub="Utu Grip",}
  sets.W.SW_MAIN_SH = {main="Naegling",sub="Blurred Shield +1",}
  sets.W.SW_MAIN_DH = {main="Naegling",sub="Barbarity",}
  sets.W.AX_MAIN_DH = {main="Kaja Axe",sub="Barbarity",}
  sets.W.AX_MAIN_SH = {main="Kaja Axe",sub="Blurred Shield +1",}

  sets.JA = {}
  sets.JA.Berserk = {
    body="Pumm. Lorica +3", 
    
  }
  sets.JA.Aggressor = {
   -- head="Pummeler's Mask +2", 
    --body={ name="Agoge Lorica", augments={'Enhances "Aggressive Aim" effect',}},
  }
  sets.JA.Warcry = {
    head={ name="Agoge Mask +3", augments={'Enhances "Savagery" effect',}},
  }
  sets.JA['Blood Rage'] = {
    body="Boii Lorica +2"
  }
  sets.JA['Mighty Strikes'] = {}
  sets.JA.Tomahawk = {ammo="Thr. Tomahawk",feet="Agoge Calligae"}
  sets.JA.Provoke = sets.Enmity
  sets.JA.Retaliation = {
    feet="Boii Calligae +3",
  }
  sets.JA.Restraint = {
    hands="Boii Mufflers +3",
  }

  sets.TP = {}
  sets.TP.Normal = {
    ammo="Yetshila +1",
    head="Boii Mask +3",
    body="Hjarrandi Breast.",
    hands="Flam. Manopolas +2",
    legs="Pumm. Cuisses +3",
    feet="Boii Calligae +3",
    neck={ name="War. Beads +1", augments={'Path: A',}},
    waist="Ioskeha Belt +1",
    left_ear="Cessance Earring",
    right_ear={ name="Boii Earring", augments={'System: 1 ID: 1676 Val: 0','Accuracy+6','Mag. Acc.+6',}},
    left_ring="Niqmaddu Ring",
    right_ring="Chirich Ring +1",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},
  }

  sets.TP.Dual = {
    ammo="Ginsen",
    head="Flam. Zucchetto +2",
    body="Pumm. Lorica +3",
    hands={ name="Emicho Gauntlets", augments={'Accuracy+20','"Dual Wield"+5','Pet: Accuracy+20',}},
    legs="Pumm. Cuisses +3",
    feet="Pumm. Calligae +3",
    neck={ name="Warrior's Beads", augments={'Path: A',}},
    waist="Ioskeha Belt",
    left_ear="Suppanomimi",
    right_ear="Brutal Earring",
    left_ring="Moonbeam Ring",
    right_ring="Flamma Ring",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},
  }

  sets.TP.Acc = {}
  sets.TP.DT = sets.DT
  
  sets.Enmity = {}
  sets.FC = {}
  
  
  
  sets.Idle = {
    ammo="Crepuscular Pebble",
    head="Boii Mask +3",
    body="Boii Lorica +2",
    hands="Boii Mufflers +3",
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet="Hermes' Sandals",
    neck={ name="War. Beads +1", augments={'Path: A',}},
    waist="Ioskeha Belt +1",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear={ name="Boii Earring", augments={'System: 1 ID: 1676 Val: 0','Accuracy+6','Mag. Acc.+6',}},
    left_ring="Defending Ring",
    right_ring="Moonlight Ring",
    back="Moonlight Cape",
  }
  
  sets.DT = {
    ammo="Crepuscular Pebble",
    head="Boii Mask +3",
    body="Boii Lorica +2",
    hands="Boii Mufflers +3",
    legs="Sakpata's Cuisses",
    feet="Boii Calligae +3",
    neck={ name="War. Beads +1", augments={'Path: A',}},
    waist="Ioskeha Belt +1",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear={ name="Boii Earring", augments={'System: 1 ID: 1676 Val: 0','Accuracy+6','Mag. Acc.+6',}},
    left_ring="Niqmaddu Ring",
    right_ring="Regal Ring",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},
  }

  sets.WS = {}
  --Great Axe WS
  sets.WS['Upheaval'] = {
    ammo="Knobkierrie",
    head={ name="Agoge Mask +3", augments={'Enhances "Savagery" effect',}},
    body="Pumm. Lorica +3",
    hands="Boii Mufflers +3",
    legs={ name="Valorous Hose", augments={'Accuracy+20 Attack+20','Crit. hit damage +4%','Accuracy+15','Attack+13',}},
    feet="Sulev. Leggings +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Thrud Earring",
    right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
    left_ring="Epaminondas's Ring",
    right_ring="Karieyh Ring",
    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
  }
  sets.WS["Ukko's Fury"] = {
    ammo="Knobkierrie",
    head={ name="Agoge Mask +3", augments={'Enhances "Savagery" effect',}},
    body="Pumm. Lorica +3",
    hands="Boii Mufflers +3",
    legs={ name="Valorous Hose", augments={'Accuracy+20 Attack+20','Crit. hit damage +4%','Accuracy+15','Attack+13',}},
    feet={ name="Valorous Greaves", augments={'"Mag.Atk.Bns."+9','"Cure" potency +2%','Weapon skill damage +9%','Accuracy+12 Attack+12',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Thrud Earring",
    right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
    left_ring="Epaminondas's Ring",
    right_ring="Karieyh Ring",
    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
  }
  sets.WS["Fell Cleave"] = {
    ammo="Knobkierrie",
    head={ name="Agoge Mask +3", augments={'Enhances "Savagery" effect',}},
    body="Pumm. Lorica +3",
    hands="Boii Mufflers +3",
    legs={ name="Valorous Hose", augments={'Accuracy+20 Attack+20','Crit. hit damage +4%','Accuracy+15','Attack+13',}},
    feet={ name="Valorous Greaves", augments={'"Mag.Atk.Bns."+9','"Cure" potency +2%','Weapon skill damage +9%','Accuracy+12 Attack+12',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Thrud Earring",
    right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
    left_ring="Epaminondas's Ring",
    right_ring="Karieyh Ring",
    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
  }

  sets.WS["Steel Cyclone"] = {
    ammo="Knobkierrie",
    head={ name="Agoge Mask +3", augments={'Enhances "Savagery" effect',}},
    body="Pumm. Lorica +3",
    hands="Boii Mufflers +3",
    legs={ name="Valorous Hose", augments={'Accuracy+20 Attack+20','Crit. hit damage +4%','Accuracy+15','Attack+13',}},
    feet={ name="Valorous Greaves", augments={'Accuracy+29','Crit. hit damage +4%','Attack+2',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Thrud Earring",
    right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
    left_ring="Epaminondas's Ring",
    right_ring="Karieyh Ring",
    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
  }

  --Axe Ws
  sets.WS['Decimation'] = {
    ammo="Seething Bomblet +1",
    head="Flam. Zucchetto +2",
    body="Flamma Korazin +2",
    hands="Sulev. Gauntlets +2",
    legs="Flamma Dirs +2",
    feet="Flam. Gambieras +2",
    neck="Flame Gorget",
    waist="Fotia Belt",
    left_ear="Ishvara Earring",
    right_ear="Brutal Earring",
    left_ring="Karieyh Ring",
    right_ring="Flamma Ring",
    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
  }

  sets.WS['Cloudsplitter'] = {
    ammo="Seething Bomblet +1",
    head="Flam. Zucchetto +2",
    body="Flamma Korazin +2",
    hands="Sulev. Gauntlets +2",
    legs="Flamma Dirs +2",
    feet="Flam. Gambieras +2",
    neck="Flame Gorget",
    waist="Fotia Belt",
    left_ear="Ishvara Earring",
    right_ear="Brutal Earring",
    left_ring="Karieyh Ring",
    right_ring="Flamma Ring",
    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
  }

  sets.WS['Shockwave'] = {
    ammo="Knobkierrie",
    head="Flam. Zucchetto +2",
    body="Flamma Korazin +2",
    hands="Flam. Manopolas +2",
    legs="Flamma Dirs +2",
    feet="Flam. Gambieras +2",
    neck={ name="Warrior's Beads", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Ishvara Earring",
    right_ear="Odnowa Earring",
    left_ring="Karieyh Ring",
    right_ring="Dim. Ring (Holla)",
    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
  }

  --Sword
  -- sets.WS['Savage Blade'] = {
  --   ammo="Seething Bomblet +1",
  --   head="Flam. Zucchetto +2",
  --   body="Flamma Korazin +2",
  --   hands="Flam. Manopolas +2",
  --   legs="Flamma Dirs +2",
  --   feet="Sulev. Leggings +2",
  --   neck={ name="Warrior's Beads", augments={'Path: A',}},
  --   waist="Ioskeha Belt",
  --   left_ear="Cessance Earring",
  --   right_ear="Brutal Earring",
  --   left_ring="Karieyh Ring",
  --   right_ring="Flamma Ring",
  --   back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
  -- }
  sets.WS['Savage Blade'] = {
    ammo="Knobkierrie",
    head={ name="Agoge Mask +3", augments={'Enhances "Savagery" effect',}},
    body="Pumm. Lorica +3",
    hands="Boii Mufflers +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Valorous Greaves", augments={'"Mag.Atk.Bns."+9','"Cure" potency +2%','Weapon skill damage +9%','Accuracy+12 Attack+12',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Thrud Earring",
    right_ear="Brutal Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Karieyh Ring",
    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
  }
  
  --Great Sword WS
  sets.WS.Resolution = {
    ammo="Knobkierrie",
    head={ name="Agoge Mask +3", augments={'Enhances "Savagery" effect',}},
    body="Pumm. Lorica +3",
    hands="Boii Mufflers +3",
    legs={ name="Valorous Hose", augments={'Accuracy+20 Attack+20','Crit. hit damage +4%','Accuracy+15','Attack+13',}},
    feet={ name="Valorous Greaves", augments={'Accuracy+29','Crit. hit damage +4%','Attack+2',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Thrud Earring",
    right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
    left_ring="Niqmaddu Ring",
    right_ring="Regal Ring",
    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
  }

  --Polearm WS
  sets.WS['Impulse Drive'] = {
    ammo="Knobkierrie",
    head={ name="Agoge Mask +3", augments={'Enhances "Savagery" effect',}},
    body="Pumm. Lorica +3",
    hands="Boii Mufflers +3",
    legs={ name="Valorous Hose", augments={'Accuracy+20 Attack+20','Crit. hit damage +4%','Accuracy+15','Attack+13',}},
    feet={ name="Valorous Greaves", augments={'Accuracy+29','Crit. hit damage +4%','Attack+2',}},
    neck={ name="War. Beads +1", augments={'Path: A',}},
    waist="Prosilio Belt +1",
    left_ear="Thrud Earring",
    right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
    left_ring="Karieyh Ring",
    right_ring="Begrudging Ring",
    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','Crit.hit rate+10',}},
  }
  
  sets.WS.Stardiver = {
    ammo="Knobkierrie",
    head={ name="Agoge Mask +3", augments={'Enhances "Savagery" effect',}},
    body="Pumm. Lorica +3",
    hands="Boii Mufflers +3",
    legs={ name="Valorous Hose", augments={'Accuracy+20 Attack+20','Crit. hit damage +4%','Accuracy+15','Attack+13',}},
    feet={ name="Valorous Greaves", augments={'Accuracy+29','Crit. hit damage +4%','Attack+2',}},
    neck={ name="War. Beads +1", augments={'Path: A',}},
    waist="Prosilio Belt +1",
    left_ear="Thrud Earring",
    right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
    left_ring="Karieyh Ring",
    right_ring="Begrudging Ring",
    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','Crit.hit rate+10',}},
  }
  --Magic
  sets.WS.Gavialis = {}
  
  --send_command('input /lockstyleset 1')
end

function precast(spell)
    if spell.cast_time then
        equip(sets.FC)
    end
end

function midcast(spell)
    if sets.JA[spell.english] then
        equip(sets.JA[spell.english])
    elseif sets.WS[spell.english] then
        equip(sets.WS[spell.english])
        if sets.WS[spell.english].Gavialis and sets.WS[spell.english].Gavialis[world.day] then
            equip(sets.WS.Gavialis)
        end
    end
end

function aftercast(spell)
    if player.status == 'Engaged' then
        equip(sets.TP[TP_mode])
    else
        equip(sets.Idle)
    end
end

function status_change(new,old)
    if T{'Idle','Resting'}:contains(new) then
        equip(sets.Idle)
    elseif new == 'Engaged' then
        equip(sets.TP[TP_mode])
    end
end

function sub_job_change(new,old)
  send_command('wait 2;input /lockstyleset 1')
  if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
    WP_Mode = 'Dual'
  else
    WP_Mode = 'Single'
  end
end

function self_command(command)
  local cType
  cType = string.sub(command,1,2)
  if cType == 'we' then
    equip_weapon(command)
  elseif cType == 'e2' then
    send_to_mule(command)
  elseif command == 'DT' then
    equip(sets.DT)
  elseif command == 'TP' then
    if TP_mode=="Acc" then
      TP_mode="Normal"
    elseif TP_mode=="Normal" then
       TP_mode="DT"
    elseif TP_mode=="DT" then
       TP_mode='Acc'
    end
    windower.add_to_chat('TP mode is now: '..TP_mode)
    equip(sets.TP[TP_mode])
  end
end

function equip_weapon(cmd)
  if cmd == 'wega' then
    equip(sets.W.GA_MAIN)
    send_command('input /macro book 1;wait .1;input /macro set 1')
    windower.add_to_chat('Main GA Equiped')
  elseif cmd == 'wegs' then
    equip(sets.W.GS_MAIN)
    send_command('input /macro book 1;wait .1;input /macro set 2')
    windower.add_to_chat('Main GS Equiped')
  elseif cmd == 'wepa' then
    equip(sets.W.PA_MAIN)
    -- send_command('input /macro book 1;wait .1;input /macro set 2')
    windower.add_to_chat('Main Polearm Equiped')
  elseif cmd == 'wesw' then
    if WP_Mode == 'Dual' then
      equip(sets.W.SW_MAIN_DH)
      -- send_command('input /macro book 1;wait .1;input /macro set 3')
      windower.add_to_chat('Main Sword Equiped - Dual Handed')
    else
      equip(sets.W.SW_MAIN_SH)  
      -- send_command('input /macro book 1;wait .1;input /macro set 2')
      windower.add_to_chat('Main Sword Equiped - Single Handed')
    end
  elseif cmd == 'weax' then
      if WP_Mode == 'Dual' then
        equip(sets.W.AX_MAIN_DH)
        send_command('input /macro book 1;wait .1;input /macro set 3')
        windower.add_to_chat('Main Axes Equiped - Dual Handed')
      else
        equip(sets.W.AX_MAIN_SH)
        send_command('input /macro book 1;wait .1;input /macro set 4')
        windower.add_to_chat('Main Axe Equiped - Single Handed')
      end
  end
end