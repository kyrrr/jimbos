return {
	["misc"] = {
		["dictionary"] = {
			["dogmod_lucky"] = "Lucky!",
			["dogmod_payday"] = "Payday!",
			["dogmod_raise"] = "Raise!",
			["dogmod_rank_up"] = "Rank up!",
		}
	},
    ["descriptions"] = {
		["Joker"] = {
			-- tiered vanilla jimbos
			['j_dogmod_baron_t1'] = {
				["name"] = "Baron",
				["text"] = {
					"Each {C:attention}King{}",
                    "held in hand",
                    "gives {X:mult,C:white} X#1# {} Mult",
				}
			},
			['j_dogmod_baron_t2'] = {
				["name"] = "Baron+",
				["text"] = {
					"Each {C:attention}King{}",
                    "held in hand",
                    "gives {X:mult,C:white} X#1# {} Mult",
				}
			},
			['j_dogmod_bloodstone_t1'] = {
				["name"] = "Bloodstone",
				["text"] = {
                    "{C:green}#1# in #2#{} chance for",
                    "played cards with",
                    "{C:hearts}Heart{} suit to give",
                    "{X:mult,C:white} X#3# {} Mult when scored", 
                },
			},
			['j_dogmod_bloodstone_t2'] = {
				["name"] = "Bloodstone+",
				["text"] = {
                    "Played cards with {C:hearts}Heart{} suit give",
                    "{X:mult,C:white} X#3# {} Mult when scored", 
                },
			},
			-- custom jimbos
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