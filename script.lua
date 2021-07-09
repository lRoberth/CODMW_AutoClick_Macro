Clicks = {}
Buttons = {
    ["L"] = 1, -- Click izquierdo
	["R"] = 2, -- Click derecho
	["C"] = 3, -- Boton ruedita
	["Back"] = 4, -- Boton lateral retroceder pagina
	["Forward"] = 5, -- Boton lateral avanzar pagina
	["Sniper"] = 6, -- Boton lateral sniper
	["L_DPI"] = 7, -- Boton disminuir DPI
	["M_DPI"] = 8, -- Boton aumentar DPI
	["PR"] = 9, -- Boton cambiar perfil
	["CL"] = 10, -- Ruedita del mouse hacia la izquierda
	["CR"] = 11, -- Ruedita del mouse hacia la derecha
}

function DoClick(btn, x, y, delay)
    Clicks[btn] = Clicks[btn] or {}
	table.insert(Clicks[btn], 
	{
	    x,
	    y,
	    delay
	})
end

DoClick("L_DPI", 21589, 50734, 100) -- Click en el primer compa
DoClick("L_DPI", 32575, 32198, 50) -- Boton confirmar

DoClick("M_DPI", 18567, 15894, 100) -- Click en el loadout
DoClick("M_DPI", 32575, 32198, 50) -- Boton confirmar

function table.KeyFromValue(tbl, value)
    for k, v in pairs(tbl) do
        if v == value then return k end
    end
    return nil
end

function OnEvent(event, arg)
    if event == "MOUSE_BUTTON_PRESSED" then
		_x, _y=GetMousePosition()
		OutputLogMessage(arg)
		OutputLogMessage("\n\nButton pressed: " .. arg .. " (" .. table.KeyFromValue(Buttons, arg) .. ")\nCurrent mouse position: x=" .. _x .. ",y=" .. _y)
		
		for k, v in pairs(Clicks) do
		    if arg ~=  Buttons[k] then goto continue end
		    for kk, vv in pairs(v) do
		        x = vv[1]
		        y = vv[2]
		        delay = vv[3]
		        
		        MoveMouseTo(x, y)
		        Sleep(delay)
		        PressMouseButton(1)
		        Sleep(20)
		        ReleaseMouseButton(1)
		        print("Clicked on " .. x .. ", " .. y)
		    end
		    ::continue::
		end
	end
end
