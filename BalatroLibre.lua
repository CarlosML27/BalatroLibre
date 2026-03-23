--- STEAMODDED HEADER
--- MOD_NAME: Balatro Libre
--- MOD_ID: BalatroLibre
--- MOD_AUTHOR: [CarlosML27]
--- MOD_DESCRIPTION: Pro Wrestling Mod for Balatro
--- PREFIX: libre
--- VERSION: 0.0.1

----------------------------------------------
---------------- ATLAS -----------------------
----------------------------------------------

SMODS.Atlas({
    key = "libre_jokers",
    path = "jokers.png",
    px = 71,
    py = 95
})

----------------------------------------------
---------------- JOKERS ----------------------
----------------------------------------------

-- EL MANAGER
-- Sin Marca | Rol
-- Al final de cada ronda, gana $2.
SMODS.Joker({
    key = 'el_manager',
    loc_txt = {
        name = 'El Manager',
        text = {
            'At the end of the round,',
            '{C:money}earn $#1#{}'
        }
    },
    config = { extra = { money = 2 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.money } }
    end,
    rarity = 1,
    cost = 5,
    atlas = 'libre_jokers',
    pos = { x = 0, y = 0 },
    calculate = function(self, card, context)
        if context.end_of_round and not context.individual and not context.repetition and not context.blueprint then
            return {
                message = localize('k_plus_dollars'),
                colour = G.C.MONEY,
                dollars = card.ability.extra.money
            }
        end
    end
})
