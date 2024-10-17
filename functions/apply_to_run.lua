local Backapply_to_runRef = Back.apply_to_run
function Back.apply_to_run(arg_56_0)
  Backapply_to_runRef(arg_56_0)

  if arg_56_0.effect.config.mmc_foobar then
    G.E_MANAGER:add_event(Event({
        func = function()
            -- Add whatever
            for i = #G.playing_cards, 1, -1 do
                -- Remove non prime cards
                if not (is_rank(G.playing_cards[i], 7) or is_rank(G.playing_cards[i], 11)) then
                  G.playing_cards[i]:start_dissolve(nil, true)
                end
            end
          --  add_joker("j_mmc_lucky7")
            --add_joker("j_mmc_salary_man")
         --   add_joker("j_mmc_fixed_odds")
         --   add_joker("j_midas_mask")
         --   add_joker("j_ticket")
            --add_joker("j_mmc_committed")
           -- add_joker("j_hack", "negative", true, false)
            --add_joker("j_midas_mask", "negative", true, false)
            G.GAME.starting_deck_size = 8
            return true
        end
    }))
    end
end