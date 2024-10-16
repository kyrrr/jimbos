--- STEAMODDED HEADER
--- MOD_NAME: dogmod
--- MOD_ID: dogmod
--- MOD_AUTHOR: [dog]
--- MOD_DESCRIPTION: Donkey brained mod testing
--- DEPENDENCIES: [Steamodded>=1.0.0~ALPHA-0812d]
--- BADGE_COLOR: c7638f
--- PREFIX: dogmod
----------------------------------------------
------------MOD CODE -------------------------

-- BEGIN THEFT
SMODS.Atlas {
  key = "dogdecks",
  path = "dogdecks.png",
  px = 71,
  py = 95
}


SMODS.Joker {
  key = 'myjoker',
  loc_txt = {
    name = 'My Joker',
    text = {
      "{C:mult}+#1# {} Mult"
    }
  },
  config = { extra = { mult = 666 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult } }
  end,
  rarity = 1,
  atlas = 'dogdecks',
  pos = { x = 0, y = 0 }, -- TODO: art
  cost = 2,
  discovered = true,
  calculate = function(self, context)        --define calculate functions here
    if context.individual and context.cardarea == G.play and not context.blueprint then
        if context.other_card:get_id() == 11 or context.other_card:get_id() == 13 or next(find_joker("Pareidolia")) then
            local suit_prefix = SMODS.Suits[context.other_card.base.suit].card_key .. '_'
            context.other_card:set_base(G.P_CARDS[suit_prefix .. 'Q'])
            return {
                message = localize { "Slay!" }
            }
        end
    end
end
 -- calculate = function(self, card, context)
  --  if context.joker_main then
  --    return {
  --      mult_mod = card.ability.extra.mult,
  --      message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
  --    }
  --  end
  --end
}

SMODS.Joker {
      key = "slayer",
      loc_txt = {
        name = 'Slayer',
        text = {
          "All scored {C:attention}Face{} cards", --description text.		
          "become {C:attention}Queens{}",        --you can add as many lines as you want
          "{C:inactive}(yup){}"              --more than 5 lines look odd
        }
      },
      config = { extra = { mult = 0, x_mult = 0 } }, --variables used for abilities and effects.
      pos = { x = 0, y = 0 },                    --pos in spirtesheet 0,0 for single sprites or the first sprite in the spritesheet
      rarity = 3,                                --rarity 1=common, 2=uncommen, 3=rare, 4=legendary
      cost = 7,                                  --cost to buy the joker in shops
      blueprint_compat = false,                  --does joker work with blueprint
      eternal_compat = true,                     --can joker be eternal
      unlocked = true,                           --joker is unlocked by default
      discovered = true,                         --joker is discovered by default
      atlas = 'dogdecks', --nil,                               --defines the atlas that you want to use for the sprite sheet. atlas=nil if you want to use single sprites
      soul_pos = nil,                            --pos of a soul sprite.

      calculate = function(self, context)        --define calculate functions here
          if context.individual and context.cardarea == G.play and not context.blueprint then
              if context.other_card:get_id() == 11 or context.other_card:get_id() == 13 or next(find_joker("Pareidolia")) then
                  local suit_prefix = SMODS.Suits[context.other_card.base.suit].card_key .. '_'
                  context.other_card:set_base(G.P_CARDS[suit_prefix .. 'Q'])
                  return {
                      message = localize { "Slay!" }
                  }
              end
          end
      end
}


SMODS.Back {
  key = "my_deck",
  name = 'MY DECK',
  loc_txt = {
      name = 'My Deck',
      text = {
          "it's my deck",
          "only mine"
      }
  },
  atlas = "dogdecks",
  pos = {x = 0, y = 0},
  discovered = true,
  unlocked = true,
  config = {
      discards = 100,
      consumables = {
      },
      foo_jokers = {
      --  'j_dogdmod_slayer'
     --  'j_blueprint',
       'j_dogmod_myjoker',
      -- 'j_dogmod_lucky_seven'
       -- 'j_dogmod_charm'
      }
  }
}





--- END THEFT



-- CUSTOM DECKS
local NAME = "My Deck"




local back_apply_to_run_ref = Back.apply_to_run
function Back:apply_to_run()
    back_apply_to_run_ref(self)

    if self.effect.config.foo_jokers then
      delay(0.4)
      G.E_MANAGER:add_event(Event({
          func = function()
              G.E_MANAGER:add_event(Event({
                  func = function()
                      for k, v in ipairs(self.effect.config.foo_jokers) do
                         local card = create_card('Joker', G.jokers, nil, nil, nil, nil, v, 'deck')
                         card:add_to_deck()
                         G.jokers:emplace(card)
                      end
                  return true
                  end
              }))
          return true
          end
      }))
  end
end

----------------------------------------------
------------MOD CODE END----------------------
