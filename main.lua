-----------------------------------------------------------------------------------------
--
-- main.lua
--
-- Created by Amin Zeina
-- Created on Mar 2018
--
-- Calculates cost of a pizza 
-----------------------------------------------------------------------------------------

display.setDefault( 'background', 1, 1, 1 )

local subtotal = nil

local instructions = display.newText( 'Enter # of toppings between 1-4:', 840, 200, native.systemFont, 110)
instructions:setTextColor( 0.5, 0.8, 0)
instructions.id = 'instructions text'
local toppingsTextField = native.newTextField( 1825, 200, 300, 110)
toppingsTextField.id = 'enter toppings'
local enterLarge = display.newImageRect( './assets/sprites/largeButton.png', 700, 400)
enterLarge.x = 550
enterLarge.y = 600
enterLarge.id = 'Enter Large Button'
local enterXLarge = display.newImageRect( './assets/sprites/xlargeButton.png', 700, 400)
enterXLarge.x = 1500
enterXLarge.y = 600
enterXLarge.id = 'Enter XLarge Button'

local function calculatePrice( event )
	local tax = subtotal * 0.13
	local total = subtotal + tax
	local showSubtotal = display.newText( 'Subtotal: $' .. string.format("%.2f", subtotal), 500, 900, native.systemFont, 128 )
	showSubtotal:setTextColor( 0.5, 0.8, 0 )
	local showTax = display.newText( 'Tax: $' .. string.format("%.2f", tax), 400, 1100, native.systemFont, 128 )
	showTax:setTextColor( 0.5, 0.8, 0 )
	local showTotal = display.newText( 'Total: $' .. string.format("%.2f", total), 500, 1300, native.systemFont, 128 )
	showTotal:setTextColor( 0.5, 0.8, 0 )
end

local function onLargeClicked( event )
	-- 

	local toppings = tonumber( toppingsTextField.text )

	if toppings == 1 then
		subtotal = 6 + 1
		calculatePrice()
	elseif toppings == 2 then
		subtotal = 6 + 1.75
		calculatePrice()
	elseif toppings == 3 then
		subtotal = 6 + 2.5
		calculatePrice()
	elseif toppings == 4 then
		subtotal = 6 + 3.35
		calculatePrice()
	else 
		local errorText = display.newText( 'Invalid # of toppings', display.contentCenterX, 1100, native.systemFont, 128 )
		errorText:setTextColor( 0.5, 0.8, 0 )
	end	
end

local function onExtraLargeClicked( event )
	local toppings = tonumber( toppingsTextField.text )
	if toppings == 1 then
		subtotal = 10 + 1
		calculatePrice()
	elseif toppings == 2 then
		subtotal = 10 + 1.75
		calculatePrice()
	elseif toppings == 3 then
		subtotal = 10 + 2.5
		calculatePrice()
	elseif toppings == 4 then
		subtotal = 10 + 3.35
		calculatePrice()
	else 
		local errorText = display.newText( 'Invalid # of toppings', display.contentCenterX, 1100, native.systemFont, 128 )
		errorText:setTextColor( 0.5, 0.8, 0 )
	end	
end

enterLarge:addEventListener( 'touch', onLargeClicked)
enterXLarge:addEventListener( 'touch', onExtraLargeClicked)