-- thanks to JokerEvolution mod!!
function Card:rank_up()
	G.CONTROLLER.locks.selling_card = true
    stop_use()
    local area = self.area
    G.CONTROLLER:save_cardarea_focus('jokers')

	G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
		play_sound('whoosh1')
		self:juice_up(0.3, 0.4)
		return true
	end}))

	delay(0.2)

	G.E_MANAGER:add_event(Event({trigger = 'immediate', func = function()
		self:start_materialize({G.C.MONEY}, true)
		play_sound('explosion_release1')
		self:juice_up(0.3, 0.5)

		self.ability.extra.tier = self.ability.extra.tier + 1
		self.sell_cost = self.sell_cost + 2

		print(inspect(self))
		-- TOOD: not like this

		if type(self.ability.extra.atlasPosXtier2) == "number" and type(self.ability.extra.atlasPosYtier2) == "number" then
			self.children.center.sprite_pos = {x = self.ability.extra.atlasPosXtier2, y = self.ability.extra.atlasPosYtier2}
			-- will this help with a copy using the same sprite pos?
			self.pos = {x = self.ability.extra.atlasPosXtier2, y = self.ability.extra.atlasPosYtier2}
		end

		-- TODO: this should be handled in the Jimbo
		if self.ability.name == 'j_dogmod_salary_man' then
			self.ability.extra.payout = 150
			self.ability.extra.raise = 25
		--elseif self.params.name == 'j_dogmod_lucky_seven' then -- handled in calculate
		--elseif self.ability.name == 'j_dogmod_committed_joker' then -- handled in calculate
		elseif self.ability.name == 'Baron' then
			self.ability.extra.multmult = 2 -- see lovely.toml
		elseif self.ability.name == 'Bloodstone' then
			self.ability.extra.odds = 1 -- see lovely.toml
		end

		G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.3, blocking = false, func = function()
			card_eval_status_text(self, 'extra', nil, nil, nil, {message = localize("dogmod_rank_up"), colour = G.C.MONEY})
			return true
		end}))

		delay(0.1)

		G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blocking = false,
		func = function()
			G.E_MANAGER:add_event(Event({trigger = 'immediate',
			func = function()
				G.E_MANAGER:add_event(Event({trigger = 'immediate',
				func = function()
					G.CONTROLLER.locks.selling_card = nil
					G.CONTROLLER:recall_cardarea_focus(area == G.jokers and 'jokers' or 'consumeables')
				return true
				end}))
			return true
			end}))
		return true
		end}))
		return true
	end}))

	G.CONTROLLER.locks.selling_card = nil
	G.CONTROLLER:recall_cardarea_focus('jokers')
end