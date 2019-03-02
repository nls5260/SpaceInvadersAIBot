local _M = {}

--Change BizhawkDir to your BizHawk directory.
_M.BizhawkDir = "C:/Users/frank/OneDrive/Desktop/BizHawk/"

_M.StateDir = _M.BizhawkDir .. "Lua/NES/TetrisAIBot/state/"
_M.PoolDir = _M.BizhawkDir .. "Lua/NES/TetrisAIBot/pool/"

_M.NeatConfig =
{
        Filename = "Level9.state",
        Population = 300,
        DeltaDisjoint = 2.0,
        DeltaWeights = 0.4,
        DeltaThreshold = 1.0,
        StaleSpecies = 15,
        MutateConnectionsChance = 0.25,
        PerturbChance = 0.90,
        CrossoverChance = 0.75,
        LinkMutationChance = 2.0,
        NodeMutationChance = 0.50,
        BiasMutationChance = 0.40,
        StepSize = 0.1,
        DisableMutationChance = 0.4,
        EnableMutationChance = 0.2,
        TimeoutConstant = 20,
        MaxNodes = 1000000,
}

_M.ButtonNames =
{
        "A",
	"B",
	"Up",
	"Down",
	"Left",
	"Right",
}

_M.BoxRadius = 6 --TODO Fix
_M.InputSize = (_M.BoxRadius*2+1)*(_M.BoxRadius*2+1) --TODO Fix

_M.Running = false

return _M
