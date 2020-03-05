Config                            = {}

Config.DrawDistance               = 3.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 0.5 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }


Config.BlackjackSites = {

	Croupier = {
		Pos   = { x = 1023.76, y = 61.59, z = -72.48-0.9 },
		Size  = { x = 1.0, y = 1.0, z = 1.0 },
		Color = { r = 4, g = 240, b = 0 },
		Type  = 26,
	},
	Player1 = {
		Pos   = { x = 1024.6, y = 63.31, z = 72.48-0.9 },
		Size  = { x = 1.0, y = 1.0, z = 1.0 },
		Color = { r = 4, g = 240, b = 0 },
		Type  = 26,
	},
	Player2 = {
		Pos   = { x = 1022.34, y = 62.82, z = 72.48-0.9 },
		Size  = { x = 1.0, y = 1.0, z = 1.0 },
		Color = { r = 4, g = 240, b = 0 },
		Type  = 26,
	},

}
Config.JobBlip = {
	coord = vector3(425.1, -979.5, 30.7),
	sprite = 500,
	display = 4,
	scale = 1.2,
	colour = 63,
	name = 'Casino'
}