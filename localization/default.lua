return {
	["misc"] = {
		["dictionary"] = {
			["dogmod_lucky"] = "Lucky!",
			["dogmod_payday"] = "Payday!",
			["dogmod_raise"] = "Raise!",
			["dogmod_rank_up"] = "Rank up!",
			["dogmod_lucky_seven_t1"] = "Lucky 7 Tier 1",
			["dogmod_lucky_seven_t2"] = "Lucky 7 Tier 2",
			["dogmod_salary_man_t1"] = "Salary Man Tier 1",
			["dogmod_salary_man_t2"] = "Salary Man Tier 2",
		}
	},
    ["descriptions"] = {
		["Joker"] = {
			['j_dogmod_lucky_seven_t1'] = {
				["name"] = "Lucky 7",
				["text"] = {
					"All played {C:attention}7s{}",
					"become {C:gold}Lucky{} cards",
					"when scored"
				}
			},
			['j_dogmod_lucky_seven_t2'] = {
				["name"] = "Lucky 7+",
				["text"] = {
					"All played {C:attention}7s{}",
					"become {C:gold}Lucky{} cards",
					"when scored.",
					"Also adds {C:gold}Gold seal{} if",
					"no other seals are present."
				}
			},
			["j_dogmod_committed_joker"] = {
				["name"] = "Committed Joker",
				["text"] = {
					"Retriggers all scored cards #1# time(s)",
					"if played hand is your",
					"{C:attention}most played{} hand"
				}
			},
			["j_dogmod_salary_man_t1"] = {
				["name"] = "Salary Man",
				["text"] = {
					"Gain {C:attention}$#1#{} after",
      				"{C:attention}#2#{} hands played.",
      				"Increases by {C:attention}$#3#{} every payout.",
      				"({C:attention}#4#{} remaining)"
				}
			},
			["j_dogmod_salary_man_t2"] = {
				["name"] = "CEO",
				["text"] = {
					"Gain {C:attention}$#1#{} after",
      				"{C:attention}#2#{} hands played.",
      				"Increases by {C:attention}$#3#{} every payout.",
      				"({C:attention}#4#{} remaining)"
				}
			},
		},
    }
}